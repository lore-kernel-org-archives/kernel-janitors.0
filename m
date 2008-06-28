From: Grant Grundler <grundler@parisc-linux.org>
Date: Sat, 28 Jun 2008 17:54:49 +0000
Subject: Re: [PATCH 6/14] arch/parisc: Eliminate NULL test and memset after
Message-Id: <20080628175449.GB12265@colo.lackof.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0806241023080.26777@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0806241023080.26777@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: akinobu.mita@gmail.com, kyle@mcmartin.ca, matthew@wil.cx, grundler@parisc-linux.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jun 24, 2008 at 10:23:28AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> As noted by Akinobu Mita in patch b1fceac2b9e04d278316b2faddf276015fc06e3b,
> alloc_bootmem and related functions never return NULL and always return a
> zeroed region of memory.  Thus a NULL test or memset after calls to these
> functions is unnecessary.
> 
>  arch/parisc/mm/init.c |    1 -
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

Acked-by: Grant Grundler <grundler@parisc-linux.org>

thanks,
grant

> ---
> 
> diff -u -p a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> --- a/arch/parisc/mm/init.c
> +++ b/arch/parisc/mm/init.c
> @@ -765,7 +765,6 @@ static void __init pagetable_init(void)
>  #endif
>  
>  	empty_zero_page = alloc_bootmem_pages(PAGE_SIZE);
> -	memset(empty_zero_page, 0, PAGE_SIZE);
>  }
>  
>  static void __init gateway_init(void)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
