From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 16:50:29 +0000
Subject: Re: [PATCH 1/6] [media] tda8261: Use common error handling code in tda8261_set_params()
Message-Id: <792ce307-e8a1-8159-c601-f3188fa82226@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <15d74bee-7467-4687-24e1-3501c22f6d75@users.sourceforge.net>
 <28425caf-2736-96ae-00a7-3fb273b1f9d5@users.sourceforge.net>
 <bcf8d922-fde7-59a0-f3d9-3f16a2a62d9b@boehmwalder.at>
In-Reply-To: <bcf8d922-fde7-59a0-f3d9-3f16a2a62d9b@boehmwalder.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph@boehmwalder.at>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> @@ -129,18 +129,18 @@ static int tda8261_set_params(struct dvb_frontend *fe)
>>  
>>  	/* Set params */
>>  	err = tda8261_write(state, buf);
>> -	if (err < 0) {
>> -		pr_err("%s: I/O Error\n", __func__);
>> -		return err;
>> -	}
>> +	err = tda8261_get_status(fe, &status);
>> +	if (err < 0)
>> +		goto report_failure;
>> +
> 
> Is this change really correct? Doesn't it query the status once more
> often than before?

Thanks for your inquiry.

Unfortunately, I made a copy mistake at this source code place.
When should I send a corrected suggestion for this update step
in the patch series?

Regards,
Markus
