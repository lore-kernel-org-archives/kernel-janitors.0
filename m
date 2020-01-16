From: "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
Date: Thu, 16 Jan 2020 10:58:58 +0000
Subject: Re: [PATCH][next][resend] tee: fix memory allocation failure checks on drv_data and amdtee
Message-Id: <b90be612-a08d-86f8-3419-8988289147ad@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200116094954.54476-1-colin.king@canonical.com>
In-Reply-To: <20200116094954.54476-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jens Wiklander <jens.wiklander@linaro.org>, Gary R Hook <gary.hook@amd.com>, Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, tee-dev@lists.linaro.org, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On 16/01/20 3:19 pm, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the memory allocation failure checks on drv_data and
> amdtee are using IS_ERR rather than checking for a null pointer.
> Fix these checks to use the conventional null pointer check.
> 

This patch does not apply cleanly to current cryptodev-2.6 tree.
Request you to pull and rebase the patch to current cryptodev-2.6 tree,
build and then submit.

Thanks,
Rijo

> Addresses-Coverity: ("Dereference null return")
> Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
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
