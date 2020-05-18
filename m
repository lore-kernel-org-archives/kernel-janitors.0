From: "Matthew R. Ochs" <mrochs@linux.ibm.com>
Date: Mon, 18 May 2020 21:41:14 +0000
Subject: Re: [PATCH -next] scsi: cxlflash: Fix error return code in cxlflash_probe()
Message-Id: <20200518214114.GA16690@p8tul1-build.aus.stglabs.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428141855.88704-1-weiyongjun1@huawei.com>
In-Reply-To: <20200428141855.88704-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: "Manoj N . Kumar" <manoj@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 28, 2020 at 02:18:55PM +0000, Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from create_afu error
> handling case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Matthew R. Ochs <mrochs@linux.ibm.com>

> ---
>  drivers/scsi/cxlflash/main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/scsi/cxlflash/main.c b/drivers/scsi/cxlflash/main.c
> index fbd2ae40dab4..fcc5aa9f6014 100644
> --- a/drivers/scsi/cxlflash/main.c
> +++ b/drivers/scsi/cxlflash/main.c
> @@ -3744,6 +3744,7 @@ static int cxlflash_probe(struct pci_dev *pdev,
>  	cfg->afu_cookie = cfg->ops->create_afu(pdev);
>  	if (unlikely(!cfg->afu_cookie)) {
>  		dev_err(dev, "%s: create_afu failed\n", __func__);
> +		rc = -ENOMEM;
>  		goto out_remove;
>  	}
> 
> 
> 
