From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Oct 2017 13:57:30 +0000
Subject: Re: [PATCH 1/2] xen-tpmfront: Use common error handling code in vtpm_send()
Message-Id: <f68ee5b6-2da1-e3c8-4d0d-f13a0563385e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cf592c7d-8fbc-833b-fa1a-ff9e91c3734c@users.sourceforge.net>
 <9cfcbfd0-75c3-4de5-f735-0ace23d2abcb@users.sourceforge.net>
 <20171023134257.txnpbg5c5z7uaquf@linux.intel.com>
In-Reply-To: <20171023134257.txnpbg5c5z7uaquf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, linux-integrity@vger.kernel.org
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, =?UTF-8?Q?Peter_H=c3=bcwe?= <PeterHuewe@gmx.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> @@ -108,11 +106,14 @@ static int vtpm_send(struct tpm_chip *chip, u8 *buf, size_t count)
>>  	if (wait_for_tpm_stat(chip, VTPM_STATUS_IDLE, duration,
>>  			&priv->read_queue, true) < 0) {
>>  		/* got a signal or timeout, try to cancel */
>> -		vtpm_cancel(chip);
>> -		return -ETIME;
>> +		goto cancel_vtpm;
>>  	}
>>  
>>  	return count;
>> +
>> +cancel_vtpm:
>> +	vtpm_cancel(chip);
>> +	return -ETIME;
>>  }
>>  
>>  static int vtpm_recv(struct tpm_chip *chip, u8 *buf, size_t count)
>> -- 
>> 2.14.2
>>
> 
> NAK

Do you need any more facts to show the influence of the proposed small code reduction?

Regards,
Markus
