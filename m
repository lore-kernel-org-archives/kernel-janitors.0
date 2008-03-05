From: Jon Schindler <jkschind@gmail.com>
Date: Wed, 05 Mar 2008 05:49:36 +0000
Subject: [PATCH 4/11] /drivers/ide/ide.c replaced init_module&cleanup_module
Message-Id: <47CE3470.90400@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org, Andrew Morton <akpm@linux-foundation.org>

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/ide/ide.c b/drivers/ide/ide.c
index 477833f..cff8da2 100644
--- a/drivers/ide/ide.c
+++ b/drivers/ide/ide.c
@@ -1641,7 +1641,7 @@ static char *options = NULL;
 module_param(options, charp, 0);
 MODULE_LICENSE("GPL");
 
-static void __init parse_options (char *line)
+static void __init parse_options(char *line)
 {
 	char *next = line;
 
@@ -1655,13 +1655,14 @@ static void __init parse_options (char *line)
 	}
 }
 
-int __init init_module (void)
+static int __init ide_module_init(void)
 {
 	parse_options(options);
 	return ide_init();
 }
+module_init(ide_module_init);
 
-void __exit cleanup_module (void)
+static void __exit ide_module_exit(void)
 {
 	int index;
 
@@ -1672,6 +1673,7 @@ void __exit cleanup_module (void)
 
 	bus_unregister(&ide_bus_type);
 }
+module_exit(ide_module_exit);
 
 #else /* !MODULE */
 
