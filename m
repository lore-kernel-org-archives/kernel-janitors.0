From: James Nelson <james4765@gmail.com>
Date: Tue, 12 Sep 2006 03:20:50 +0000
Subject: [KJ] [PATCH 1/7][RESEND] arm: add KERN_* constants to printk()'s in
Message-Id: <20060912032050.5999.5706.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Diffstat:

 sa1111.c |    4 ++--
 scoop.c  |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

Signed-off-by: James Nelson <james4765@gmail.com>

---
diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index 29818bd..d65e34f 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -566,7 +566,7 @@ sa1111_init_one_child(struct sa1111 *sac
 
 	ret = request_resource(parent, &dev->res);
 	if (ret) {
-		printk("SA1111: failed to allocate resource for %s\n",
+		printk(KERN_ERR "SA1111: failed to allocate resource for %s\n",
 			dev->res.name);
 		kfree(dev);
 		goto out;
@@ -591,7 +591,7 @@ sa1111_init_one_child(struct sa1111 *sac
 		if (dev->dma_mask != 0xffffffffUL) {
 			ret = dmabounce_register_dev(&dev->dev, 1024, 4096);
 			if (ret) {
-				printk("SA1111: Failed to register %s with dmabounce", dev->dev.bus_id);
+				printk(KERN_ERR "SA1111: Failed to register %s with dmabounce", dev->dev.bus_id);
 				device_unregister(&dev->dev);
 			}
 		}
diff --git a/arch/arm/common/scoop.c b/arch/arm/common/scoop.c
index 314ebd3..c2e66a7 100644
--- a/arch/arm/common/scoop.c
+++ b/arch/arm/common/scoop.c
@@ -160,7 +160,7 @@ int __init scoop_probe(struct platform_d
 
 	platform_set_drvdata(pdev, devptr);
 
-	printk("Sharp Scoop Device found at 0x%08x -> 0x%08x\n",(unsigned int)mem->start,(unsigned int)devptr->base);
+	pr_info("Sharp Scoop Device found at 0x%08x -> 0x%08x\n",(unsigned int)mem->start,(unsigned int)devptr->base);
 
 	SCOOP_REG(devptr->base, SCOOP_MCR) = 0x0140;
 	reset_scoop(&pdev->dev);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
