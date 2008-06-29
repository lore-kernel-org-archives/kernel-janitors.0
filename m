From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 29 Jun 2008 09:57:58 +0000
Subject: Re: [PATCH 5/14] arch/m68k/mm/Sun3mmu.c: Eliminate NULL test and
Message-Id: <Pine.LNX.4.64.0806291157350.29339@anakin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0806241022410.26777@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0806241022410.26777@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: akinobu.mita@gmail.com, zippel@linux-m68k.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 24 Jun 2008, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> As noted by Akinobu Mita in patch b1fceac2b9e04d278316b2faddf276015fc06e3b,
> alloc_bootmem and related functions never return NULL and always return a
> zeroed region of memory.  Thus a NULL test or memset after calls to these
> functions is unnecessary.
> 
>  arch/m68k/mm/sun3mmu.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> This was fixed using the following semantic patch.
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> expression E;
> statement S;
> @@
> 
> E = \(alloc_bootmem\|alloc_bootmem_low\|alloc_bootmem_pages\|alloc_bootmem_low_pages\)(...)
> ... when != E
> (
> - BUG_ON (E = NULL);
> |
> - if (E = NULL) S
> )
> 
> @@
> expression E,E1;
> @@
> 
> E = \(alloc_bootmem\|alloc_bootmem_low\|alloc_bootmem_pages\|alloc_bootmem_low_pages\)(...)
> ... when != E
> - memset(E,0,E1);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

(queued for 2.6.27)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
