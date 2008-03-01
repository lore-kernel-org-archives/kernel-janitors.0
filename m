From: Jon Schindler <jkschind@gmail.com>
Date: Sat, 01 Mar 2008 06:20:22 +0000
Subject: [PATCH 1/9] /drivers/net/8390.c replaced init_module&cleanup_module
Message-Id: <47C8F5A6.6010701@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47C66306.7020006@watson.wustl.edu>
In-Reply-To: <47C66306.7020006@watson.wustl.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/8390.c b/drivers/net/8390.c
index a828076..0ed41a3 100644
--- a/drivers/net/8390.c
+++ b/drivers/net/8390.c
@@ -48,14 +48,16 @@ EXPORT_SYMBOL(__alloc_ei_netdev);
 
 #if defined(MODULE)
 
-int init_module(void)
+static int __init ns8390_module_init(void)
 {
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit ns8390_module_exit(void)
 {
 }
 
+module_init(ns8390_module_init);
+module_exit(ns8390_module_exit);
 #endif /* MODULE */
 MODULE_LICENSE("GPL");
