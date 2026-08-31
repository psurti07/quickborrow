<?php

namespace App\Libraries\Easebuzz;

class Easebuzz
{
    /* ===============================
        INITIATE PAYMENT
    =============================== */
    public function initiate_payment($params, $merchant_key, $salt, $env)
    {
        $result = $this->_payment($params,$merchant_key,$salt,$env);
        return $this->_paymentResponse($result);
    }

    protected function _payment($params, $merchant_key, $salt, $env)
    {
        $params['key'] = $merchant_key;

        $posted = $this->preparePostArray($params);

        $this->emptyValidation($posted, $salt);

        $posted['amount'] = number_format(
            (float) $posted['amount'],
            2,
            '.',
            ''
        );

        $posted['hash'] = $this->generateHash(
            $posted,
            $salt
        );

        $url = strtoupper($env) === 'PROD'
            ? 'https://pay.easebuzz.in/'
            : 'https://testpay.easebuzz.in/';

        return $this->pay($posted, $url);
    }

    protected function preparePostArray($params)
    {
        return [
            'key'         => trim($params['key']),
            'txnid'       => trim($params['txnid']),
            'amount'      => trim($params['amount']),
            'firstname'   => trim($params['firstname']),
            'email'       => trim($params['email']),
            'phone'       => trim($params['phone']),
            'productinfo' => trim($params['productinfo']),
            'surl'        => trim($params['surl']),
            'furl'        => trim($params['furl']),
        ];
    }

    protected function emptyValidation($params, $salt)
    {
        foreach ($params as $key => $value) {

            if (empty($value)) {
                throw new \Exception(
                    "{$key} cannot be empty"
                );
            }
        }

        if (empty($salt)) {
            throw new \Exception('Salt key missing');
        }
    }

    protected function generateHash($data, $salt)
    {
        $sequence =
            "key|txnid|amount|productinfo|firstname|email|" .
            "udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";

        $hashString = '';

        foreach (explode('|', $sequence) as $field) {
            $hashString .= ($data[$field] ?? '') . '|';
        }

        return strtolower(
            hash('sha512', $hashString . $salt)
        );
    }

    protected function pay($params, $url)
    {
        $apiUrl = $url . 'payment/initiateLink';

        $ch = curl_init();

        curl_setopt_array($ch, [
            CURLOPT_URL => $apiUrl,
            CURLOPT_POST => true,
            CURLOPT_POSTFIELDS => http_build_query($params),
            CURLOPT_RETURNTRANSFER => true,

            // Timeout is important
            CURLOPT_CONNECTTIMEOUT => 10,
            CURLOPT_TIMEOUT => 30,

            // For production, SSL verification should be enabled
            CURLOPT_SSL_VERIFYHOST => 0,
            CURLOPT_SSL_VERIFYPEER => 0,

            CURLOPT_HTTPHEADER => [
                'Content-Type: application/x-www-form-urlencoded',
            ],
        ]);

        $response = curl_exec($ch);

        $curlError = curl_error($ch);
        $curlErrno = curl_errno($ch);

        $httpCode = curl_getinfo(
            $ch,
            CURLINFO_HTTP_CODE
        );

        curl_close($ch);

        if ($response === false) {
            throw new \Exception(
                'Easebuzz CURL error: ' . $curlError
            );
        }

        $decoded = json_decode($response, true);

        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new \Exception(
                'Invalid Easebuzz JSON response: ' . $response
            );
        }

        return $decoded;
    }

    protected function _paymentResponse($result)
    {
        $result = (array) $result;

        if (
            isset($result['status']) &&
            (int) $result['status'] === 1 &&
            !empty($result['data'])
        ) {

            $paymentUrl = $this->getRedirectUrl(
                $result['data']
            );

            // IMPORTANT:
            // DO NOT header() and DO NOT exit here.
            return [
                'status' => 1,
                'data' => $result['data'],
                'payment_url' => $paymentUrl,
            ];
        }

        return [
            'status' => 0,
            'message' => $result['message'] ?? 'Easebuzz payment initiation failed.',
            'data' => $result,
        ];
    }

    protected function getRedirectUrl($accessKey)
    {
        return 'https://pay.easebuzz.in/pay/' . $accessKey;
    }

    /* ===============================
        RESPONSE VERIFY
    =============================== */

    public function response($response, $salt)
    {
        $generatedHash = $this->reverseHash(
            $response,
            $salt
        );

        if ($generatedHash !== $response['hash']) {

            return [
                'status' => 0,
                'message' => 'Hash mismatch'
            ];
        }

        return [
            'status' => 1,
            'data' => $response
        ];
    }

    protected function reverseHash($response, $salt)
    {
        $sequence = [
            'udf10',
            'udf9',
            'udf8',
            'udf7',
            'udf6',
            'udf5',
            'udf4',
            'udf3',
            'udf2',
            'udf1',
            'email',
            'firstname',
            'productinfo',
            'amount',
            'txnid',
            'key'
        ];

        $hashString = $salt . '|' . $response['status'];

        foreach ($sequence as $field) {
            $hashString .= '|' . ($response[$field] ?? '');
        }

        return strtolower(
            hash('sha512', $hashString)
        );
    }
}