From: Vitaly Bordug <vbordug@ru.mvista.com>
Date: Wed, 18 Jan 2006 11:47:30 +0000
Subject: Re: [KJ] [Patch] replace MODULE_PARM in net/fs_enet/fs_enet-main.c
Message-Id: <20060118144730.2557b7f5@vitb.dev.rtsoft.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14880070896344799=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1136898275.23005.3.camel@alice>
In-Reply-To: <1136898275.23005.3.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============14880070896344799==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Jan 2006 20:59:31 +0100
Eric Sesterhenn / snakebyte <snakebyte@gmx.de> wrote:
[snip] 
> 
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>
> 
> 
OK, I'll include this into my next changeset.
thanks.


> --- linux-2.6.15-git5/drivers/net/fs_enet/fs_enet-main.c.orig	2006-01-10 14:00:05.000000000 +0100
> +++ linux-2.6.15-git5/drivers/net/fs_enet/fs_enet-main.c	2006-01-10 14:00:22.000000000 +0100
> @@ -58,7 +58,7 @@ MODULE_DESCRIPTION("Freescale Ethernet D
>  MODULE_LICENSE("GPL");
>  MODULE_VERSION(DRV_MODULE_VERSION);
>  
> -MODULE_PARM(fs_enet_debug, "i");
> +module_param(fs_enet_debug, int, 0644);
>  MODULE_PARM_DESC(fs_enet_debug,
>  		 "Freescale bitmapped debugging message enable value");
>  
> 
> 
> 
> 


-- 
Sincerely, 
Vitaly

--===============14880070896344799==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14880070896344799==--
