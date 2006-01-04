From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 04 Jan 2006 17:12:30 +0000
Subject: [KJ] [PATCH 2/2] Remove LINUX_VERSION_CODE check in pwc/pwc-if.c
Message-Id: <1136394751.4692.6.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97918590294676289=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97918590294676289==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch removes the LINUX_VERSION check in
drivers/usb/media/pwc/pwc-if.c

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-eric/drivers/usb/media/pwc/pwc-if.c.orig	2006-01-04 18:03:17.000000000 +0100
+++ linux-2.6.15-eric/drivers/usb/media/pwc/pwc-if.c	2006-01-04 18:03:44.000000000 +0100
@@ -827,13 +827,10 @@ static int pwc_isoc_init(struct pwc_devi
 	/* Get the current alternate interface, adjust packet size */
 	if (!udev->actconfig)
 		return -EFAULT;
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,5)
-	idesc = &udev->actconfig->interface[0]->altsetting[pdev->valternate];
-#else
+
 	intf = usb_ifnum_to_if(udev, 0);
 	if (intf)
 		idesc = usb_altnum_to_altsetting(intf, pdev->valternate);
-#endif
 		
 	if (!idesc)
 		return -EFAULT;



--===============97918590294676289==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97918590294676289==--
