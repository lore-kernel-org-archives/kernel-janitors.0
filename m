From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 19 Feb 2004 12:35:43 +0000
Subject: [Kernel-janitors] [PATCH][RFC] - proc cleanup for
Message-Id: <1077194142.3626.6.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi list,

 Doing some greps, I found a bad proc setup in some drivers. This
is the case of drivers/char/genrtc.c.

 Bellow is a trivial patch to fix it. I would like to know if
someone think that this work should _not_ be done.

(Note that my last if is "if(..)" insteed of "if (..)", I'm doing
this because the "if" above do that too. I _think_ is bad to have two
different ways, but I can change if someone not agree).

diff -Nru linux-2.6.3-rc4/drivers/char/genrtc.c linux-2.6.3-rc4~/drivers/char/genrtc.c
--- linux-2.6.3-rc4/drivers/char/genrtc.c	2004-02-05 08:42:27.000000000 -0200
+++ linux-2.6.3-rc4~/drivers/char/genrtc.c	2004-02-17 16:36:15.000000000 -0300
@@ -466,6 +466,19 @@
 	return len;
 }
 
+static int __init gen_rtc_proc_init(struct miscdevice *dev)
+{
+	struct proc_dir_entry *r;
+
+	r = create_proc_read_entry("driver/rtc", 0, 0, gen_rtc_read_proc, NULL);
+	if (!r) {
+		misc_deregister(dev);
+		return -ENOMEM;
+	}
+	return 0;
+}
+#else
+static inline int gen_rtc_proc_init(struct miscdevice *dev) { return 0; }
 #endif /* CONFIG_PROC_FS */
 
 
@@ -501,12 +514,9 @@
 	if(retval < 0)
 		return retval;
 
-#ifdef CONFIG_PROC_FS
-	if((create_proc_read_entry ("driver/rtc", 0, 0, gen_rtc_read_proc, NULL)) = NULL){
-		misc_deregister(&rtc_gen_dev);
-		return -ENOMEM;
-	}
-#endif
+	retval = gen_rtc_proc_init(&rtc_gen_dev);
+	if(retval < 0)
+		return retval;
 
 	return 0;
 }

-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
