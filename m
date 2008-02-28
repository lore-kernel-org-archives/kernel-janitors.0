From: Jon Schindler <jkschind@gmail.com>
Date: Thu, 28 Feb 2008 07:31:05 +0000
Subject: [PATCH 6/9] /drivers/net/arcnet/capmode.c replaced init_module&cleanup_module
Message-Id: <47C66339.9090607@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/arcnet/capmode.c b/drivers/net/arcnet/capmode.c
index cc4610d..02cb8f1 100644
--- a/drivers/net/arcnet/capmode.c
+++ b/drivers/net/arcnet/capmode.c
@@ -80,17 +80,19 @@ void arcnet_cap_init(void)
 
 #ifdef MODULE
 
-int __init init_module(void)
+static int __init capmode_module_init(void)
 {
 	printk(VERSION);
 	arcnet_cap_init();
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit capmode_module_exit(void)
 {
 	arcnet_unregister_proto(&capmode_proto);
 }
+module_init(capmode_module_init);
+module_exit(capmode_module_exit);
 
 MODULE_LICENSE("GPL");
 #endif				/* MODULE */
