From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Thu, 12 Nov 2015 09:59:21 +0000
Subject: Re: [patch] hpsa: logical vs bitwise AND typo
Message-Id: <1447322361.2616.10.camel@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151112094338.GB28432@mwanda>
In-Reply-To: <20151112094338.GB28432@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Don Brace <don.brace@pmcs.com>, Scott Teel <scott.teel@pmcs.com>
Cc: "James E.J. Bottomley" <JBottomley@odin.com>, iss_storagedev@hp.com, storagedev@pmcs.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2015-11-12 at 12:43 +0300, Dan Carpenter wrote:
> HPSA_DIAG_OPTS_DISABLE_RLD_CACHING is a mask and bitwise AND was
> intended here instead of logical &&.  This bug is essentially
> harmless,
> it means that sometimes we don't print a warning message which we
> wanted
> to print.
> 
> Fixes: c2adae44e916 ('hpsa: disable report lun data caching')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/scsi/hpsa.c b/drivers/scsi/hpsa.c
> index 6a8f958..a386036 100644
> --- a/drivers/scsi/hpsa.c
> +++ b/drivers/scsi/hpsa.c
> @@ -8671,7 +8671,7 @@ static void hpsa_disable_rld_caching(struct
> ctlr_info *h)
>  	if ((rc != 0)  || (c->err_info->CommandStatus != 0))
>  		goto errout;
>  
> -	if (*options && HPSA_DIAG_OPTS_DISABLE_RLD_CACHING)
> +	if (*options & HPSA_DIAG_OPTS_DISABLE_RLD_CACHING)
>  		goto out;
>  
>  errout:

Reviewed-by: Johannes Thumshirn <jthumshirn@suse.de>

> --
> To unsubscribe from this list: send the line "unsubscribe linux-scsi" 
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

