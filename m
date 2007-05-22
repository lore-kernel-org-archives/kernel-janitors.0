From: "John Anthony Kazos Jr." <jakj@j-a-k-j.com>
Date: Tue, 22 May 2007 12:52:14 +0000
Subject: Re: [KJ] question on double cast
Message-Id: <alpine.DEB.0.99.0705220848480.1796@sigma.j-a-k-j.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87y7jh4669.fsf@wanadoo.fr>
In-Reply-To: <87y7jh4669.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> >> In drivers/infiniband/hw/amso1100/c2_cm.c", line 321
> >> there is
> >> 
> >>  	wr->ep_handle = (u32) (unsigned long) cm_id->provider_data;
> >> 
> >> What is the goal of this double cast ? There are plenty of
> >> such double cast in the kernel.
> >
> > provider_data is type "void *", so presumably the object it points to is 
> > of type [un]signed long (meaning its size differs on different 
> > architectures). It is being cast to unsigned long to set it to that size 
> > with no sign bits, and then the low-order 32 bits are being chopped off.
> 
> But isn't it equivalent to directly do 
> 
>   wr->ep_handle = (u32) cm_id->provider_data;

Depends on the endian-ness if you're on a 64-bit architecture. You'll get 
the high-order 32 or the low-order 32 depending on which are in the first 
4 bytes of the 64-bit quantity. The only way that would be safe is if the 
quantity is never wider than 32 bits.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
