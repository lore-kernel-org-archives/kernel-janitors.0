From: Kumar Gala <galak@kernel.crashing.org>
Date: Tue, 31 Aug 2010 21:39:11 +0000
Subject: Re: [PATCH] arch/powerpc/platforms/83xx/mpc837x_mds.c: Add missing iounmap
Message-Id: <D97B05D5-3ABF-4B47-97C7-A3EC629A1987@kernel.crashing.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283111238-3129-1-git-send-email-julia@diku.dk>
In-Reply-To: <1283111238-3129-1-git-send-email-julia-dAYI7NvHqcQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org


On Aug 29, 2010, at 2:47 PM, Julia Lawall wrote:

> The function of_iomap returns the result of calling ioremap, so iounmap
> should be called on the result in the error handling code, as done in the
> normal exit of the function.
> 
> The sematic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r exists@
> local idexpression x;
> expression E,E1;
> identifier l;
> statement S;
> @@
> 
> *x = of_iomap(...);
> ...  when != iounmap(x)
>     when != if (...) { ... iounmap(x); ... }
>     when != E = x
>     when any
> (
> if (x = NULL) S
> |
> if (...) {
>  ... when != iounmap(x)
>      when != if (...) { ... iounmap(x); ... }
> (
>  return <+...x...+>;
> |
> *  return ...;
> )
> }
> )
> ... when != x = E1
>    when any
> iounmap(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
> arch/powerpc/platforms/83xx/mpc837x_mds.c |    9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)

applied to merge

- k
