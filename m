From: "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
Date: Wed, 08 Jan 2020 07:15:08 +0000
Subject: Re: [PATCH][next] tee: fix memory allocation failure checks on drv_data and amdtee
Message-Id: <747f9c93-7465-99aa-0b91-a05fd64c7d1f@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107143601.105321-1-colin.king@canonical.com>
In-Reply-To: <20200107143601.105321-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jens Wiklander <jens.wiklander@linaro.org>, Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, Gary R Hook <gary.hook@amd.com>, tee-dev@lists.linaro.org, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

+linux-crypto

On 07/01/20 8:06 pm, Colin King wrote:
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

> ---
>  drivers/tee/amdtee/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/amdtee/core.c b/drivers/tee/amdtee/core.c
> index 9d0cee1c837f..5fda810c79dc 100644
> --- a/drivers/tee/amdtee/core.c
> +++ b/drivers/tee/amdtee/core.c
> @@ -444,11 +444,11 @@ static int __init amdtee_driver_init(void)
>  		goto err_fail;
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
