From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Jul 2019 09:33:22 +0000
Subject: Re: ima: Replace two seq_printf() calls by seq_puts() in ima_show_template_data_ascii()
Message-Id: <6b7db918-8d0b-b280-91e4-c15e22451cfc@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e96eac40-0745-80b5-6aab-f872e6415031@web.de>
 <d94bfdb9d53b46059787b9bdd10c5919@AcuMS.aculab.com>
In-Reply-To: <d94bfdb9d53b46059787b9bdd10c5919@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Laight <David.Laight@ACULAB.COM>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org
Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>, Mimi Zohar <zohar@linux.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> So this is probably just a minor performance improvement in a code
> path where it really doesn't matter.

I imagine that another small software adjustment can help a bit
to get nicer run time characteristics also at this place.


>> +++ b/security/integrity/ima/ima_template_lib.c
>> @@ -74,7 +74,7 @@ static void ima_show_template_data_ascii(struct seq_file *m,
>>  	case DATA_FMT_DIGEST_WITH_ALGO:
>>  		buf_ptr = strnchr(field_data->data, buflen, ':');
>>  		if (buf_ptr != field_data->data)
>> -			seq_printf(m, "%s", field_data->data);
>> +			seq_puts(m, field_data->data);
>>
>>  		/* skip ':' and '\0' */
>>  		buf_ptr += 2;
>
> That code looks highly suspect!

Would you like to change this implementation detail any more?

Regards,
Markus
