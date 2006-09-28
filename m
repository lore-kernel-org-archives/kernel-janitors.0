From: Hashem Masoud <masoudh@batelco.com.bh>
Date: Thu, 28 Sep 2006 23:51:51 +0000
Subject: [KJ] [PATCH] Fix small typo in gus_wave.c
Message-Id: <20060928235151.GA10173@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Hashem Masoud <masoudh@batelco.com.bh>
---
 gus_wave.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)
---
diff -urp linux-2.6.17.13/sound/oss/gus_wave.c linux/sound/oss/gus_wave.c
--- linux-2.6.17.13/sound/oss/gus_wave.c	2006-09-28 20:21:15.635078912 -0300
+++ linux/sound/oss/gus_wave.c	2006-09-28 20:22:18.082585448 -0300
@@ -3032,7 +3032,7 @@ void __init gus_wave_init(struct address
 	samples = (struct patch_info *)vmalloc((MAX_SAMPLE + 1) * sizeof(*samples));
 	if (samples = NULL)
 	{
-		printk(KERN_WARNING "gus_init: Cant allocate memory for instrument tables\n");
+		printk(KERN_WARNING "gus_init: Cannot allocate memory for instrument tables\n");
 		return;
 	}
 	conf_printf(tmp, hw_config);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
