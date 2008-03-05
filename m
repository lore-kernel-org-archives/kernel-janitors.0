From: Jon Schindler <jkschind@gmail.com>
Date: Wed, 05 Mar 2008 05:50:47 +0000
Subject: [PATCH 10/11] /drivers/net/3c527.c replaced init_module&cleanup_module
Message-Id: <47CE34B7.9070109@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org, Andrew Morton <akpm@linux-foundation.org>

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/3c527.c b/drivers/net/3c527.c
index b72b89d..4740a80 100644
--- a/drivers/net/3c527.c
+++ b/drivers/net/3c527.c
@@ -1631,23 +1631,24 @@ static const struct ethtool_ops netdev_ethtool_ops = {
 static struct net_device *this_device;
 
 /**
- *	init_module		-	entry point
+ *	tc527_module_init	-	entry point
  *
  *	Probe and locate a 3c527 card. This really should probe and locate
  *	all the 3c527 cards in the machine not just one of them. Yes you can
  *	insmod multiple modules for now but it's a hack.
  */
 
-int __init init_module(void)
+static int __init tc527_module_init(void)
 {
 	this_device = mc32_probe(-1);
 	if (IS_ERR(this_device))
 		return PTR_ERR(this_device);
 	return 0;
 }
+module_init(tc527_module_init);
 
 /**
- *	cleanup_module	-	free resources for an unload
+ *	tc527_module_exit	-	free resources for an unload
  *
  *	Unloading time. We release the MCA bus resources and the interrupt
  *	at which point everything is ready to unload. The card must be stopped
@@ -1657,11 +1658,12 @@ int __init init_module(void)
  *	transmit operations are allowed to start scribbling into memory.
  */
 
-void __exit cleanup_module(void)
+static void __exit tc527_module_exit(void)
 {
 	unregister_netdev(this_device);
 	cleanup_card(this_device);
 	free_netdev(this_device);
 }
+module_exit(tc527_module_exit);
 
 #endif /* MODULE */
