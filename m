From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 22 Jun 2005 07:56:33 +0000
Subject: [KJ] [PATCH] [RESEND] Audit return code : drivers/char/lcd.c
Message-Id: <20050622075633.GF5054@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============049389982322121995=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622075313.GE5054@rhum.iomeda.fr>
In-Reply-To: <20050622075313.GE5054@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============049389982322121995==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

description:
Audit return codes (and handle failure correctly) for misc_register.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


diff -urpNX dontdiff 2.6.12-orig/drivers/char/lcd.c 2.6.12/drivers/char/lcd.c
--- 2.6.12-orig/drivers/char/lcd.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/drivers/char/lcd.c	2005-06-22 08:56:54.000000000 +0200
@@ -613,10 +613,15 @@ static struct miscdevice lcd_dev = {
 
 static int lcd_init(void)
 {
+	int ret ;
 	unsigned long data;
 
 	pr_info("%s\n", LCD_DRIVER);
-	misc_register(&lcd_dev);
+	ret = misc_register(&lcd_dev);
+	if (ret) {
+		printk(KERN_WARNING "Unable to register misc device.\n");
+		return ret ;
+	}
 
 	/* Check region? Naaah! Just snarf it up. */
 /*	request_region(RTC_PORT(0), RTC_IO_EXTENT, "lcd");*/

--===============049389982322121995==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============049389982322121995==--
