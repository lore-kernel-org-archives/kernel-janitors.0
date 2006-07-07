From: Richard <h.vanberkum@chello.nl>
Date: Fri, 07 Jul 2006 10:04:57 +0000
Subject: [KJ] [PATCH] drivers/base/power/trace.c: Add KERN_* to printk
Message-Id: <20060707122259.GA10354@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add KERN_* to printk statements

Signed-off-by: Richard van Berkum <h.vanberkum at chello.nl>

---

 drivers/base/power/trace.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


--- linux-2.6/drivers/base/power/trace.c	2006-07-06 16:58:04.646479176 +0200
+++ mytree/drivers/base/power/trace.c	2006-07-07 14:13:24.458403576 +0200
@@ -112,7 +112,7 @@ static unsigned int read_magic_time(void
 	unsigned int val;
 
 	get_rtc_time(&time);
-	printk("Time: %2d:%02d:%02d  Date: %02d/%02d/%02d\n",
+	printk(KERN_INFO "Time: %2d:%02d:%02d  Date: %02d/%02d/%02d\n",
 		time.tm_hour, time.tm_min, time.tm_sec,
 		time.tm_mon, time.tm_mday, time.tm_year);
 	val = time.tm_year;				/* 100 years */
@@ -176,7 +176,7 @@ static int show_file_hash(unsigned int v
 		unsigned int hash = hash_string(lineno, file, FILEHASH);
 		if (hash != value)
 			continue;
-		printk("  hash matches %s:%u\n", file, lineno);
+		printk(KERN_INFO "  hash matches %s:%u\n", file, lineno);
 		match++;
 	}
 	return match;
@@ -191,7 +191,7 @@ static int show_dev_hash(unsigned int va
 		struct device * dev = to_device(entry);
 		unsigned int hash = hash_string(DEVSEED, dev->bus_id, DEVHASH);
 		if (hash = value) {
-			printk("  hash matches device %s\n", dev->bus_id);
+			printk(KERN_INFO "  hash matches device %s\n", dev->bus_id);
 			match++;
 		}
 		entry = entry->prev;
@@ -218,7 +218,7 @@ static int late_resume_init(void)
 	val = val / FILEHASH;
 	dev = val /* % DEVHASH */;
 
-	printk("  Magic number: %d:%d:%d\n", user, file, dev);
+	printk(KERN_INFO "  Magic number: %d:%d:%d\n", user, file, dev);
 	show_file_hash(file);
 	show_dev_hash(dev);
 	return 0;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
