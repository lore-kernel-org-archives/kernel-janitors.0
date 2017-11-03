From: James Smart <james.smart@broadcom.com>
Date: Fri, 03 Nov 2017 15:48:02 +0000
Subject: Re: [PATCH] scsi: lpfc: Fix a precedence bug in lpfc_nvme_io_cmd_wqe_cmpl()
Message-Id: <37592f5c-18a6-a486-fb58-d9db486d7144@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171012203057.ixo2ds5i5ecbyv4y@mwanda>
In-Reply-To: <20171012203057.ixo2ds5i5ecbyv4y@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Dick Kennedy <dick.kennedy@broadcom.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/12/2017 1:30 PM, Dan Carpenter wrote:
> The ! has higher precedence than the & operation.  I've added
> parenthesis so this works as intended.
>
> Fixes: 952c303b329c ("scsi: lpfc: Ensure io aborts interlocked with the t=
arget.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/scsi/lpfc/lpfc_nvme.c b/drivers/scsi/lpfc/lpfc_nvme.c
> index 60f0dbd0f192..517ae570e507 100644
> --- a/drivers/scsi/lpfc/lpfc_nvme.c
> +++ b/drivers/scsi/lpfc/lpfc_nvme.c
> @@ -948,7 +948,7 @@ lpfc_nvme_io_cmd_wqe_cmpl(struct lpfc_hba *phba, stru=
ct lpfc_iocbq *pwqeIn,
>   	/* NVME targets need completion held off until the abort exchange
>   	 * completes.
>   	 */
> -	if (!lpfc_ncmd->flags & LPFC_SBUF_XBUSY)
> +	if (!(lpfc_ncmd->flags & LPFC_SBUF_XBUSY))
>   		nCmd->done(nCmd);
>  =20
>   	spin_lock_irqsave(&phba->hbalock, flags);
yep

Signed-off-by:=C2=A0 James Smart <james.smart@broadcom.com>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
