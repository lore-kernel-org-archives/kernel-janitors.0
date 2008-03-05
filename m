From: Jon Schindler <jkschind@gmail.com>
Date: Wed, 05 Mar 2008 05:49:47 +0000
Subject: [PATCH 5/11] /drivers/net/3c501.c replaced init_module&cleanup_module
Message-Id: <47CE347B.3070309@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org, Andrew Morton <akpm@linux-foundation.org>

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/3c501.c b/drivers/net/3c501.c
index 7d25368..537b4e7 100644
--- a/drivers/net/3c501.c
+++ b/drivers/net/3c501.c
@@ -867,13 +867,14 @@ MODULE_PARM_DESC(irq, "EtherLink IRQ number");
  * here also causes the module to be unloaded
  */
 
-int __init init_module(void)
+static int __init tc501_module_init(void)
 {
 	dev_3c501 = el1_probe(-1);
 	if (IS_ERR(dev_3c501))
 		return PTR_ERR(dev_3c501);
 	return 0;
 }
+module_init(tc501_module_init);
 
 /**
  * cleanup_module:
@@ -882,13 +883,14 @@ int __init init_module(void)
  * and then free up the resources we took when the card was found.
  */
 
-void __exit cleanup_module(void)
+static void __exit tc501_module_exit(void)
 {
 	struct net_device *dev = dev_3c501;
 	unregister_netdev(dev);
 	release_region(dev->base_addr, EL1_IO_EXTENT);
 	free_netdev(dev);
 }
+module_exit(tc501_module_exit);
 
 #endif /* MODULE */
 
