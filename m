From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Date: Sun, 15 Jan 2012 20:44:34 +0000
Subject: [PATCH] staging: android: ram_console use kmemdup instead of kmalloc
Message-Id: <1326660274-32259-1-git-send-email-Gregory.Dietsche@cuw.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Replace kmalloc + memcpy will kmemdup in ram_console_late_init

Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
---
 drivers/staging/android/ram_console.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/android/ram_console.c b/drivers/staging/android/ram_console.c
index 6d4d679..0cb3f3c 100644
--- a/drivers/staging/android/ram_console.c
+++ b/drivers/staging/android/ram_console.c
@@ -411,15 +411,14 @@ static int __init ram_console_late_init(void)
 	if (ram_console_old_log = NULL)
 		return 0;
 #ifdef CONFIG_ANDROID_RAM_CONSOLE_EARLY_INIT
-	ram_console_old_log = kmalloc(ram_console_old_log_size, GFP_KERNEL);
+	ram_console_old_log = kmemdup(ram_console_old_log_init_buffer,
+					ram_console_old_log_size, GFP_KERNEL);
 	if (ram_console_old_log = NULL) {
 		printk(KERN_ERR
 		       "ram_console: failed to allocate buffer for old log\n");
 		ram_console_old_log_size = 0;
 		return 0;
 	}
-	memcpy(ram_console_old_log,
-	       ram_console_old_log_init_buffer, ram_console_old_log_size);
 #endif
 	entry = create_proc_entry("last_kmsg", S_IFREG | S_IRUGO, NULL);
 	if (!entry) {
-- 
1.7.6.4

