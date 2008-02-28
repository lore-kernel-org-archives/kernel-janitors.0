From: Jon Schindler <jkschind@gmail.com>
Date: Thu, 28 Feb 2008 07:30:33 +0000
Subject: [PATCH 3/9] /drivers/net/apne.c replaced init_module&cleanup_module
Message-Id: <47C66319.9000200@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/net/apne.c b/drivers/net/apne.c
index c12cbdf..47a8275 100644
--- a/drivers/net/apne.c
+++ b/drivers/net/apne.c
@@ -569,7 +569,7 @@ static irqreturn_t apne_interrupt(int irq, void *dev_id)
 #ifdef MODULE
 static struct net_device *apne_dev;
 
-int __init init_module(void)
+static int __init apne_module_init(void)
 {
 	apne_dev = apne_probe(-1);
 	if (IS_ERR(apne_dev))
@@ -577,7 +577,7 @@ int __init init_module(void)
 	return 0;
 }
 
-void __exit cleanup_module(void)
+static void __exit apne_module_exit(void)
 {
 	unregister_netdev(apne_dev);
 
@@ -591,7 +591,8 @@ void __exit cleanup_module(void)
 
 	free_netdev(apne_dev);
 }
-
+module_init(apne_module_init);
+module_exit(apne_module_exit);
 #endif
 
 static int init_pcmcia(void)
