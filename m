From: Jon Schindler <jkschind@gmail.com>
Date: Wed, 05 Mar 2008 05:51:01 +0000
Subject: [PATCH 11/11] /drivers/net/82596.c replaced init_module&cleanup_module
Message-Id: <47CE34C5.6010805@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org, Andrew Morton <akpm@linux-foundation.org>

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/82596.c b/drivers/net/82596.c
index 2797da7..344308a 100644
--- a/drivers/net/82596.c
+++ b/drivers/net/82596.c
@@ -1567,7 +1567,7 @@ static int debug = -1;
 module_param(debug, int, 0);
 MODULE_PARM_DESC(debug, "i82596 debug mask");
 
-int __init init_module(void)
+static int __init i82596_module_init(void)
 {
 	if (debug >= 0)
 		i596_debug = debug;
@@ -1576,8 +1576,9 @@ int __init init_module(void)
 		return PTR_ERR(dev_82596);
 	return 0;
 }
+module_init(i82596_module_init);
 
-void __exit cleanup_module(void)
+static void __exit i82596_module_exit(void)
 {
 	unregister_netdev(dev_82596);
 #ifdef __mc68000__
@@ -1595,7 +1596,7 @@ void __exit cleanup_module(void)
 #endif
 	free_netdev(dev_82596);
 }
-
+module_exit(i82596_module_exit);
 #endif				/* MODULE */
 
 /*
