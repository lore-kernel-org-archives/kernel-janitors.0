From: Jon Schindler <jkschind@gmail.com>
Date: Wed, 05 Mar 2008 05:50:15 +0000
Subject: [PATCH 7/11] /drivers/net/3c507.c replaced init_module&cleanup_module
Message-Id: <47CE3497.4000403@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org, Andrew Morton <akpm@linux-foundation.org>

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/3c507.c b/drivers/net/3c507.c
index 030c147..07b6d7d 100644
--- a/drivers/net/3c507.c
+++ b/drivers/net/3c507.c
@@ -918,16 +918,16 @@ module_param(irq, int, 0);
 MODULE_PARM_DESC(io, "EtherLink16 I/O base address");
 MODULE_PARM_DESC(irq, "(ignored)");
 
-int __init init_module(void)
+static int __init tc507_module_init(void)
 {
 	if (io = 0)
 		printk("3c507: You should not use auto-probing with insmod!\n");
 	dev_3c507 = el16_probe(-1);
 	return IS_ERR(dev_3c507) ? PTR_ERR(dev_3c507) : 0;
 }
+module_init(tc507_module_init);
 
-void __exit
-cleanup_module(void)
+static void __exit tc507_module_exit(void)
 {
 	struct net_device *dev = dev_3c507;
 	unregister_netdev(dev);
@@ -936,6 +936,8 @@ cleanup_module(void)
 	release_region(dev->base_addr, EL16_IO_EXTENT);
 	free_netdev(dev);
 }
+module_exit(tc507_module_exit);
+
 #endif /* MODULE */
 MODULE_LICENSE("GPL");
 
