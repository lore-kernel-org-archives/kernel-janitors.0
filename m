From: Jon Schindler <jkschind@gmail.com>
Date: Wed, 05 Mar 2008 05:49:26 +0000
Subject: [PATCH 3/11] /drivers/char/ip2/ip2main.c replaced init_module&cleanup_module
Message-Id: <47CE3466.5050306@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org, Andrew Morton <akpm@linux-foundation.org>

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/char/ip2/ip2main.c b/drivers/char/ip2/ip2main.c
index b1d6cad..048e7c8 100644
--- a/drivers/char/ip2/ip2main.c
+++ b/drivers/char/ip2/ip2main.c
@@ -354,14 +354,15 @@ have_requested_irq( char irq )
 /* the driver initialisation function and returns what it returns.            */
 /******************************************************************************/
 #ifdef MODULE
-int
-init_module(void)
+static int __init
+ip2_init_module(void)
 {
 #ifdef IP2DEBUG_INIT
 	printk (KERN_DEBUG "Loading module ...\n" );
 #endif
     return 0;
 }
+module_init(ip2_init_module);
 #endif /* MODULE */
 
 /******************************************************************************/
@@ -380,8 +381,8 @@ init_module(void)
 /* driver should be returned since it may be unloaded from memory.            */
 /******************************************************************************/
 #ifdef MODULE
-void
-cleanup_module(void)
+void __exit
+ip2_cleanup_module(void)
 {
 	int err;
 	int i;
@@ -451,6 +452,7 @@ cleanup_module(void)
 	printk (KERN_DEBUG "IP2 Unloaded\n" );
 #endif
 }
+module_exit(ip2_cleanup_module);
 #endif /* MODULE */
 
 static const struct tty_operations ip2_ops = {
