From: Tim Chen <tim.c.chen@linux.intel.com>
Date: Tue, 25 Apr 2017 17:37:44 +0000
Subject: Re: [PATCH] crypto: sha512-mb - add some missing unlock on error
Message-Id: <1493141864.3209.94.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170425091854.6fryhkc2v4tf4dnl@mwanda>
In-Reply-To: <20170425091854.6fryhkc2v4tf4dnl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Megha Dey <megha.dey@linux.intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Greg Tucker <greg.b.tucker@intel.com>, Xiaodong Liu <xiaodong.liu@intel.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2017-04-25 at 12:18 +0300, Dan Carpenter wrote:
> We recently added some new locking but missed the unlocks on these
> error paths in sha512_ctx_mgr_submit().

Thanks for catching this issue.

Acked-by: Tim Chen <tim.c.chen@linux.intel.com>

> 
> Fixes: c459bd7beda0 ("crypto: sha512-mb - Protect sha512 mb ctx mgr access")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/x86/crypto/sha512-mb/sha512_mb.c b/arch/x86/crypto/sha512-mb/sha512_mb.c
> index 2dd3674b5a1e..458409b7568d 100644
> --- a/arch/x86/crypto/sha512-mb/sha512_mb.c
> +++ b/arch/x86/crypto/sha512-mb/sha512_mb.c
> @@ -269,19 +269,19 @@ static struct sha512_hash_ctx
>  		 * LAST
>  		 */
>  		ctx->error = HASH_CTX_ERROR_INVALID_FLAGS;
> -		return ctx;
> +		goto unlock;
>  	}
>  
>  	if (ctx->status & HASH_CTX_STS_PROCESSING) {
>  		/* Cannot submit to a currently processing job. */
>  		ctx->error = HASH_CTX_ERROR_ALREADY_PROCESSING;
> -		return ctx;
> +		goto unlock;
>  	}
>  
>  	if ((ctx->status & HASH_CTX_STS_COMPLETE) && !(flags & HASH_FIRST)) {
>  		/* Cannot update a finished job. */
>  		ctx->error = HASH_CTX_ERROR_ALREADY_COMPLETED;
> -		return ctx;
> +		goto unlock;
>  	}
>  
>  
> @@ -363,6 +363,7 @@ static struct sha512_hash_ctx
>  	}
>  
>  	ctx = sha512_ctx_mgr_resubmit(mgr, ctx);
> +unlock:
>  	spin_unlock_irqrestore(&cstate->work_lock, irqflags);
>  	return ctx;
>  }
