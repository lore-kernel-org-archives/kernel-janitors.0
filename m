From: Jon Schindler <jkschind@gmail.com>
Date: Thu, 28 Feb 2008 07:31:18 +0000
Subject: [PATCH 9/9] /drivers/net/atarilance.c replaced init_module&cleanup_module
Message-Id: <47C66346.80108@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/atarilance.c b/drivers/net/atarilance.c
index b74dbee..8422e3b 100644
--- a/drivers/net/atarilance.c
+++ b/drivers/net/atarilance.c
@@ -1156,7 +1156,7 @@ static int lance_set_mac_address( struct net_device *dev, void *addr )
 #ifdef MODULE
 static struct net_device *atarilance_dev;
 
-int __init init_module(void)
+static int __init atarilance_module_init(void)
 {
 	atarilance_dev = atarilance_probe(-1);
 	if (IS_ERR(atarilance_dev))
@@ -1164,13 +1164,14 @@ int __init init_module(void)
 	return 0;
 }
 
-void __exit cleanup_module(void)
+static void __exit atarilance_module_exit(void)
 {
 	unregister_netdev(atarilance_dev);
 	free_irq(atarilance_dev->irq, atarilance_dev);
 	free_netdev(atarilance_dev);
 }
-
+module_init(atarilance_module_init);
+module_exit(atarilance_module_exit);
 #endif /* MODULE */
 
 
