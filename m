From: Tony Breeds <tony@bakeyournoodle.com>
Date: Sat, 27 Mar 2004 05:17:05 +0000
Subject: [Kernel-janitors] [PATCH 5/5] remove concatenation with
Message-Id: <20040327051705.GG3445@bakeyournoodle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040322052155.GF17221@bakeyournoodle.com>
In-Reply-To: <20040322052155.GF17221@bakeyournoodle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

--------------------------------------------------------------------------------
diff -X dontdiff -purN 2.6.4.clean/sound/oss/au1000.c 2.6.4.kj_func/sound/oss/au1000.c
--- 2.6.4.clean/sound/oss/au1000.c	2004-01-18 17:51:35.000000000 +1100
+++ 2.6.4.kj_func/sound/oss/au1000.c	2004-03-26 14:32:44.000000000 +1100
@@ -369,7 +369,7 @@ static void set_adc_rate(struct au1000_s
 	adc_rate = rdcodec(s->codec, AC97_PCM_LR_ADC_RATE);
 
 #ifdef AU1000_VERBOSE_DEBUG
-	dbg(__FUNCTION__ ": set to %d Hz", adc_rate);
+	dbg("%s: set to %d Hz", __FUNCTION__, adc_rate);
 #endif
 
 	// some codec's don't allow unequal DAC and ADC rates, in which case
@@ -420,7 +420,7 @@ static void set_dac_rate(struct au1000_s
 	dac_rate = rdcodec(s->codec, AC97_PCM_FRONT_DAC_RATE);
 
 #ifdef AU1000_VERBOSE_DEBUG
-	dbg(__FUNCTION__ ": set to %d Hz", dac_rate);
+	dbg("%s: set to %d Hz", __FUNCTION__, dac_rate);
 #endif
 
 	// some codec's don't allow unequal DAC and ADC rates, in which case
@@ -989,7 +989,7 @@ static int translate_from_user(struct dm
 	for (sample = 0; sample < num_samples; sample++) {
 		if (copy_from_user(usersample, userbuf,
 				   db->user_bytes_per_sample)) {
-			dbg(__FUNCTION__ ": fault");
+			dbg("%s: fault", __FUNCTION__);
 			return -EFAULT;
 		}
 
@@ -1053,7 +1053,7 @@ static int translate_to_user(struct dmab
 
 		if (copy_to_user(userbuf, usersample,
 				 db->user_bytes_per_sample)) {
-			dbg(__FUNCTION__ ": fault");
+			dbg("%s: fault", __FUNCTION__);
 			return -EFAULT;
 		}
 
@@ -1848,9 +1848,9 @@ static int  au1000_open(struct inode *in
 
 #ifdef AU1000_VERBOSE_DEBUG
 	if (file->f_flags & O_NONBLOCK)
-		dbg(__FUNCTION__ ": non-blocking");
+		dbg("%s: non-blocking", __FUNCTION__);
 	else
-		dbg(__FUNCTION__ ": blocking");
+		dbg("%s: blocking", __FUNCTION__);
 #endif
 	
 	file->private_data = s;
diff -X dontdiff -purN 2.6.4.clean/sound/oss/ite8172.c 2.6.4.kj_func/sound/oss/ite8172.c
--- 2.6.4.clean/sound/oss/ite8172.c	2004-01-18 17:51:36.000000000 +1100
+++ 2.6.4.kj_func/sound/oss/ite8172.c	2004-03-26 14:32:44.000000000 +1100
@@ -1779,9 +1779,9 @@ static int it8172_open(struct inode *ino
     
 #ifdef IT8172_VERBOSE_DEBUG
 	if (file->f_flags & O_NONBLOCK)
-		dbg(__FUNCTION__ ": non-blocking");
+		dbg("%s: non-blocking", __FUNCTION__);
 	else
-		dbg(__FUNCTION__ ": blocking");
+		dbg("%s: blocking", __FUNCTION__);
 #endif
 	
 	for (list = devs.next; ; list = list->next) {
diff -X dontdiff -purN 2.6.4.clean/sound/oss/rme96xx.c 2.6.4.kj_func/sound/oss/rme96xx.c
--- 2.6.4.clean/sound/oss/rme96xx.c	2004-01-18 17:51:36.000000000 +1100
+++ 2.6.4.kj_func/sound/oss/rme96xx.c	2004-03-26 14:32:44.000000000 +1100
@@ -872,7 +872,7 @@ int rme96xx_init(rme96xx_info* s)
 	int status;
 	unsigned short rev;
 
-	DBG(printk(__FUNCTION__"\n"));
+	DBG(printk("%s\n", __FUNCTION__));
 	numcards++;
 
 	s->magic = RME96xx_MAGIC; 
@@ -972,7 +972,7 @@ static int __devinit rme96xx_probe(struc
 	int i;
 	rme96xx_info *s;
 
-	DBG(printk(__FUNCTION__"\n"));
+	DBG(printk("%s\n", __FUNCTION__));
 	
 	if (pcidev->irq = 0) 
 		return -1;
@@ -1501,7 +1501,7 @@ static int rme96xx_release(struct inode 
 {
 	struct dmabuf * dma = (struct dmabuf*) file->private_data;
 	/* int hwp;  ... was unused   HP20020201 */
-	DBG(printk(__FUNCTION__"\n"));
+	DBG(printk("%s\n", __FUNCTION__));
 
 	COMM          ("draining")
 	if (dma->open_mode & FMODE_WRITE) {
diff -X dontdiff -purN 2.6.4.clean/sound/oss/trix_boot.h 2.6.4.kj_func/sound/oss/trix_boot.h
--- 2.6.4.clean/sound/oss/trix_boot.h	1970-01-01 10:00:00.000000000 +1000
+++ 2.6.4.kj_func/sound/oss/trix_boot.h	2004-03-26 14:32:44.000000000 +1100
@@ -0,0 +1,2 @@
+static unsigned char * trix_boot = NULL;
+static int trix_boot_len = 0;
diff -X dontdiff -purN 2.6.4.clean/sound/oss/vwsnd.c 2.6.4.kj_func/sound/oss/vwsnd.c
--- 2.6.4.clean/sound/oss/vwsnd.c	2004-01-18 17:51:36.000000000 +1100
+++ 2.6.4.kj_func/sound/oss/vwsnd.c	2004-03-26 14:39:46.000000000 +1100
@@ -195,14 +195,14 @@ static void dbgassert(const char *fcn, i
 
 #define ASSERT(e)      ((e) ? (void) 0 : dbgassert(__FUNCTION__, __LINE__, #e))
 #define DBGDO(x)            x
-#define DBGX(fmt, args...)  (in_interrupt() ? 0 : printk(KERN_ERR fmt, ##args))
-#define DBGP(fmt, args...)  (DBGX(__FUNCTION__ ": " fmt, ##args))
-#define DBGE(fmt, args...)  (DBGX(__FUNCTION__ fmt, ##args))
+#define DBGX(fmt, args...)  (in_interrupt() ? 0 : printk(KERN_ERR fmt , ##args))
+#define DBGP(fmt, args...)  (DBGX("%s: " fmt, __FUNCTION__ , ##args))
+#define DBGE(fmt, args...)  (DBGX("%s" fmt, __FUNCTION__ , ##args))
 #define DBGC(rtn)           (DBGP("calling %s\n", rtn))
 #define DBGR()              (DBGP("returning\n"))
-#define DBGXV(fmt, args...) (shut_up ? 0 : DBGX(fmt, ##args))
-#define DBGPV(fmt, args...) (shut_up ? 0 : DBGP(fmt, ##args))
-#define DBGEV(fmt, args...) (shut_up ? 0 : DBGE(fmt, ##args))
+#define DBGXV(fmt, args...) (shut_up ? 0 : DBGX(fmt , ##args))
+#define DBGPV(fmt, args...) (shut_up ? 0 : DBGP(fmt , ##args))
+#define DBGEV(fmt, args...) (shut_up ? 0 : DBGE(fmt , ##args))
 #define DBGCV(rtn)          (shut_up ? 0 : DBGC(rtn))
 #define DBGRV()             (shut_up ? 0 : DBGR())
 
--------------------------------------------------------------------------------

Yours Tony

        linux.conf.au       http://lca2005.linux.org.au/
	Apr 18-23 2005      The Australian Linux Technical Conference!

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
