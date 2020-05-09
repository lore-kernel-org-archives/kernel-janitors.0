From: Finn Thain <fthain@telegraphics.com.au>
Date: Sat, 09 May 2020 01:57:44 +0000
Subject: Re: [PATCH] net/sonic: Fix some resource leaks in error handling paths
Message-Id: <alpine.LNX.2.22.394.2005091143590.8@nippy.intranet>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508172557.218132-1-christophe.jaillet@wanadoo.fr> <20200508175701.4eee970d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200508175701.4eee970d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba@kernel.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On Fri, 8 May 2020, Jakub Kicinski wrote:

> On Fri,  8 May 2020 19:25:57 +0200 Christophe JAILLET wrote:
> > Only macsonic has been compile tested. I don't have the needed setup to
> > compile xtsonic
> 
> Well, we gotta do that before we apply the patch :S
> 

I've compiled xtsonic.c with this patch.

> Does the driver actually depend on some platform stuff,

xtsonic.c looks portable enough but it has some asm includes that I 
haven't looked at. It is really a question for the arch maintainers.

>  or can we do this:
> 
> diff --git a/drivers/net/ethernet/natsemi/Kconfig b/drivers/net/ethernet/natsemi/Kconfig
> @@ -58,7 +58,7 @@ config NS83820
>  
>  config XTENSA_XT2000_SONIC
>         tristate "Xtensa XT2000 onboard SONIC Ethernet support"
> -       depends on XTENSA_PLATFORM_XT2000
> +       depends on XTENSA_PLATFORM_XT2000 || COMPILE_TEST
>         ---help---
>           This is the driver for the onboard card of the Xtensa XT2000 board.
>  
> ?
> 

That's effectively what I did to compile test xtsonic.c (I removed the 
line to get the same effect).
