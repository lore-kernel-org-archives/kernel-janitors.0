From: Jon Schindler <jkschind@gmail.com>
Date: Thu, 28 Feb 2008 07:31:12 +0000
Subject: [PATCH 8/9] /drivers/net/at1700.c replaced init_module&cleanup_module
Message-Id: <47C66340.6030704@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/at1700.c b/drivers/net/at1700.c
index 24d81f9..7e874d4 100644
--- a/drivers/net/at1700.c
+++ b/drivers/net/at1700.c
@@ -881,7 +881,7 @@ MODULE_PARM_DESC(io, "AT1700/FMV18X I/O base address");
 MODULE_PARM_DESC(irq, "AT1700/FMV18X IRQ number");
 MODULE_PARM_DESC(net_debug, "AT1700/FMV18X debug level (0-6)");
 
-int __init init_module(void)
+static int __init at1700_module_init(void)
 {
 	if (io = 0)
 		printk("at1700: You should not use auto-probing with insmod!\n");
@@ -891,13 +891,14 @@ int __init init_module(void)
 	return 0;
 }
 
-void __exit
-cleanup_module(void)
+static void __exit at1700_module_exit(void)
 {
 	unregister_netdev(dev_at1700);
 	cleanup_card(dev_at1700);
 	free_netdev(dev_at1700);
 }
+module_init(at1700_module_init);
+module_exit(at1700_module_exit);
 #endif /* MODULE */
 MODULE_LICENSE("GPL");
 
