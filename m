From: Jon Schindler <jkschind@gmail.com>
Date: Wed, 05 Mar 2008 05:49:06 +0000
Subject: [PATCH 1/11] /drivers/block/floppy.c replaced init_module&cleanup_module
Message-Id: <47CE3452.3070509@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 32c79a5..9a3d509 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4528,14 +4528,15 @@ static void __init parse_floppy_cfg_string(char *cfg)
 	}
 }
 
-int __init init_module(void)
+static int __init floppy_module_init(void)
 {
 	if (floppy)
 		parse_floppy_cfg_string(floppy);
 	return floppy_init();
 }
+module_init(floppy_module_init);
 
-void cleanup_module(void)
+static void __exit floppy_module_exit(void)
 {
 	int drive;
 
@@ -4567,6 +4568,7 @@ void cleanup_module(void)
 
 	wait_for_completion(&device_release);
 }
+module_exit(floppy_module_exit);
 
 module_param(floppy, charp, 0);
 module_param(FLOPPY_IRQ, int, 0);

