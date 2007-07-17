From: Denis Cheng <crquan@gmail.com>
Date: Tue, 17 Jul 2007 03:56:41 +0000
Subject: [PATCH] add static declaration to non-global functions and init_module / cleanup_module fixes
Message-Id: <11846446011693-git-send-email-crquan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

switch to use module_init / module_exit macros.

To: Bruce Janson <bruce@cs.usyd.edu.au>
Cc: kernel-janitors@vger.kernel.org
Signed-off-by: Denis Cheng <crquan@gmail.com>
---
 drivers/net/wireless/wavelan.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/wavelan.c b/drivers/net/wireless/wavelan.c
index 1cf090d..a489ef4 100644
--- a/drivers/net/wireless/wavelan.c
+++ b/drivers/net/wireless/wavelan.c
@@ -4307,7 +4307,7 @@ out:
  * Insertion of the module
  * I'm now quite proud of the multi-device support.
  */
-int __init init_module(void)
+static int __init wavelan_init(void)
 {
 	int ret = -EIO;		/* Return error if no cards found */
 	int i;
@@ -4371,7 +4371,7 @@ int __init init_module(void)
 /*
  * Removal of the module
  */
-void cleanup_module(void)
+static void __exit wavelan_exit(void)
 {
 #ifdef DEBUG_MODULE_TRACE
 	printk(KERN_DEBUG "-> cleanup_module()\n");
@@ -4398,7 +4398,12 @@ void cleanup_module(void)
 	printk(KERN_DEBUG "<- cleanup_module()\n");
 #endif
 }
+
+module_init(wavelan_init);
+module_exit(wavelan_exit);
+
 #endif				/* MODULE */
+
 MODULE_LICENSE("GPL");
 
 /*
-- 
1.5.2.2

