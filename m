From: Jon Schindler <jkschind@gmail.com>
Date: Thu, 28 Feb 2008 07:31:00 +0000
Subject: [PATCH 5/9] /drivers/net/appletalk/ltpc.c replaced init_module&cleanup_module
Message-Id: <47C66334.7080003@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/appletalk/ltpc.c b/drivers/net/appletalk/ltpc.c
index 6ab2c2d..fef5560 100644
--- a/drivers/net/appletalk/ltpc.c
+++ b/drivers/net/appletalk/ltpc.c
@@ -1252,7 +1252,7 @@ module_param(irq, int, 0);
 module_param(dma, int, 0);
 
 
-int __init init_module(void)
+static int __init ltpc_module_init(void)
 {
         if(io = 0)
 		printk(KERN_NOTICE
@@ -1263,6 +1263,7 @@ int __init init_module(void)
 		return PTR_ERR(dev_ltpc);
 	return 0;
 }
+module_init(ltpc_module_init);
 #endif
 
 static void __exit ltpc_cleanup(void)
