From: Satya Tangirala <satyat@google.com>
Date: Tue, 26 May 2020 23:27:25 +0000
Subject: Re: [PATCH][next] block: blk-crypto-fallback: remove redundant initialization of variable err'
Message-Id: <20200526232725.GA41114@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200526224902.63975-1-colin.king@canonical.com>
In-Reply-To: <20200526224902.63975-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 26, 2020 at 11:49:02PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  block/blk-crypto-fallback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
> index 74ab137ae3ba..6e49688a2d80 100644
> --- a/block/blk-crypto-fallback.c
> +++ b/block/blk-crypto-fallback.c
> @@ -529,7 +529,7 @@ static bool blk_crypto_fallback_inited;
>  static int blk_crypto_fallback_init(void)
>  {
>  	int i;
> -	int err = -ENOMEM;
> +	int err;
>  
>  	if (blk_crypto_fallback_inited)
>  		return 0;
> -- 
Looks good to me - you can add:

Reviewed-by: Satya Tangirala <satyat@google.com>

Thanks!
> 2.25.1
> 
