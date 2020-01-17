From: "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
Date: Fri, 17 Jan 2020 06:52:14 +0000
Subject: Re: [PATCH][next][V2] tee: fix memory allocation failure checks on drv_data and amdtee
Message-Id: <e6fd526e-316f-539d-9f5e-c039041c4f2e@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200116154852.84532-1-colin.king@canonical.com>
In-Reply-To: <20200116154852.84532-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jens Wiklander <jens.wiklander@linaro.org>, Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>, Gary R Hook <gary.hook@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 16/01/20 9:18 pm, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the memory allocation failure checks on drv_data and
> amdtee are using IS_ERR rather than checking for a null pointer.
> Fix these checks to use the conventional null pointer check.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Rijo Thomas <Rijo-john.Thomas@amd.com>

Thanks,
Rijo

> ---
> V2: update to apply against cryptodev-2.6 tree tip
> ---
>  drivers/tee/amdtee/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/amdtee/core.c b/drivers/tee/amdtee/core.c
> index be8937eb5d43..6370bb55f512 100644
> --- a/drivers/tee/amdtee/core.c
> +++ b/drivers/tee/amdtee/core.c
> @@ -446,11 +446,11 @@ static int __init amdtee_driver_init(void)
>  	}
>  
>  	drv_data = kzalloc(sizeof(*drv_data), GFP_KERNEL);
> -	if (IS_ERR(drv_data))
> +	if (!drv_data)
>  		return -ENOMEM;
>  
>  	amdtee = kzalloc(sizeof(*amdtee), GFP_KERNEL);
> -	if (IS_ERR(amdtee)) {
> +	if (!amdtee) {
>  		rc = -ENOMEM;
>  		goto err_kfree_drv_data;
>  	}
> 
