From: Paul Walmsley <paul@pwsan.com>
Date: Thu, 02 Jun 2011 21:26:39 +0000
Subject: Re: [PATCH 9/10] arch/arm/mach-omap2/clock.c: add missing clk_put
Message-Id: <alpine.DEB.2.00.1106021526220.26852@utopia.booyaka.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1306948213-20767-9-git-send-email-julia@diku.dk>
In-Reply-To: <1306948213-20767-9-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, 1 Jun 2011, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> Add missing call to clk_put.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r exists@
> expression e1,e2;
> statement S;
> @@
> 
> e1 = clk_get@p1(...);
> ... when != e1 = e2
>     when != clk_put(e1)
>     when any
> if (...) { ... when != clk_put(e1)
>                when != if (...) { ... clk_put(e1) ... }
> * return@p3 ...;
>  } else S
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Paul Walmsley <paul@pwsan.com>


- Paul
