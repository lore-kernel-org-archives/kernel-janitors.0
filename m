From: Saurav Kashyap <skashyap@marvell.com>
Date: Mon, 25 Jan 2021 09:52:27 +0000
Subject: RE: [EXT] [PATCH] scsi: qla2xxx: fix some memory corruption
Message-Id: <DM6PR18MB303455B3BC025E7F82469A4AD2BD9@DM6PR18MB3034.namprd18.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YA6E0geUlL9Hs04A@mwanda>
In-Reply-To: <YA6E0geUlL9Hs04A@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Nilesh Javali <njavali@marvell.com>
Cc: GR-QLogic-Storage-Upstream <GR-QLogic-Storage-Upstream@marvell.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Himanshu Madhani <himanshu.madhani@oracle.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,
Thanks for a patch.

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Monday, January 25, 2021 2:14 PM
> To: Nilesh Javali <njavali@marvell.com>
> Cc: GR-QLogic-Storage-Upstream <GR-QLogic-Storage-
> Upstream@marvell.com>; James E.J. Bottomley <jejb@linux.ibm.com>;
> Martin K. Petersen <martin.petersen@oracle.com>; Himanshu Madhani
> <himanshu.madhani@oracle.com>; Saurav Kashyap
> <skashyap@marvell.com>; linux-scsi@vger.kernel.org; linux-
> kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [EXT] [PATCH] scsi: qla2xxx: fix some memory corruption
> 
> External Email
> 
> ----------------------------------------------------------------------
> This was supposed to be "data" instead of "&data".  The current code
> will corrupt the stack.
> 
> Fixes: dbf1f53cfd23 ("scsi: qla2xxx: Implementation to get and manage host,
> target stats and initiator port")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/scsi/qla2xxx/qla_bsg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/qla2xxx/qla_bsg.c b/drivers/scsi/qla2xxx/qla_bsg.c
> index e45da05383cd..bee8cf9f8123 100644
> --- a/drivers/scsi/qla2xxx/qla_bsg.c
> +++ b/drivers/scsi/qla2xxx/qla_bsg.c
> @@ -2667,7 +2667,7 @@ qla2x00_get_tgt_stats(struct bsg_job *bsg_job)
> 
>  		bsg_reply->reply_payload_rcv_len =
>  			sg_copy_from_buffer(bsg_job-
> >reply_payload.sg_list,
> -					    bsg_job->reply_payload.sg_cnt,
> &data,
> +					    bsg_job->reply_payload.sg_cnt,
> data,
>  					    sizeof(struct
> ql_vnd_tgt_stats_resp));
> 
>  		bsg_reply->result = DID_OK;
> --

Acked-by: Saurav Kashyap <skashyap@marvell.com>


> 2.29.2
