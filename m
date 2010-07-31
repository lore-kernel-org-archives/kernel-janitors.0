From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 31 Jul 2010 17:39:24 +0000
Subject: [PATCH 5/7] usb: omap_udc: check return value of proc_create()
Message-Id: <1280597965-8525-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, Tony Lindgren <tony@atomide.com>, Cory Maccarrone <darkstar6262@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

proc_create() may fail, if so return -ENOMEM.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/usb/gadget/omap_udc.c |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/omap_udc.c b/drivers/usb/gadget/omap_udc.c
index f81e4f0..1083216 100644
--- a/drivers/usb/gadget/omap_udc.c
+++ b/drivers/usb/gadget/omap_udc.c
@@ -2544,9 +2544,9 @@ static const struct file_operations proc_ops = {
 	.release	= single_release,
 };
 
-static void create_proc_file(void)
+static int create_proc_file(void)
 {
-	proc_create(proc_filename, 0, NULL, &proc_ops);
+	return (proc_create(proc_filename, 0, NULL, &proc_ops) = NULL);
 }
 
 static void remove_proc_file(void)
@@ -2556,7 +2556,7 @@ static void remove_proc_file(void)
 
 #else
 
-static inline void create_proc_file(void) {}
+static inline int create_proc_file(void) { return 0; }
 static inline void remove_proc_file(void) {}
 
 #endif
@@ -2998,13 +2998,19 @@ known:
 #endif
 	}
 
-	create_proc_file();
+	if (create_proc_file()) {
+		status = -ENOMEM;
+		goto cleanup3;
+	}
+
 	status = device_add(&udc->gadget.dev);
 	if (!status)
 		return status;
 	/* If fail, fall through */
-#ifdef	USE_ISO
+
+	remove_proc_file();
 cleanup3:
+#ifdef	USE_ISO
 	free_irq(pdev->resource[2].start, udc);
 #endif
 
-- 
1.7.0.4

