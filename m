From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Mon, 12 Jun 2006 03:01:20 +0000
Subject: Re: [KJ] [PATCH] Add KERN constants to arch/i386/kernel/cpu/rise.c
Message-Id: <20060611200120.1592250b.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <448CA38C.1050602@gmail.com>
In-Reply-To: <448CA38C.1050602@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 11 Jun 2006 19:30:34 -0400 Dave Jones wrote:

> On Sun, Jun 11, 2006 at 06:13:16PM -0500, Matthew Martin wrote:
>  > Hello,
>  >     This adds KERN constants to arch/i386/kernel/cpu/rise.c
>  > 
>  > Signed-Off-By: Matthew Martin <lihnucks@gmail.com>
>  > ---
>  > 
>  > 
>  > --- vanilla-linux-2.6.16/arch/i386/kernel/cpu/rise.c	2006-03-19 23:53:29.000000000 -0600
>  > +++ linux-2.6.16/arch/i386/kernel/cpu/rise.c	2006-06-09 18:45:17.000000000 -0500
>  > @@ -7,9 +7,9 @@
>  >  
>  >  static void __init init_rise(struct cpuinfo_x86 *c)
>  >  {
>  > -	printk("CPU: Rise iDragon");
>  > +	printk(KERN_INFO "CPU: Rise iDragon");
>  >  	if (c->x86_model > 2)
>  > -		printk(" II");
>  > +		printk(KERN_INFO " II");
>  >  	printk("\n");
> 
> Note that there's no \n on the first printk.  This means that adding teh KERN_INFO
> to the second printk is incorrect, as it'll result in output like..
> 
> CPU: Rise iDragon<6> II

which is why the KJ TODO says:

- printk() calls should include appropriate KERN_* constant (of course
  only at beginning of lines).

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
