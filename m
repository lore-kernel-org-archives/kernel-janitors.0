From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 18 Sep 2006 09:40:52 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/base
Message-Id: <1158572453.6069.85.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609171753m2a047081qc2982bf4a693a044@mail.gmail.com>
In-Reply-To: <6b4e42d10609171753m2a047081qc2982bf4a693a044@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Om Narasimhan <om.turyx@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Ar Sul, 2006-09-17 am 17:53 -0700, ysgrifennodd Om Narasimhan:
> Tested by compiling.
> 
> Signed off by Om Narasimhan <om.turyx@gmail.com>

> -	if (!(retval = kmalloc (sizeof *retval, SLAB_KERNEL)))
> +	if (!(retval = kzalloc (sizeof *retval, SLAB_KERNEL)))
>  		return retval;


NAK

Why slow all these allocations down when they don't zero the memory
anyway ?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
