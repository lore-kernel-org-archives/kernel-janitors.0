From: Dan Carpenter <error27@gmail.com>
Date: Sat, 10 Jul 2010 09:29:20 +0000
Subject: [patch] kgdb: strlen() doesn't count the terminator
Message-Id: <20100710092920.GT19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is an off by one because strlen() doesn't count the null
terminator.  We strcpy() these strings into an array of size
MAX_CONFIG_LEN.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
index 7245023..799ea0a 100644
--- a/drivers/misc/kgdbts.c
+++ b/drivers/misc/kgdbts.c
@@ -988,7 +988,7 @@ static void kgdbts_run_tests(void)
 
 static int kgdbts_option_setup(char *opt)
 {
-	if (strlen(opt) > MAX_CONFIG_LEN) {
+	if (strlen(opt) >= MAX_CONFIG_LEN) {
 		printk(KERN_ERR "kgdbts: config string too long\n");
 		return -ENOSPC;
 	}
diff --git a/drivers/serial/kgdboc.c b/drivers/serial/kgdboc.c
index a9a94ae..ba7b7c6 100644
--- a/drivers/serial/kgdboc.c
+++ b/drivers/serial/kgdboc.c
@@ -70,7 +70,7 @@ static void kgdboc_unregister_kbd(void)
 
 static int kgdboc_option_setup(char *opt)
 {
-	if (strlen(opt) > MAX_CONFIG_LEN) {
+	if (strlen(opt) >= MAX_CONFIG_LEN) {
 		printk(KERN_ERR "kgdboc: config string too long\n");
 		return -ENOSPC;
 	}
