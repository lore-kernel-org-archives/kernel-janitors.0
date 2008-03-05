From: Jon Schindler <jkschind@gmail.com>
Date: Wed, 05 Mar 2008 05:50:37 +0000
Subject: [PATCH 9/11] /drivers/net/3c523.c replaced init_module&cleanup_module
Message-Id: <47CE34AD.2040504@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org, Andrew Morton <akpm@linux-foundation.org>

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/3c523.c b/drivers/net/3c523.c
index 239fc42..cb4beba 100644
--- a/drivers/net/3c523.c
+++ b/drivers/net/3c523.c
@@ -1268,7 +1268,7 @@ MODULE_PARM_DESC(io, "EtherLink/MC I/O base address(es)");
 MODULE_PARM_DESC(irq, "EtherLink/MC IRQ number(s)");
 MODULE_LICENSE("GPL");
 
-int __init init_module(void)
+static int __init tc523_module_init(void)
 {
 	int this_dev,found = 0;
 
@@ -1295,8 +1295,9 @@ int __init init_module(void)
 		return -ENXIO;
 	} else return 0;
 }
+module_init(tc523_module_init);
 
-void __exit cleanup_module(void)
+static void __exit tc523_module_exit(void)
 {
 	int this_dev;
 	for (this_dev=0; this_dev<MAX_3C523_CARDS; this_dev++) {
@@ -1308,5 +1309,6 @@ void __exit cleanup_module(void)
 		}
 	}
 }
+module_exit(tc523_module_exit);
 
 #endif				/* MODULE */
