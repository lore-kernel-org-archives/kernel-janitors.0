From: Matthew Martin <lihnucks@gmail.com>
Date: Wed, 15 Feb 2006 02:21:12 +0000
Subject: [KJ] [PATCH] Fix warning in drivers/usb/media/ov511.c
Message-Id: <1139970072.25492.4.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40169324981392451=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============40169324981392451==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


Hello,
Gcc 4.0.2 had the warning:

drivers/usb/media/ov511.c: In function 'show_exposure':
drivers/usb/media/ov511.c:5642: warning: 'exp' may be used uninitialized
in this function

Here is the patch to fix that warning.

Signed-off-by: Matthew Martin <lihnucks@gmail.com>

---

--- orig-linux-2.6.15/drivers/usb/media/ov511.c	2006-02-14 15:15:10.000000000 -0600
+++ linux-2.6.15/drivers/usb/media/ov511.c	2006-02-14 15:12:32.000000000 -0600
@@ -5639,7 +5639,7 @@ static CLASS_DEVICE_ATTR(hue, S_IRUGO, s
 static ssize_t show_exposure(struct class_device *cd, char *buf)
 {
 	struct usb_ov511 *ov = cd_to_ov(cd);
-	unsigned char exp;
+	unsigned char exp = '\0';
 
 	if (!ov->dev)
 		return -ENODEV;



--===============40169324981392451==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40169324981392451==--
