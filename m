From: maximilian attems <janitor@sternwelten.at>
Date: Fri, 19 Nov 2004 20:09:51 +0000
Subject: Re: [KJ] [PATCH] convert atmel_cs wireless driver to module_param
Message-Id: <20041119200951.GH2202@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56214933822811686=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041109213307.GD9496@dice.seeling33.de>
In-Reply-To: <20041109213307.GD9496@dice.seeling33.de>
To: kernel-janitors@vger.kernel.org

--===============56214933822811686==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 09 Nov 2004, Stefan Sperling wrote:

> 
> Replaces MODULE_PARM with module_param calls in atmel_cs wireless driver.
> 
> --- drivers/net/wireless/atmel_cs.c.orig	2004-11-09 20:40:21.974926616 +0100
> +++ drivers/net/wireless/atmel_cs.c	2004-11-08 23:10:14.000000000 +0100
please as described in Documentation/SubmittingPatches
add one level. thanks :)
> @@ -65,7 +65,7 @@
>  */
>  #ifdef PCMCIA_DEBUG
>  static int pc_debug = PCMCIA_DEBUG;
> -MODULE_PARM(pc_debug, "i");
> +module_param(pc_debug, int, 0644);
>  static char *version = "$Revision: 1.2 $";
>  #define DEBUG(n, args...) if (pc_debug>(n)) printk(KERN_DEBUG args);
>  #else
> @@ -86,8 +86,8 @@ MODULE_AUTHOR("Simon Kelley");
>  MODULE_DESCRIPTION("Support for Atmel at76c50x 802.11 wireless ethernet cards.");
>  MODULE_LICENSE("GPL");
>  MODULE_SUPPORTED_DEVICE("Atmel at76c50x PCMCIA cards");
> -MODULE_PARM(irq_mask, "i");
> -MODULE_PARM(irq_list, "1-4i");
> +module_param(irq_mask, int, 0444);
> +module_param_array(irq_list, int, NULL, 0444);

you send on the same driver multiple patches,
is the newere one the better, what's their differences?

a++
maks


--===============56214933822811686==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56214933822811686==--
