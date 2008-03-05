From: Jon Schindler <jkschind@gmail.com>
Date: Wed, 05 Mar 2008 05:50:26 +0000
Subject: [PATCH 8/11] /drivers/net/3c515.c replaced init_module&cleanup_module
Message-Id: <47CE34A2.40402@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org, Andrew Morton <akpm@linux-foundation.org>

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/3c515.c b/drivers/net/3c515.c
index 6ab84b6..107d1ff 100644
--- a/drivers/net/3c515.c
+++ b/drivers/net/3c515.c
@@ -415,7 +415,7 @@ MODULE_PARM_DESC(max_interrupt_work, "3c515 maximum events handled per interrupt
 /* we will need locking (and refcounting) if we ever use it for more */
 static LIST_HEAD(root_corkscrew_dev);
 
-int init_module(void)
+static int __init tc515_module_init(void)
 {
 	int found = 0;
 	if (debug >= 0)
@@ -426,6 +426,7 @@ int init_module(void)
 		found++;
 	return found ? 0 : -ENODEV;
 }
+module_init(tc515_module_init);
 
 #else
 struct net_device *tc515_probe(int unit)
@@ -1565,7 +1566,7 @@ static const struct ethtool_ops netdev_ethtool_ops = {
 
 
 #ifdef MODULE
-void cleanup_module(void)
+static void __exit tc515_module_exit(void)
 {
 	while (!list_empty(&root_corkscrew_dev)) {
 		struct net_device *dev;
@@ -1579,6 +1580,8 @@ void cleanup_module(void)
 		free_netdev(dev);
 	}
 }
+module_exit(tc515_module_exit);
+
 #endif				/* MODULE */
 
 /*
