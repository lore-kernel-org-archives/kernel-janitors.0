From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Dec 2017 00:28:52 +0000
Subject: [PATCH] scsi: lpfc: don't dereference localport before it has been null checked
Message-Id: <20171222002852.10892-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

localport is being dereferenced to assign lport and then immediately
afterwards localport is being sanity checked to see if it is null.
Fix this by only dereferencing localport until after it has been
null checked.

Detected by CoverityScan, CID#1463038 ("Dereference before null check")

Fixes: 3a8cefbfc5ee ("scsi: lpfc: Beef up stat counters for debug")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/lpfc/lpfc_attr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_attr.c
index 797bb42a6306..986a3dc2efaf 100644
--- a/drivers/scsi/lpfc/lpfc_attr.c
+++ b/drivers/scsi/lpfc/lpfc_attr.c
@@ -277,13 +277,13 @@ lpfc_nvme_info_show(struct device *dev, struct device_attribute *attr,
 	}
 
 	localport = vport->localport;
-	lport = (struct lpfc_nvme_lport *)localport->private;
 	if (!localport) {
 		len = snprintf(buf, PAGE_SIZE,
 				"NVME Initiator x%llx is not allocated\n",
 				wwn_to_u64(vport->fc_portname.u.wwn));
 		return len;
 	}
+	lport = (struct lpfc_nvme_lport *)localport->private;
 	len = snprintf(buf, PAGE_SIZE, "NVME Initiator Enabled\n");
 
 	spin_lock_irq(shost->host_lock);
-- 
2.14.1

