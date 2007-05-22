From: Yoann Padioleau <padator@wanadoo.fr>
Date: Tue, 22 May 2007 12:15:13 +0000
Subject: Re: [KJ] question on double cast
Message-Id: <873b1p2gxa.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87y7jh4669.fsf@wanadoo.fr>
In-Reply-To: <87y7jh4669.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"John Anthony Kazos Jr." <jakj@j-a-k-j.com> writes:

>> In drivers/infiniband/hw/amso1100/c2_cm.c", line 321
>> there is
>> 
>>  	wr->ep_handle = (u32) (unsigned long) cm_id->provider_data;
>> 
>> What is the goal of this double cast ? There are plenty of
>> such double cast in the kernel.
>
> provider_data is type "void *", so presumably the object it points to is 
> of type [un]signed long (meaning its size differs on different 
> architectures). It is being cast to unsigned long to set it to that size 
> with no sign bits, and then the low-order 32 bits are being chopped off.

But isn't it equivalent to directly do 

  wr->ep_handle = (u32) cm_id->provider_data;

? 




> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
