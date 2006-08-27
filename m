From: James Nelson <james4765@gmail.com>
Date: Sun, 27 Aug 2006 20:43:26 +0000
Subject: [KJ] [PATCH] ibmmca: Remove
Message-Id: <20060827204326.15261.86816.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/drivers/scsi/ibmmca.c b/drivers/scsi/ibmmca.c
index 2be1dc5..1144ad2 100644
--- a/drivers/scsi/ibmmca.c
+++ b/drivers/scsi/ibmmca.c
@@ -447,13 +447,6 @@ module_param(boot_options, charp, 0);
 module_param_array(io_port, int, NULL, 0);
 module_param_array(scsi_id, int, NULL, 0);
 
-#if 0 /* FIXME: No longer exist? --RR */
-MODULE_PARM(display, "1i");
-MODULE_PARM(adisplay, "1i");
-MODULE_PARM(normal, "1i");
-MODULE_PARM(ansi, "1i");
-#endif
-
 MODULE_LICENSE("GPL");
 #endif
 /*counter of concurrent disk read/writes, to turn on/off disk led */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
