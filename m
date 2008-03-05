From: Jon Schindler <jkschind@gmail.com>
Date: Wed, 05 Mar 2008 05:49:58 +0000
Subject: [PATCH 6/11] /drivers/net/3c505.c replaced init_module&cleanup_module
Message-Id: <47CE3486.7010609@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org, Andrew Morton <akpm@linux-foundation.org>

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/3c505.c b/drivers/net/3c505.c
index 9c65734..7eed97f 100644
--- a/drivers/net/3c505.c
+++ b/drivers/net/3c505.c
@@ -1615,7 +1615,7 @@ MODULE_PARM_DESC(io, "EtherLink Plus I/O base address(es)");
 MODULE_PARM_DESC(irq, "EtherLink Plus IRQ number(s) (assigned)");
 MODULE_PARM_DESC(dma, "EtherLink Plus DMA channel(s)");
 
-int __init init_module(void)
+static int __init tc505_module_init(void)
 {
 	int this_dev, found = 0;
 
@@ -1651,8 +1651,9 @@ int __init init_module(void)
 		return -ENODEV;
 	return 0;
 }
+module_init(tc505_module_init);
 
-void __exit cleanup_module(void)
+static void __exit tc505_module_exit(void)
 {
 	int this_dev;
 
@@ -1665,6 +1666,7 @@ void __exit cleanup_module(void)
 		}
 	}
 }
+module_exit(tc505_module_exit);
 
 #endif				/* MODULE */
 MODULE_LICENSE("GPL");
