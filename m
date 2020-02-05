From: Dave Jiang <dave.jiang@intel.com>
Date: Wed, 05 Feb 2020 16:32:04 +0000
Subject: Re: [PATCH] dmaengine: idxd: Fix error handling in idxd_wq_cdev_dev_setup()
Message-Id: <34f96682-a9c4-ee41-5bbb-320025b7d632@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200205123248.hmtog7qa2eiqaagh@kili.mountain>
In-Reply-To: <20200205123248.hmtog7qa2eiqaagh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2/5/20 5:32 AM, Dan Carpenter wrote:
> We can't call kfree(dev) after calling device_register(dev).  The "dev"
> pointer has to be freed using put_device().
> 
> Fixes: 42d279f9137a ("dmaengine: idxd: add char driver to expose submission portal to userland")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Dave Jiang <dave.jiang@intel.com>

> ---
>   drivers/dma/idxd/cdev.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
> index 1d7347825b95..df47be612ebb 100644
> --- a/drivers/dma/idxd/cdev.c
> +++ b/drivers/dma/idxd/cdev.c
> @@ -204,6 +204,7 @@ static int idxd_wq_cdev_dev_setup(struct idxd_wq *wq)
>   	minor = ida_simple_get(&cdev_ctx->minor_ida, 0, MINORMASK, GFP_KERNEL);
>   	if (minor < 0) {
>   		rc = minor;
> +		kfree(dev);
>   		goto ida_err;
>   	}
>   
> @@ -212,7 +213,6 @@ static int idxd_wq_cdev_dev_setup(struct idxd_wq *wq)
>   	rc = device_register(dev);
>   	if (rc < 0) {
>   		dev_err(&idxd->pdev->dev, "device register failed\n");
> -		put_device(dev);
>   		goto dev_reg_err;
>   	}
>   	idxd_cdev->minor = minor;
> @@ -221,8 +221,8 @@ static int idxd_wq_cdev_dev_setup(struct idxd_wq *wq)
>   
>    dev_reg_err:
>   	ida_simple_remove(&cdev_ctx->minor_ida, MINOR(dev->devt));
> +	put_device(dev);
>    ida_err:
> -	kfree(dev);
>   	idxd_cdev->dev = NULL;
>   	return rc;
>   }
> 
