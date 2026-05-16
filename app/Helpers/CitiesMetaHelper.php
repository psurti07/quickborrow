<?php

use Illuminate\Support\Facades\Log;

/* Home meta tags */
if(!function_exists('surat')){
    function surat(){
        $meta = [
            "title" => "Personal Loan in Surat – Instant Approval | QuikBorrow",
            "description" => "Apply for a personal loan in Surat with QuikBorrow. Get quick approval, minimal documents & best interest rates from top NBFCs. Check eligibility now!",
            "keywords" =>  "personal loan in Surat, Surat personal loan, instant personal loan Surat, personal loan NBFC Surat, low interest loan in Surat, QuikBorrow loan Surat"
        ];
        return $meta;
    }
}
