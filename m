From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 23 Jun 2005 07:31:01 +0000
Subject: [KJ] [PATCH][RESEND] Audit return code :
Message-Id: <20050623073101.GD5075@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37709743968822235=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622080346.GH5054@rhum.iomeda.fr>
In-Reply-To: <20050622080346.GH5054@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============37709743968822235==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

description:
Audit return codes (and handle failure correctly) for misc_register.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


diff -urpNX dontdiff 2.6.12-orig/drivers/input/misc/hp_sdc_rtc.c 2.6.12/drivers/input/misc/hp_sdc_rtc.c
--- 2.6.12-orig/drivers/input/misc/hp_sdc_rtc.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/drivers/input/misc/hp_sdc_rtc.c	2005-06-23 09:27:03.883888792 +0200
@@ -697,14 +697,24 @@ static struct miscdevice hp_sdc_rtc_dev 
 static int __init hp_sdc_rtc_init(void)
 {
 	int ret;
+	struct proc_dir_entry* proc_de;
 
 	init_MUTEX(&i8042tregs);
 
 	if ((ret = hp_sdc_request_timer_irq(&hp_sdc_rtc_isr)))
 		return ret;
-	misc_register(&hp_sdc_rtc_dev);
-        create_proc_read_entry ("driver/rtc", 0, 0, 
+	ret = misc_register(&hp_sdc_rtc_dev);
+	if (ret) {
+		printk(KERN_WARNING "hp_sdc_rtc: "
+				"Unable to register misc device.\n");
+		return ret;
+	}
+	proc_de = create_proc_read_entry("driver/rtc", 0, 0, 
 				hp_sdc_rtc_read_proc, NULL);
+	if (proc_de == NULL) {
+		printk(KERN_WARNING "hp_sdc_rtc: "
+				"Unable to create proc dir entry.\n");
+	}
 
 	printk(KERN_INFO "HP i8042 SDC + MSM-58321 RTC support loaded "
 			 "(RTC v " RTC_VERSION ")\n");

--===============37709743968822235==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37709743968822235==--
