From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 19 Sep 2010 12:54:46 +0000
Subject: [PATCH 03/14] mca: fix device_register() error handling
Message-Id: <1284900887-24327-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, linux-kernel@vger.kernel.org

If device_register() fails then call put_device().
See comment to device_register.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 I cannot compile this driver, so it is not tested at all.

 drivers/mca/mca-bus.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mca/mca-bus.c b/drivers/mca/mca-bus.c
index ada5ebb..7162f08 100644
--- a/drivers/mca/mca-bus.c
+++ b/drivers/mca/mca-bus.c
@@ -116,8 +116,10 @@ int __init mca_register_device(int bus, struct mca_device *mca_dev)
 	mca_dev->dev.coherent_dma_mask = mca_dev->dma_mask;
 
 	rc = device_register(&mca_dev->dev);
-	if (rc)
+	if (rc) {
+		put_device(&mca_dev->dev);
 		goto err_out;
+	}
 
 	rc = device_create_file(&mca_dev->dev, &dev_attr_id);
 	if (rc) goto err_out_devreg;
@@ -154,6 +156,7 @@ struct mca_bus * __devinit mca_attach_bus(int bus)
 	dev_set_name(&mca_bus->dev, "mca%d", bus);
 	sprintf(mca_bus->name,"Host %s MCA Bridge", bus ? "Secondary" : "Primary");
 	if (device_register(&mca_bus->dev)) {
+		put_device(&mca_bus->dev);
 		kfree(mca_bus);
 		return NULL;
 	}
-- 
1.7.0.4

