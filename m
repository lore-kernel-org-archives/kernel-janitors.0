From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 21 Jun 2005 10:14:33 +0000
Subject: [KJ] [PATCH] Audit return code : drivers/char/lcd.c
Message-Id: <20050621101433.GF4880@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="sXc4Kmr5FA7axrvy"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050621101313.GE4880@rhum.iomeda.fr>
In-Reply-To: <20050621101313.GE4880@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Audit return codes (and handle failure correctly) for misc_register.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>



--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="patch_drivers_char_lcd.c.diff"

diff -urpNX dontdiff 2.6.12-orig/drivers/char/lcd.c 2.6.12/drivers/char/lcd.c
--- 2.6.12-orig/drivers/char/lcd.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/drivers/char/lcd.c	2005-06-21 11:28:26.196325024 +0200
@@ -613,10 +613,14 @@ static struct miscdevice lcd_dev = {
 
 static int lcd_init(void)
 {
+	int ret ;
 	unsigned long data;
 
 	pr_info("%s\n", LCD_DRIVER);
-	misc_register(&lcd_dev);
+	if (ret = misc_register(&lcd_dev)) {
+		printk(KERN_WARNING "Unable to register misc device.\n");
+		return ret ;
+	}
 
 	/* Check region? Naaah! Just snarf it up. */
 /*	request_region(RTC_PORT(0), RTC_IO_EXTENT, "lcd");*/

--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--sXc4Kmr5FA7axrvy--
