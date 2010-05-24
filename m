From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Date: Mon, 24 May 2010 01:04:10 +0000
Subject: Re: [PATCH 5/27] mm: Use memdup_user
Message-Id: <20100524095902.1E92.A69D9226@jp.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005221019370.13021@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005221019370.13021@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kosaki.motohiro@jp.fujitsu.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  mm/util.c |   11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/util.c b/mm/util.c
> index f5712e8..4735ea4 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -225,15 +225,10 @@ char *strndup_user(const char __user *s, long n)
>  	if (length > n)
>  		return ERR_PTR(-EINVAL);
>  
> -	p = kmalloc(length, GFP_KERNEL);
> +	p = memdup_user(s, length);

memdup? Why can't we use strnlen_user() and legitimate length copy?


>  
> -	if (!p)
> -		return ERR_PTR(-ENOMEM);
> -
> -	if (copy_from_user(p, s, length)) {
> -		kfree(p);
> -		return ERR_PTR(-EFAULT);
> -	}
> +	if (IS_ERR(p))
> +		return p;
>  
>  	p[length - 1] = '\0';
>  
> 
> --
> To unsubscribe, send a message with 'unsubscribe linux-mm' in
> the body to majordomo@kvack.org.  For more info on Linux MM,
> see: http://www.linux-mm.org/ .
> Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>



