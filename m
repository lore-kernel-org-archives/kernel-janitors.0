From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Wed, 20 May 2020 19:13:26 +0000
Subject: Re: [PATCH] remoteproc: Fix an error code in devm_rproc_alloc()
Message-Id: <20200520191326.GH408178@builder.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520120705.GH172354@mwanda>
In-Reply-To: <20200520120705.GH172354@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Paul Cercueil <paul@crapouillou.net>, linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed 20 May 05:07 PDT 2020, Dan Carpenter wrote:

> The comments say that this function should return NULL on error and the
> caller expects NULL returns as well so I have modified the code to match.
> Returning an ERR_PTR(-ENOMEM) would lead to an OOps.
> 
> Fixes: 305ac5a766b1 ("remoteproc: Add device-managed variants of rproc_alloc/rproc_add")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by and applied

Thanks,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 0cc015fabf78..9f04c30c4aaf 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2297,7 +2297,7 @@ struct rproc *devm_rproc_alloc(struct device *dev, const char *name,
>  
>  	ptr = devres_alloc(devm_rproc_free, sizeof(*ptr), GFP_KERNEL);
>  	if (!ptr)
> -		return ERR_PTR(-ENOMEM);
> +		return NULL;
>  
>  	rproc = rproc_alloc(dev, name, ops, firmware, len);
>  	if (rproc) {
> -- 
> 2.26.2
> 
