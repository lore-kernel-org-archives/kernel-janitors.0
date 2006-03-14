From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Tue, 14 Mar 2006 16:26:39 +0000
Subject: Re: [KJ][Patch] check return value of request_irq in i82365.c
Message-Id: <20060314082639.44af9641.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83813225565667904=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141029654.7765.6.camel@localhost.localdomain>
In-Reply-To: <1141029654.7765.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============83813225565667904==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Mar 2006 19:44:37 +1100 Darren Jenkins\\ wrote:

> On Mon, 2006-03-13 at 13:29 +0100, Tobias Klauser wrote:
> 
> > >      /* Set up interrupt handler(s) */
> > >      if (grab_irq != 0)
> > > -	request_irq(cs_irq, pcic_interrupt, 0, "i82365", pcic_interrupt);
> > > +	if (request_irq(cs_irq, pcic_interrupt, 0, "i82365", pcic_interrupt)< 0)
> > > +	{
> >         ^-- You might want to have this on the above line as with the if's
> > 	before. Also a space before the '<' would be good.
> > 
> > Cheers, Tobias
> 
> OK here is the patch with your change, doing it on two lines like this
> was the best I could make it look in 80 cols.
> Also I noticed another problem where isa_probe() might or might not
> succeed with a request_region() meaning that we might release_region()
> on something we don't own. The patch below fixes this too.
> 
> If this patch is OK I will follow with the coding style clean up.
> 
> Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
> 
> --- linux-2.6.16-rc5/drivers/pcmcia/i82365.c.orig	2006-03-13 17:49:26.000000000 +1100
> +++ linux-2.6.16-rc5/drivers/pcmcia/i82365.c	2006-03-14 19:27:39.000000000 +1100
> @@ -770,7 +770,7 @@ MODULE_DEVICE_TABLE(isapnp, id_table);
>  static struct pnp_dev *i82365_pnpdev;
>  #endif
>  
> -static void __init isa_probe(void)
> +static int __init isa_probe(void)
>  {
>      int i, j, sock, k, ns, id;
>      kio_addr_t port;
> @@ -805,7 +805,7 @@ static void __init isa_probe(void)
>      if (!request_region(i365_base, 2, "i82365")) {
>  	if (sockets == 0)
>  	    printk("port conflict at %#lx\n", i365_base);
> -	return;
> +	return -EBUSY;
>      }
>  
>      id = identify(i365_base, 0);
> @@ -844,6 +844,7 @@ static void __init isa_probe(void)
>  	    if (ns != 0) add_pcic(ns, id);
>  	}
>      }
> +    return 0;
>  }
>  
>  /*====================================================================*/
> @@ -1264,37 +1265,37 @@ static int __init init_i82365(void)
>  
>      ret = driver_register(&i82365_driver);
>      if (ret)
> -	return ret;
> +	goto out;
>  
>      i82365_device = platform_device_alloc("i82365", 0);
> -    if (i82365_device) {
> -	    ret = platform_device_add(i82365_device);
> -	    if (ret)
> -		    platform_device_put(i82365_device);
> -    } else
> -	    ret = -ENOMEM;
> -
> -    if (ret) {
> -	driver_unregister(&i82365_driver);
> -	return ret;
> +    if (!i82365_device) {
> +	ret = -ENOMEM;
> +	goto ur_out;
>      }
> +   
> +    ret = platform_device_add(i82365_device);
> +    if (ret)
> +	goto pdp_out;
>  
>      printk(KERN_INFO "Intel ISA PCIC probe: ");
>      sockets = 0;
>  
> -    isa_probe();
> +    i = isa_probe();
>  
>      if (sockets == 0) {
>  	printk("not found.\n");
> -	platform_device_unregister(i82365_device);
> -	release_region(i365_base, 2);
> -	driver_unregister(&i82365_driver);
> -	return -ENODEV;
> +	ret = -ENODEV;
> +	goto r_out;
>      }
>  
>      /* Set up interrupt handler(s) */
>      if (grab_irq != 0)
> -	request_irq(cs_irq, pcic_interrupt, 0, "i82365", pcic_interrupt);
> +	if (request_irq(cs_irq, pcic_interrupt, 0, "i82365", 
> +							pcic_interrupt) < 0){
> +	    printk(KERN_ERR "init_i82365 could not request_irq");
> +	    ret = -EBUSY;
> +	    goto r_out;
> +	}

well.... if you have to make any more changes, add a space after
the "< 0)" and before the opening '{'.
The "grammar" isn't tough IMO.  Maybe you are just used to not
using whitespace?

---
~Randy
You can't do anything without having to do something else first.
-- Belefant's Law

--===============83813225565667904==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83813225565667904==--
