From: Jon Schindler <jkschind@gmail.com>
Date: Thu, 28 Feb 2008 07:30:50 +0000
Subject: [PATCH 4/9] /drivers/net/appletalk/cops.c replaced init_module&cleanup_module
Message-Id: <47C6632A.2000505@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/appletalk/cops.c b/drivers/net/appletalk/cops.c
index 92c3a4c..65b901e 100644
--- a/drivers/net/appletalk/cops.c
+++ b/drivers/net/appletalk/cops.c
@@ -1010,7 +1010,7 @@ module_param(io, int, 0);
 module_param(irq, int, 0);
 module_param(board_type, int, 0);
 
-int __init init_module(void)
+static int __init cops_module_init(void)
 {
 	if (io = 0)
 		printk(KERN_WARNING "%s: You shouldn't autoprobe with insmod\n",
@@ -1021,12 +1021,14 @@ int __init init_module(void)
         return 0;
 }
 
-void __exit cleanup_module(void)
+static void __exit cops_module_exit(void)
 {
 	unregister_netdev(cops_dev);
 	cleanup_card(cops_dev);
 	free_netdev(cops_dev);
 }
+module_init(cops_module_init);
+module_exit(cops_module_exit);
 #endif /* MODULE */
 
 /*
