From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Fri, 20 Feb 2004 20:32:46 +0000
Subject: [Kernel-janitors] [PATCH][REDIFF] - proc cleanup for
Message-Id: <1077309166.17385.11.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


 Hi,

 This version have the Francois tip:
diff -Nru linux-2.6.3/drivers/char/genrtc.c linux-2.6.3~/drivers/char/genrtc.c
--- linux-2.6.3/drivers/char/genrtc.c	2004-02-05 08:42:27.000000000 -0200
+++ linux-2.6.3~/drivers/char/genrtc.c	2004-02-20 17:07:17.000000000 -0300
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
 
 
@@ -501,14 +514,8 @@
 	if(retval < 0)
 		return retval;
 
-#ifdef CONFIG_PROC_FS
-	if((create_proc_read_entry ("driver/rtc", 0, 0, gen_rtc_read_proc, NULL)) = NULL){
-		misc_deregister(&rtc_gen_dev);
-		return -ENOMEM;
-	}
-#endif
-
-	return 0;
+	retval = gen_rtc_proc_init(&rtc_gen_dev);
+	return retval;
 }
 
 static void __exit rtc_generic_exit(void)


-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
