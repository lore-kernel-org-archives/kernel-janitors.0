From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 13 Mar 2006 12:29:41 +0000
Subject: Re: [KJ][Patch] check return value of request_irq in i82365.c
Message-Id: <20060313122941.GA1197@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32366097202904509=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141029654.7765.6.camel@localhost.localdomain>
In-Reply-To: <1141029654.7765.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============32366097202904509==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2006-03-13 at 12:56:52 +0100, Darren Jenkins" <darrenrjenkins@gmail.com> wrote:
> --- linux-2.6.16-rc5/drivers/pcmcia/i82365.c.orig	2006-03-13 17:49:26.000000000 +1100
> +++ linux-2.6.16-rc5/drivers/pcmcia/i82365.c	2006-03-13 22:52:56.000000000 +1100
> @@ -1264,20 +1264,17 @@ static int __init init_i82365(void)
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
> @@ -1286,15 +1283,18 @@ static int __init init_i82365(void)
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
> +	if (request_irq(cs_irq, pcic_interrupt, 0, "i82365", pcic_interrupt)< 0)
> +	{
        ^-- You might want to have this on the above line as with the if's
	before. Also a space before the '<' would be good.

Cheers, Tobias

--===============32366097202904509==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32366097202904509==--
