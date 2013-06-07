From: Zhang Yanfei <zhangyanfei.yes@gmail.com>
Date: Fri, 07 Jun 2013 15:56:20 +0000
Subject: Re: [patch -mm] mm, vmalloc: unbreak __vunmap()
Message-Id: <51B202A4.6090903@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130607120738.GA13851@debian>
In-Reply-To: <20130607120738.GA13851@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Zhang Yanfei <zhangyanfei@cn.fujitsu.com>, David Rientjes <rientjes@google.com>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/07/2013 08:07 PM, Dan Carpenter wrote:
> There is an extra semi-colon so the function always returns.

Acked-by: Zhang Yanfei <zhangyanfei@cn.fujitsu.com>

This is imported by using the macro PAGE_ALIGNED.

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 91a1047..96b77a9 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -1453,7 +1453,7 @@ static void __vunmap(const void *addr, int deallocate_pages)
>  		return;
>  
>  	if (WARN(!PAGE_ALIGNED(addr), "Trying to vfree() bad address (%p)\n",
> -			addr));
> +			addr))
>  		return;
>  
>  	area = remove_vm_area(addr);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

