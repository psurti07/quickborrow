<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EasebuzzEntry extends Model
{
    use HasFactory;

    protected $table = 'easebuzz_entry';

    protected $fillable = ['id', 'rec_date', 'entryfor', 'userid', 'orderid', 'orderamount', 'ordernote', 'statuscode', 'transactionid', 'paymentmode'];

    public $timestamps = false;
}
