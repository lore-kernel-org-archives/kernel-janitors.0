From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 05 Jun 2007 07:43:56 +0000
Subject: [KJ] Re: [PATCH] potential parse error in ifdef part 3
Message-Id: <Pine.LNX.4.64.0706050943370.27590@anakin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87bqfvr2t9.fsf@wanadoo.fr>
In-Reply-To: <87bqfvr2t9.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@lists.osdl.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On Mon, 4 Jun 2007, Yoann Padioleau wrote:
> parse errors in ifdefs
> 
> Fix various bits of obviously-busted code which we're not happening to
> compile, due to ifdefs.

> --- a/arch/m68k/mac/debug.c
> +++ b/arch/m68k/mac/debug.c
> @@ -71,7 +71,7 @@ #ifdef DEBUG_SCREEN
>  
>  	/* calculate current offset */
>  	pengoffset = (unsigned char *)mac_videobase +
> -		(150+line*2) * mac_rowbytes) + 80 * peng;
> +		(150+line*2) * mac_rowbytes + 80 * peng;
>  
>  	pptr = pengoffset;

Already fixed in 4eb527a0ca83de28e773371f42abad2ab1ed7fdf

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
