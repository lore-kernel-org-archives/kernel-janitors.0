From: Kees Cook <keescook@chromium.org>
Date: Wed, 02 Dec 2020 19:25:46 +0000
Subject: Re: [PATCH] pstore: Tidy up an error check
Message-Id: <202012021124.ADBFCE999@keescook>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8c4C2q6qaZ8qX6L@mwanda>
In-Reply-To: <X8c4C2q6qaZ8qX6L@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Dec 02, 2020 at 09:45:31AM +0300, Dan Carpenter wrote:
> The crypto_alloc_comp() function never returns NULL, it returns error
> pointers on error.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I replied to an identical patch yesterday, actually:
https://lore.kernel.org/lkml/202012011215.B9BF24A6D@keescook/

Using IS_ERR_OR_NULL() is more robust, and this isn't fast path, so I'd
prefer to keep it that way.

-Kees

> ---
>  fs/pstore/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
> index 36714df37d5d..b7a2a2a31dee 100644
> --- a/fs/pstore/platform.c
> +++ b/fs/pstore/platform.c
> @@ -315,7 +315,7 @@ static void allocate_buf_for_compression(void)
>  	}
>  
>  	ctx = crypto_alloc_comp(zbackend->name, 0, 0);
> -	if (IS_ERR_OR_NULL(ctx)) {
> +	if (IS_ERR(ctx)) {
>  		kfree(buf);
>  		pr_err("crypto_alloc_comp('%s') failed: %ld\n", zbackend->name,
>  		       PTR_ERR(ctx));
> -- 
> 2.29.2
> 

-- 
Kees Cook
