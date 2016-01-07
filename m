From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 07 Jan 2016 19:30:47 +0000
Subject: Re: [PATCH] net-thunder: One check less in nicvf_register_interrupts() after error detection
Message-Id: <568EBCE7.4060502@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5685A273.6070607@users.sourceforge.net>
 <20160107110701.GE25086@rric.localdomain>
In-Reply-To: <20160107110701.GE25086@rric.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

>> Adjust a jump target to eliminate a check before error logging.
>> Use the identifier "report_failure" instead of "err".
> 
> I don't see much value in those changes.

Thanks for your feedback.


> Using the 'err' label is ok as it is not misleading and common use.

Is such a short jump label enough explanation for the information
"what" and "why"?


> And, there is no need to optimize the check since this is not the fast path

Really? - Is it a bit more efficient to avoid a double check for the
variable "ret" at the end of the current implementation for the
discussed function?
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/drivers/net/ethernet/cavium/thunder/nicvf_main.c?id@fb5f8a60f33133d36afde35a9ad865d35e4423#n940


> and will be compiler optimized anyway.

How sure are you about automatic software optimisations?

Can it occasionally help to jump to the really intended source code
location directly?


>> @@ -944,13 +944,12 @@ static int nicvf_register_interrupts(struct nicvf *nic)
>>  	ret = request_irq(nic->msix_entries[irq].vector,
>>  			  nicvf_qs_err_intr_handler,
>>  			  0, nic->irq_name[irq], nic);
>> -	if (!ret)
>> +	if (!ret) {
>>  		nic->irq_allocated[irq] = true;
>> -
>> -err:
>> -	if (ret)
>> -		netdev_err(nic->netdev, "request_irq failed, vector %d\n", irq);
>> -
>> +		return 0;
>> +	}
>> +report_failure:
>> +	netdev_err(nic->netdev, "request_irq failed, vector %d\n", irq);
>>  	return ret;
>>  }

