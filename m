From: Jon Schindler <jkschind@gmail.com>
Date: Thu, 28 Feb 2008 07:31:08 +0000
Subject: [PATCH 7/9] /drivers/net/arcnet/com20020.c replaced init_module&cleanup_module
Message-Id: <47C6633C.4000505@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/arcnet/com20020.c b/drivers/net/arcnet/com20020.c
index 7cf0a25..8b51313 100644
--- a/drivers/net/arcnet/com20020.c
+++ b/drivers/net/arcnet/com20020.c
@@ -348,14 +348,15 @@ MODULE_LICENSE("GPL");
 
 #ifdef MODULE
 
-int init_module(void)
+static int __init com20020_module_init(void)
 {
 	BUGLVL(D_NORMAL) printk(VERSION);
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit com20020_module_exit(void)
 {
 }
-
+module_init(com20020_module_init);
+module_exit(com20020_module_exit);
 #endif				/* MODULE */
