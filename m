From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Oct 2017 13:51:09 +0000
Subject: Re: [PATCH] tpm_tis_core: Use common error handling code in tpm_tis_send_data()
Message-Id: <455e93f6-c419-8318-6129-80e99fc8552f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fb0a6fbb-db2f-ce3f-f1c2-02f934accc4e@users.sourceforge.net>
 <20171023134202.d6td6vvhd7pfv5ue@linux.intel.com>
In-Reply-To: <20171023134202.d6td6vvhd7pfv5ue@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, linux-integrity@vger.kernel.org
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, =?UTF-8?Q?Peter_H=c3=bcwe?= <PeterHuewe@gmx.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> @@ -315,6 +311,8 @@ static int tpm_tis_send_data(struct tpm_chip *chip, const u8 *buf, size_t len)
>>  
>>  	return 0;
>>  
>> +report_timeout:
>> +	rc = -ETIME;
>>  out_err:
>>  	tpm_tis_ready(chip);
>>  	return rc;
>> -- 
>> 2.14.2
>>
> 
> NAK. wait_for_tpm_stat() should give that error code.

This is a pity that you reject another bit of code reduction.

Regards,
Markus
