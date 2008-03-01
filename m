From: Jon Schindler <jkschind@gmail.com>
Date: Sat, 01 Mar 2008 06:20:43 +0000
Subject: [PATCH 2/9] /drivers/net/ac3200.c replaced init_module&cleanup_module
Message-Id: <47C8F5BB.3080500@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/ac3200.c b/drivers/net/ac3200.c
index 5136d94..b144863 100644
--- a/drivers/net/ac3200.c
+++ b/drivers/net/ac3200.c
@@ -369,7 +369,7 @@ MODULE_PARM_DESC(mem, "Memory base address(es)");
 MODULE_DESCRIPTION("Ansel AC3200 EISA ethernet driver");
 MODULE_LICENSE("GPL");
 
-int __init init_module(void)
+static int __init ac3200_module_init(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -404,8 +404,7 @@ static void cleanup_card(struct net_device *dev)
 	iounmap(ei_status.mem);
 }
 
-void __exit
-cleanup_module(void)
+static void __exit ac3200_module_exit(void)
 {
 	int this_dev;
 
@@ -418,4 +417,6 @@ cleanup_module(void)
 		}
 	}
 }
+module_init(ac3200_module_init);
+module_exit(ac3200_module_exit);
 #endif /* MODULE */
