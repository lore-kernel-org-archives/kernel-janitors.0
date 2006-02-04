From: Matthew Martin <lihnucks@gmail.com>
Date: Sat, 04 Feb 2006 14:08:45 +0000
Subject: [KJ] [PATCH] MODULE_VERSION()
Message-Id: <1139062125.8030.4.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95121916697702158=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============95121916697702158==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

OK, Sorry about last time. Here it is. Could you please tell me what
you mean by "the filenames need to begin with linux-x.y.z/" Is that
2.6.x or something else?


--- /home/matthew/src/linux-2.6.15.2/drivers/usb/storage/usb.c
2006-01-31 00:25:07.000000000 -0600
+++ /home/matthew/linux-2.6.15.2/drivers/usb/storage/usb.c	2006-02-03
14:31:09.000000000 -0600
@@ -95,10 +95,13 @@
 #include "onetouch.h"
 #endif
 
+#define DRV_VERSION "1.75"
+
 /* Some informational data */
 MODULE_AUTHOR("Matthew Dharm <mdharm-usb@one-eyed-alien.net>");
 MODULE_DESCRIPTION("USB Mass Storage driver for Linux");
 MODULE_LICENSE("GPL");
+MODULE_VERSION(DRV_VERSION);
 
 static unsigned int delay_use = 5;
 module_param(delay_use, uint, S_IRUGO | S_IWUSR);





--===============95121916697702158==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95121916697702158==--
