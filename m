From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2008 20:37:19 +0000
Subject: Re: [PATCH 3/4] arch/m68k/mm/kmap.c: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0809102237040.29543@anakin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0809101357440.15308@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0809101357440.15308@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: zippel@linux-m68k.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 10 Sep 2008, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Error handling code following a kmalloc should free the allocated data.
> 
> The semantic match that finds the problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @r exists@
> local idexpression x;
> statement S;
> expression E;
> identifier f,l;
> position p1,p2;
> expression *ptr != NULL;
> @@
> 
> (
> if ((x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)) = NULL) S
> |
> x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
> ...
> if (x = NULL) S
> )
> <... when != x
>      when != if (...) { <+...x...+> }
> x->f = E
> ...>
> (
>  return \(0\|<+...x...+>\|ptr\);
> |
>  return@p2 ...;
> )
> 
> @script:python@
> p1 << r.p1;
> p2 << r.p2;
> @@
> 
> print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
>  arch/m68k/mm/kmap.c           |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)

Thanks, queued for 2.6.28.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
