From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 08 Oct 2005 13:21:08 +0000
Subject: Re: [KJ] Unreachable Code
Message-Id: <20051008132107.GA24907@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24322030658173288=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051006023754.35718.qmail@web34205.mail.mud.yahoo.com>
In-Reply-To: <20051006023754.35718.qmail@web34205.mail.mud.yahoo.com>
To: kernel-janitors@vger.kernel.org

--===============24322030658173288==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 05, 2005 at 07:37:54PM -0700, Aaron Grothe wrote:
> The following is a small patch against the 2.6.14-rc3
> tree.  It removes some code that won't/can't be
> reached.  I came across the code while building the

> --- linux-2.6.14-rc3/drivers/char/drm/i830_dma.c
> +++ linux-2.6.14-rc3-patch/drivers/char/drm/i830_dma.c
> @@ -594,21 +594,6 @@ static void i830EmitTexPalette( drm_devi
>
>  	return;

Placed here on 29 Mar 2003, so it should be safe to remove. But after
removal i830EmitTexPalette() will become NOP. Applied as-is, send
incremental patch if i830 people will say i830EmitTexPalette() is a
dead code nobody will fix.

> -	BEGIN_LP_RING( 258 );
> -
> -	if(is_shared == 1) {
> -		OUT_RING(CMD_OP_MAP_PALETTE_LOAD |
> -			 MAP_PALETTE_NUM(0) |
> -			 MAP_PALETTE_BOTH);
> -	} else {
> -		OUT_RING(CMD_OP_MAP_PALETTE_LOAD | MAP_PALETTE_NUM(number));
> -	}
> -	for(i = 0; i < 256; i++) {
> -		OUT_RING(palette[i]);
> -	}
> -	OUT_RING(0);
> -	/* KW:  WHERE IS THE ADVANCE_LP_RING?  This is effectively a noop! 
> -	 */
>  }

> --- linux-2.6.14-rc3/fs/udf/super.c
> +++ linux-2.6.14-rc3-patch/fs/udf/super.c
> @@ -793,55 +793,6 @@ udf_find_fileset(struct super_block *sb,
>  		kernel_lb_addr newfileset;
>
>  		return 1;

5 Feb 2002. OK. Note that newfileset will become unused.


--===============24322030658173288==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24322030658173288==--
