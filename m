From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 May 2012 14:08:27 +0000
Subject: [patch] [SCSI] scsi_pm: passing wrong pointer to resume()
Message-Id: <20120518140827.GA1584@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "James E.J. Bottomley" <JBottomley@parallels.com>, Aaron Lu <Aaron.Lu@amd.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

This gets caught by GCC:
drivers/scsi/scsi_pm.c:30:5: warning: passing argument 1 of
	‘scsi_device_resume’ from incompatible pointer type
	[enabled by default]

It probably would have been caught in testing as well, but it's on an
error path.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I haven't tested this.  :/  Sorry for that.

diff --git a/drivers/scsi/scsi_pm.c b/drivers/scsi/scsi_pm.c
index 9bd2c41..d4201de 100644
--- a/drivers/scsi/scsi_pm.c
+++ b/drivers/scsi/scsi_pm.c
@@ -27,7 +27,7 @@ static int scsi_dev_type_suspend(struct device *dev, pm_message_t msg)
 		if (drv && drv->suspend) {
 			err = drv->suspend(dev, msg);
 			if (err)
-				scsi_device_resume(dev);
+				scsi_device_resume(to_scsi_device(dev));
 		}
 	}
 	dev_dbg(dev, "scsi suspend: %d\n", err);
