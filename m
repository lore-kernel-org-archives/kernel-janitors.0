From: Rusty Russell <rusty@rustcorp.com.au>
Date: Fri, 31 Jan 2014 06:00:51 +0000
Subject: Re: [patch] hw_random: cleanup in hwrng_register()
Message-Id: <87k3dgvgzg.fsf@rustcorp.com.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140130114943.GB12734@elgon.mountain>
In-Reply-To: <20140130114943.GB12734@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Matt Mackall <mpm@selenic.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Satoru Takeuchi <satoru.takeuchi@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:
> My static checker complains that:
>
> 	drivers/char/hw_random/core.c:341 hwrng_register()
> 	warn: we tested 'old_rng' before and it was 'false'
>
> The problem is that sometimes we test "if (!old_rng)" and sometimes we
> test "if (must_register_misc)".  The static checker knows they are
> equivalent but a human being reading the code could easily be confused.
>
> I have simplified the code by removing the "must_register_misc" variable
> and I have removed the redundant check on "if (!old_rng)".
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Yeah, clearer too.

Reviewed-by: Rusty Russell <rusty@rustcorp.com.au>

Thanks,
Rusty.

>
> diff --git a/drivers/char/hw_random/core.c b/drivers/char/hw_random/core.c
> index b9495a8c05c6..463382036a01 100644
> --- a/drivers/char/hw_random/core.c
> +++ b/drivers/char/hw_random/core.c
> @@ -301,7 +301,6 @@ err_misc_dereg:
>  
>  int hwrng_register(struct hwrng *rng)
>  {
> -	int must_register_misc;
>  	int err = -EINVAL;
>  	struct hwrng *old_rng, *tmp;
>  
> @@ -326,7 +325,6 @@ int hwrng_register(struct hwrng *rng)
>  			goto out_unlock;
>  	}
>  
> -	must_register_misc = (current_rng = NULL);
>  	old_rng = current_rng;
>  	if (!old_rng) {
>  		err = hwrng_init(rng);
> @@ -335,13 +333,11 @@ int hwrng_register(struct hwrng *rng)
>  		current_rng = rng;
>  	}
>  	err = 0;
> -	if (must_register_misc) {
> +	if (!old_rng) {
>  		err = register_miscdev();
>  		if (err) {
> -			if (!old_rng) {
> -				hwrng_cleanup(rng);
> -				current_rng = NULL;
> -			}
> +			hwrng_cleanup(rng);
> +			current_rng = NULL;
>  			goto out_unlock;
>  		}
>  	}
