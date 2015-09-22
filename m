From: Manoj Kumar <manoj@linux.vnet.ibm.com>
Date: Tue, 22 Sep 2015 13:27:21 +0000
Subject: Re: [patch] cxlflash: a couple off by one bugs
Message-Id: <56015739.20001@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150922123206.GC27407@mwanda>
In-Reply-To: <20150922123206.GC27407@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "James E.J. Bottomley" <JBottomley@odin.com>
Cc: Wen Xiong <wenxiong@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>, "Matthew R. Ochs" <mrochs@linux.vnet.ibm.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

Reviewed-by: Manoj Kumar <manoj@linux.vnet.ibm.com>

---
Manoj Kumar

On 9/22/2015 7:32 AM, Dan Carpenter wrote:
> The "> MAX_CONTEXT" should be ">= MAX_CONTEXT".  Otherwise we go one
> step beyond the end of the cfg->ctx_tbl[] array.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/scsi/cxlflash/superpipe.c b/drivers/scsi/cxlflash/superpipe.c
> index f1b62ce..05e0ecf 100644
> --- a/drivers/scsi/cxlflash/superpipe.c
> +++ b/drivers/scsi/cxlflash/superpipe.c
> @@ -1315,7 +1315,7 @@ static int cxlflash_disk_attach(struct scsi_device *sdev,
>   	}
>
>   	ctxid = cxl_process_element(ctx);
> -	if (unlikely((ctxid > MAX_CONTEXT) || (ctxid < 0))) {
> +	if (unlikely((ctxid >= MAX_CONTEXT) || (ctxid < 0))) {
>   		dev_err(dev, "%s: ctxid (%d) invalid!\n", __func__, ctxid);
>   		rc = -EPERM;
>   		goto err1;
> @@ -1440,7 +1440,7 @@ static int recover_context(struct cxlflash_cfg *cfg, struct ctx_info *ctxi)
>   	}
>
>   	ctxid = cxl_process_element(ctx);
> -	if (unlikely((ctxid > MAX_CONTEXT) || (ctxid < 0))) {
> +	if (unlikely((ctxid >= MAX_CONTEXT) || (ctxid < 0))) {
>   		dev_err(dev, "%s: ctxid (%d) invalid!\n", __func__, ctxid);
>   		rc = -EPERM;
>   		goto err1;
>

