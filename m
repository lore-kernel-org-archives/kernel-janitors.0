From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:56:57 +0000
Subject: [KJ] [PATCH 05/72] arm: add KERN_ constants to
Message-Id: <20060908015657.10114.86340.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-integrator/impd1.c b/arch/arm/mach-integrator/impd1.c
index 92d79fb..cf4eeda 100644
--- a/arch/arm/mach-integrator/impd1.c
+++ b/arch/arm/mach-integrator/impd1.c
@@ -369,7 +369,7 @@ static int impd1_probe(struct lm_device 
 
 	lm_set_drvdata(dev, impd1);
 
-	printk("IM-PD1 found at 0x%08lx\n", dev->resource.start);
+	pr_info("IM-PD1 found at 0x%08lx\n", dev->resource.start);
 
 	for (i = 0; i < ARRAY_SIZE(impd1->vcos); i++) {
 		impd1->vcos[i].owner = THIS_MODULE,
@@ -406,7 +406,7 @@ static int impd1_probe(struct lm_device 
 
 		ret = amba_device_register(d, &dev->resource);
 		if (ret) {
-			printk("unable to register device %s: %d\n",
+			printk(KERN_ERR "unable to register device %s: %d\n",
 				d->dev.bus_id, ret);
 			kfree(d);
 		}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
