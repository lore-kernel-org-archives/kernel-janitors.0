From: James Smart <james.smart@broadcom.com>
Date: Sat, 04 Mar 2017 17:42:50 +0000
Subject: Re: [PATCH] scsi: lpfc: fix missing spin_unlock on sql_list_lock
Message-Id: <4692bdb2-dabb-a9bb-90f3-0678ab0fd26e@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170224143015.6441-1-colin.king@canonical.com>
In-Reply-To: <20170224143015.6441-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Looks good. I included it in the lpfc patch set just posted.

-- james


On 2/24/2017 6:30 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> In the case where sglq is null, the current code just returns without
> unlocking the spinlock sql_list_lock. Fix this by breaking out of the
> while loop and the exit path will then unlock and return NULL as was
> the original intention.
>
> Detected by CoverityScan, CID#1411635 ("Missing unlock")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/scsi/lpfc/lpfc_sli.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
> index 1fba5dc..40720bb 100644
> --- a/drivers/scsi/lpfc/lpfc_sli.c
> +++ b/drivers/scsi/lpfc/lpfc_sli.c
> @@ -952,7 +952,7 @@ __lpfc_sli_get_els_sglq(struct lpfc_hba *phba, struct lpfc_iocbq *piocbq)
>   	start_sglq = sglq;
>   	while (!found) {
>   		if (!sglq)
> -			return NULL;
> +			break;
>   		if (ndlp && ndlp->active_rrqs_xri_bitmap &&
>   		    test_bit(sglq->sli4_lxritag,
>   		    ndlp->active_rrqs_xri_bitmap)) {

