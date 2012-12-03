From: "Bhanu Prakash Gollapudi" <bprakash@broadcom.com>
Date: Mon, 03 Dec 2012 22:16:59 +0000
Subject: Re: [PATCH 3/6] scsi: bnx2fc: remove useless calls to memset().
Message-Id: <50BD24DB.7090501@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354416022-20189-1-git-send-email-tipecaml@gmail.com>
 <1354416022-20189-4-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1354416022-20189-4-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyril Roelandt <tipecaml@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, JBottomley@parallels.com, linux-scsi@vger.kernel.org

On 12/01/2012 06:40 PM, Cyril Roelandt wrote:
> These calls are followed by calls to memcpy() on the same memory area, so they
> can be safely removed.
>
> Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
> ---
>   drivers/scsi/bnx2fc/bnx2fc_hwi.c |    4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/drivers/scsi/bnx2fc/bnx2fc_hwi.c b/drivers/scsi/bnx2fc/bnx2fc_hwi.c
> index ef60afa..9be42b8 100644
> --- a/drivers/scsi/bnx2fc/bnx2fc_hwi.c
> +++ b/drivers/scsi/bnx2fc/bnx2fc_hwi.c
> @@ -759,8 +759,6 @@ static void bnx2fc_process_unsol_compl(struct bnx2fc_rport *tgt, u16 wqe)
>   		case FCOE_ERROR_CODE_DATA_SOFN_SEQ_ACTIVE_RESET:
>   			BNX2FC_TGT_DBG(tgt, "REC TOV popped for xid - 0x%x\n",
>   				   xid);
> -			memset(&io_req->err_entry, 0,
> -			       sizeof(struct fcoe_err_report_entry));
>   			memcpy(&io_req->err_entry, err_entry,
>   			       sizeof(struct fcoe_err_report_entry));
>   			if (!test_bit(BNX2FC_FLAG_SRR_SENT,
> @@ -847,8 +845,6 @@ ret_err_rqe:
>   			goto ret_warn_rqe;
>   		}
>   
> -		memset(&io_req->err_entry, 0,
> -		       sizeof(struct fcoe_err_report_entry));
>   		memcpy(&io_req->err_entry, err_entry,
>   		       sizeof(struct fcoe_err_report_entry));
>   
Acked-by: Bhanu Prakash Gollapudi <bprakash@broadcom.com>


