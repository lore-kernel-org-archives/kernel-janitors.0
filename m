From: James Smart <james.smart@broadcom.com>
Date: Thu, 09 Jul 2020 14:43:17 +0000
Subject: Re: [PATCH v2] scsi: lpfc: Fix a condition in lpfc_dmp_dbg()
Message-Id: <3c46ca75-54d7-7f75-edfb-514b34b003dc@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200709105826.GH2571@kadam>
In-Reply-To: <20200709105826.GH2571@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Dick Kennedy <dick.kennedy@broadcom.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 7/9/2020 3:58 AM, Dan Carpenter wrote:
> These variables are unsigned so the result of the subtraction is also
> unsigned and thus can't be negative.  Change it to a comparison and
> remove the subtraction.
>
> Fixes: 372c187b8a70 ("scsi: lpfc: Add an internal trace log buffer")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2:  I reverse the if statement in v1
>
>   drivers/scsi/lpfc/lpfc_init.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
> index 7285b0114837..2bb2c96e7784 100644
> --- a/drivers/scsi/lpfc/lpfc_init.c
> +++ b/drivers/scsi/lpfc/lpfc_init.c
> @@ -14152,7 +14152,7 @@ void lpfc_dmp_dbg(struct lpfc_hba *phba)
>   		if ((start_idx + dbg_cnt) > (DBG_LOG_SZ - 1)) {
>   			temp_idx = (start_idx + dbg_cnt) % DBG_LOG_SZ;
>   		} else {
> -			if ((start_idx - dbg_cnt) < 0) {
> +			if (start_idx < dbg_cnt) {
>   				start_idx = DBG_LOG_SZ - (dbg_cnt - start_idx);
>   				temp_idx = 0;
>   			} else {

Already resolved/accepted.

https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/commit/?idwdd7d7b3442

Thank you though.

-- james
