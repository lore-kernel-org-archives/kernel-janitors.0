From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 21 Jun 2005 10:16:28 +0000
Subject: [KJ] [PATCH] Audit return code : drivers/input/misc/hp_sdc_rtc.c
Message-Id: <20050621101628.GG4880@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7CZp05NP8/gJM8Cl"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050621101313.GE4880@rhum.iomeda.fr>
In-Reply-To: <20050621101313.GE4880@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Audit return codes (and handle failure correctly) for misc_register.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch_drivers_input_misc_hp_sdc_rtc.c.diff"

diff -urpNX dontdiff 2.6.12-orig/drivers/input/misc/hp_sdc_rtc.c 2.6.12/drivers/input/misc/hp_sdc_rtc.c
--- 2.6.12-orig/drivers/input/misc/hp_sdc_rtc.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/drivers/input/misc/hp_sdc_rtc.c	2005-06-21 11:31:18.363151688 +0200
@@ -702,7 +702,10 @@ static int __init hp_sdc_rtc_init(void)
 
 	if ((ret = hp_sdc_request_timer_irq(&hp_sdc_rtc_isr)))
 		return ret;
-	misc_register(&hp_sdc_rtc_dev);
+	if (ret = misc_register(&hp_sdc_rtc_dev)) {
+		printk(KERN_WARNING "Unable to register misc device.\n");
+		return ret ;
+	}
         create_proc_read_entry ("driver/rtc", 0, 0, 
 				hp_sdc_rtc_read_proc, NULL);
 

--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--7CZp05NP8/gJM8Cl--
