From: Manish Rangankar <mrangankar@marvell.com>
Date: Wed, 04 Dec 2019 15:08:04 +0000
Subject: RE: [PATCH] iscsi: qla4xxx: fix double free in probe
Message-Id: <MN2PR18MB3022879D8451A01AC7B0894FD85D0@MN2PR18MB3022.namprd18.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191203094421.hw7ex7qr3j2rbsmx@kili.mountain>
In-Reply-To: <20191203094421.hw7ex7qr3j2rbsmx@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "QLogic-Storage-Upstream@qlogic.com" <QLogic-Storage-Upstream@qlogic.com>, David Somayajulu <david.somayajulu@qlogic.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>


> -----Original Message-----
> From: linux-scsi-owner@vger.kernel.org <linux-scsi-
> owner@vger.kernel.org> On Behalf Of Dan Carpenter
> Sent: Tuesday, December 3, 2019 3:15 PM
> To: QLogic-Storage-Upstream@qlogic.com; David Somayajulu
> <david.somayajulu@qlogic.com>
> Cc: James E.J. Bottomley <jejb@linux.ibm.com>; Martin K. Petersen
> <martin.petersen@oracle.com>; linux-scsi@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH] iscsi: qla4xxx: fix double free in probe
> 
> On this error path we call qla4xxx_mem_free() and then the caller also calls
> qla4xxx_free_adapter() which calls qla4xxx_mem_free().  It leads to a couple
> double frees:
> 
> drivers/scsi/qla4xxx/ql4_os.c:8856 qla4xxx_probe_adapter() warn: 'ha-
> >chap_dma_pool' double freed
> drivers/scsi/qla4xxx/ql4_os.c:8856 qla4xxx_probe_adapter() warn: 'ha-
> >fw_ddb_dma_pool' double freed
> 
> Fixes: afaf5a2d341d ("[SCSI] Initial Commit of qla4xxx")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/scsi/qla4xxx/ql4_os.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/scsi/qla4xxx/ql4_os.c b/drivers/scsi/qla4xxx/ql4_os.c
> index 8c674eca09f1..2323432a0edb 100644
> --- a/drivers/scsi/qla4xxx/ql4_os.c
> +++ b/drivers/scsi/qla4xxx/ql4_os.c
> @@ -4275,7 +4275,6 @@ static int qla4xxx_mem_alloc(struct
> scsi_qla_host *ha)
>  	return QLA_SUCCESS;
> 
>  mem_alloc_error_exit:
> -	qla4xxx_mem_free(ha);
>  	return QLA_ERROR;
>  }
> 
> --
> 2.11.0

Thanks
Acked-by: Manish Rangankar <mrangankar@marvell.com>
