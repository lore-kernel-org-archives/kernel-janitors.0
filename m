From: "Milan P. Gandhi" <mgandhi@redhat.com>
Date: Thu, 11 Feb 2021 09:47:52 +0000
Subject: [PATCH] scsi: qla2xxx: Removed extra space in variable declaration.
Message-Id: <20210211093552.GA5375@machine1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: GR-QLogic-Storage-Upstream@marvell.com, linux-scsi@vger.kernel.org, njavali@marvell.com, jejb@linux.ibm.com, martin.petersen@oracle.com

Signed-off-by: Milan P. Gandhi <mgandhi@redhat.com>
---
diff --git a/drivers/scsi/qla2xxx/qla_attr.c b/drivers/scsi/qla2xxx/qla_attr.c
index ab45ac1e5a72..7f2db8badb6d 100644
--- a/drivers/scsi/qla2xxx/qla_attr.c
+++ b/drivers/scsi/qla2xxx/qla_attr.c
@@ -226,7 +226,7 @@ qla2x00_sysfs_write_nvram(struct file *filp, struct kobject *kobj,
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
 	    struct device, kobj)));
 	struct qla_hw_data *ha = vha->hw;
-	uint16_t	cnt;
+	uint16_t cnt;
 
 	if (!capable(CAP_SYS_ADMIN) || off != 0 || count != ha->nvram_size ||
 	    !ha->isp_ops->write_nvram)
