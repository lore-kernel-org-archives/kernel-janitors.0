From: Andy Whitcroft <apw@shadowen.org>
Date: Tue, 08 May 2007 11:18:42 +0000
Subject: [KJ] Re: [KJ PATCH] Replacing memset(<addr>, 0,
Message-Id: <46405C92.1080003@shadowen.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178621156.3598.10.camel@shani-win>
In-Reply-To: <1178621156.3598.10.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shani Moideen <shani.moideen@wipro.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Shani Moideen wrote:
> Hi,
> 
> Replacing memset(<addr>,0,PAGE_SIZE) with clear_page() in mm/memory.c.
> 
> Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
> ----
> 
> thanks.
> 
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index e7066e7..2780d07 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1505,7 +1505,7 @@ static inline void cow_user_page(struct page *dst, struct page *src, unsigned lo
>                  * zeroes.
>                  */
>                 if (__copy_from_user_inatomic(kaddr, uaddr, PAGE_SIZE))
> -                       memset(kaddr, 0, PAGE_SIZE);
> +                       clear_page(kaddr);
>                 kunmap_atomic(kaddr, KM_USER0);
>                 flush_dcache_page(dst);
>                 return;
> 
> 

This looks to be whitespace dammaged?

-apw

use tabs not spaces
PATCH: -:64:
FILE: b/mm/memory.c:1508:
+                       clear_page(kaddr);$

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
