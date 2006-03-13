From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Mon, 13 Mar 2006 05:00:36 +0000
Subject: Re: [KJ][Patch] check return value of request_irq in pcnet_cs.c
Message-Id: <20060312210036.1aa80e71.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49185738758562936=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141029654.7765.6.camel@localhost.localdomain>
In-Reply-To: <1141029654.7765.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============49185738758562936==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Mar 2006 15:37:33 +1100 Darren Jenkins\\ wrote:

> G'day list
> 
> pcnet_cs.c called request_irq without checking its return value @ line
> 1036.
> 
> The patch below just checks the return value and returns -EBUSY on
> failure.
> 
> This file also contains 4 space indenting so I might follow with a patch
> to fix that too.
> 
> Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
> 
> --- linux-2.6.16-rc5/drivers/net/pcmcia/pcnet_cs.c.orig	2006-03-13 13:25:13.000000000 +1100
> +++ linux-2.6.16-rc5/drivers/net/pcmcia/pcnet_cs.c	2006-03-13 13:46:07.000000000 +1100
> @@ -1033,7 +1033,8 @@ static int pcnet_open(struct net_device 
>      link->open++;
>  
>      set_misc_reg(dev);
> -    request_irq(dev->irq, ei_irq_wrapper, SA_SHIRQ, dev_info, dev);
> +    if (request_irq(dev->irq, ei_irq_wrapper, SA_SHIRQ, dev_info, dev) < 0 )
> +	return -EBUSY

and this built OK for you ???

---
~Randy
You can't do anything without having to do something else first.
-- Belefant's Law

--===============49185738758562936==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49185738758562936==--
