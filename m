From: James Smart <james.smart@broadcom.com>
Date: Thu, 14 May 2020 17:03:38 +0000
Subject: Re: [PATCH] scsi: lpfc: Fix a use after free in lpfc_nvme_unsol_ls_handler()
Message-Id: <4c0aa874-35db-65b5-e541-d513e7906254@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200512181909.GA299091@mwanda>
In-Reply-To: <20200512181909.GA299091@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dick Kennedy <dick.kennedy@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>, Paul Ely <paul.ely@broadcom.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


On 5/12/2020 11:19 AM, Dan Carpenter wrote:
> The "axchg" pointer is dereferenced when we call the
> lpfc_nvme_unsol_ls_issue_abort() function.  It can't be either freed or
> NULL.
>
> Fixes: 3a8070c567aa ("lpfc: Refactor NVME LS receive handling")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/scsi/lpfc/lpfc_sli.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
> index 38889cb6e1996..fcf51b4192d66 100644
> --- a/drivers/scsi/lpfc/lpfc_sli.c
> +++ b/drivers/scsi/lpfc/lpfc_sli.c
> @@ -2895,14 +2895,14 @@ lpfc_nvme_unsol_ls_handler(struct lpfc_hba *phba, struct lpfc_iocbq *piocb)
>   			(phba->nvmet_support) ? "T" : "I", ret);
>   
>   out_fail:
> -	kfree(axchg);
> -
>   	/* recycle receive buffer */
>   	lpfc_in_buf_free(phba, &nvmebuf->dbuf);
>   
>   	/* If start of new exchange, abort it */
> -	if (fctl & FC_FC_FIRST_SEQ && !(fctl & FC_FC_EX_CTX))
> +	if (axchg && (fctl & FC_FC_FIRST_SEQ) && !(fctl & FC_FC_EX_CTX))
>   		lpfc_nvme_unsol_ls_issue_abort(phba, axchg, sid, oxid);
> +
> +	kfree(axchg);
>   }
>   
>   /**

Reviewed-by: James Smart <james.smart@broadcom.com>

Thank You

-- james
