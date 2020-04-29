From: Manish Rangankar <mrangankar@marvell.com>
Date: Wed, 29 Apr 2020 05:48:33 +0000
Subject: RE: [EXT] [PATCH] scsi: qedi: Check for buffer overflow in qedi_set_path()
Message-Id: <BYAPR18MB29985E46F58EDE47E32D773CD8AD0@BYAPR18MB2998.namprd18.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428131939.GA696531@mwanda>
In-Reply-To: <20200428131939.GA696531@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "QLogic-Storage-Upstream@cavium.com" <QLogic-Storage-Upstream@cavium.com>, Manish Rangankar <manish.rangankar@cavium.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Tuesday, April 28, 2020 6:50 PM
> To: QLogic-Storage-Upstream@cavium.com; Manish Rangankar
> <manish.rangankar@cavium.com>
> Cc: James E.J. Bottomley <jejb@linux.ibm.com>; Martin K. Petersen
> <martin.petersen@oracle.com>; linux-scsi@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [EXT] [PATCH] scsi: qedi: Check for buffer overflow in
> qedi_set_path()
> 
> External Email
> 
> ----------------------------------------------------------------------
> Smatch complains that the "path_data->handle" variable is user controlled.
> It comes from iscsi_set_path() so that seems possible.
> It's harmless to add a limit check.
> 
> The qedi->ep_tbl[] array has qedi->max_active_conns elements (which is
> always ISCSI_MAX_SESS_PER_HBA (4096) elements).  The array is allocated
> in the qedi_cm_alloc_mem() function.
> 
> Fixes: ace7f46ba5fd ("scsi: qedi: Add QLogic FastLinQ offload iSCSI driver
> framework.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/scsi/qedi/qedi_iscsi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/scsi/qedi/qedi_iscsi.c b/drivers/scsi/qedi/qedi_iscsi.c
> index b867a143d2638..425e665ec08b2 100644
> --- a/drivers/scsi/qedi/qedi_iscsi.c
> +++ b/drivers/scsi/qedi/qedi_iscsi.c
> @@ -1221,6 +1221,10 @@ static int qedi_set_path(struct Scsi_Host
> *shost, struct iscsi_path *path_data)
>  	}
> 
>  	iscsi_cid = (u32)path_data->handle;
> +	if (iscsi_cid >= qedi->max_active_conns) {
> +		ret = -EINVAL;
> +		goto set_path_exit;
> +	}
>  	qedi_ep = qedi->ep_tbl[iscsi_cid];
>  	QEDI_INFO(&qedi->dbg_ctx, QEDI_LOG_INFO,
>  		  "iscsi_cid=0x%x, qedi_ep=%p\n", iscsi_cid, qedi_ep);

Thanks,
Acked-by: Manish Rangankar <mrangankar@marvell.com>
