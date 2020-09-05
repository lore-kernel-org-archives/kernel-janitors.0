From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 05 Sep 2020 12:58:36 +0000
Subject: [PATCH] scsi: libsas: Fix error path in sas_notify_lldd_dev_found()
Message-Id: <20200905125836.GF183976@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <jejb@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, John Garry <john.garry@huawei.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Jason Yan <yanaijie@huawei.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In sas_notify_lldd_dev_found(), if we can't find a device, then it seems
like the wrong thing to mark the device as found and to increment the
reference count.  None of the callers ever drop the reference in that
situation.

Fixes: 735f7d2fedf5 ("[SCSI] libsas: fix domain_device leak")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/libsas/sas_discover.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/libsas/sas_discover.c b/drivers/scsi/libsas/sas_discover.c
index cd7c7d269f6f..d0f9e90e3279 100644
--- a/drivers/scsi/libsas/sas_discover.c
+++ b/drivers/scsi/libsas/sas_discover.c
@@ -182,10 +182,11 @@ int sas_notify_lldd_dev_found(struct domain_device *dev)
 		pr_warn("driver on host %s cannot handle device %016llx, error:%d\n",
 			dev_name(sas_ha->dev),
 			SAS_ADDR(dev->sas_addr), res);
+		return res;
 	}
 	set_bit(SAS_DEV_FOUND, &dev->state);
 	kref_get(&dev->kref);
-	return res;
+	return 0;
 }
 
 
-- 
2.28.0
