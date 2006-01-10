From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 10 Jan 2006 19:42:46 +0000
Subject: Re: [KJ] [Patch] replace MODULE_PARM in net/fs_enet/fs_enet-main.c
Message-Id: <20060110194245.GA21175@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47085331679740783=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1136898275.23005.3.camel@alice>
In-Reply-To: <1136898275.23005.3.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============47085331679740783==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 10, 2006 at 02:04:35PM +0100, Eric Sesterhenn / snakebyte wrote:
> --- linux-2.6.15-git5/drivers/net/fs_enet/fs_enet-main.c.orig
> +++ linux-2.6.15-git5/drivers/net/fs_enet/fs_enet-main.c

> -MODULE_PARM(fs_enet_debug, "i");
> +module_param(fs_enet_debug, int, 0);
>  MODULE_PARM_DESC(fs_enet_debug,
>  		 "Freescale bitmapped debugging message enable value");

Is there any logic in choosing 0644 over 0 or vice versa?

/me confused


--===============47085331679740783==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47085331679740783==--
