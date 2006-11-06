From: Jeff Garzik <jgarzik@pobox.com>
Date: Mon, 06 Nov 2006 08:13:12 +0000
Subject: Re: [KJ] [Patch] kmemdup() cleanup in drivers/net
Message-Id: <454EEE98.9040709@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Eric Sesterhenn wrote:
> hi,
> 
> replace open coded kmemdup() to save some screen space,
> and allow inlining/not inlining to be triggered by gcc.
> 
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>
> 
> --- linux-2.6.19-rc2-git7/drivers/net/tulip/de2104x.c.orig	2006-10-23 21:24:42.000000000 +0200
> +++ linux-2.6.19-rc2-git7/drivers/net/tulip/de2104x.c	2006-10-23 21:25:08.000000000 +0200

> --- linux-2.6.19-rc2-git7/drivers/net/wireless/ipw2100.c.orig	2006-10-23 21:26:26.000000000 +0200
> +++ linux-2.6.19-rc2-git7/drivers/net/wireless/ipw2100.c	2006-10-23 21:27:14.000000000 +0200


applied

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
