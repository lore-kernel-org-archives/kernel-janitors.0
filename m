From: Vikas Chaudhary <vikas.chaudhary@qlogic.com>
Date: Tue, 21 Feb 2012 13:24:57 +0000
Subject: Re: [patch] [SCSI] qla4xxx: silence a Sparse warning
Message-Id: <CB69987C.CCEC%vikas.chaudhary@qlogic.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120221073011.GC6896@elgon.mountain>
In-Reply-To: <20120221073011.GC6896@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Ravi Anand <ravi.anand@qlogic.com>
Cc: Dept-Eng iSCSI Driver <Dept-iSCSIDriver@qlogic.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, scsi <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

-----Original Message-----
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Feb 2012 23:30:12 -0800
To: Ravi Anand <ravi.anand@qlogic.com>
Cc: Vikas Chaudhary <vikas.chaudhary@qlogic.com>, Dept-Eng iSCSI Driver
<Dept-iSCSIDriver@qlogic.com>, "James E.J. Bottomley"
<JBottomley@parallels.com>, scsi <linux-scsi@vger.kernel.org>,
"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: [patch] [SCSI] qla4xxx: silence a Sparse warning

>Sparse complains that the definition of this funciton doesn't match the
>implementation.  The "uint32_t aen_code" should be an enum.
>
>drivers/scsi/qla4xxx/ql4_os.c:2966:5: error: symbol
>       'qla4xxx_post_aen_work' redeclared with different type
>       (originally declared at drivers/scsi/qla4xxx/ql4_glbl.h:184)
>       - incompatible argument 2 (different signedness)
>
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>diff --git a/drivers/scsi/qla4xxx/ql4_glbl.h
>b/drivers/scsi/qla4xxx/ql4_glbl.h
>index 954ba91..71bbc07 100644
>--- a/drivers/scsi/qla4xxx/ql4_glbl.h
>+++ b/drivers/scsi/qla4xxx/ql4_glbl.h
>@@ -181,7 +181,8 @@ int qla4xxx_flash_ddb_change(struct scsi_qla_host
>*ha, uint32_t fw_ddb_index,
> int qla4xxx_ddb_change(struct scsi_qla_host *ha, uint32_t fw_ddb_index,
>                      struct ddb_entry *ddb_entry, uint32_t state);
> void qla4xxx_build_ddb_list(struct scsi_qla_host *ha, int is_reset);
>-int qla4xxx_post_aen_work(struct scsi_qla_host *ha, uint32_t aen_code,
>+int qla4xxx_post_aen_work(struct scsi_qla_host *ha,
>+                        enum iscsi_host_event_code aen_code,
>                         uint32_t data_size, uint8_t *data);
> int qla4xxx_ping_iocb(struct scsi_qla_host *ha, uint32_t options,
>                     uint32_t payload_size, uint32_t pid, uint8_t *ipaddr);

Acked-by: Vikas Chaudhary <vikas.chaudhary@qlogic.com>


This message and any attached documents contain information from QLogic Corporation or its wholly-owned subsidiaries that may be confidential. If you are not the intended recipient, you may not read, copy, distribute, or use this information. If you have received this transmission in error, please notify the sender immediately by reply e-mail and then delete this message.

