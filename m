From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 19:00:02 +0000
Subject: [KJ] [PATCH 2.6.13-rc1 11/17] fix sparse warnings (__nocast type)
Message-Id: <200507031900.02246.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_yWDyCUMjhrGRfkO"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_yWDyCUMjhrGRfkO
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"
 
File/Subsystem: drivers/bluetooth/hci_usb.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
 

--Boundary-00=_yWDyCUMjhrGRfkO
Content-Type: text/x-diff; charset="iso-8859-1"; name="bluetooth_hci_usb.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="bluetooth_hci_usb.patch"

 drivers/bluetooth/hci_usb.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6-git/drivers/bluetooth/hci_usb.c
===================================================================
--- linux-2.6-git.orig/drivers/bluetooth/hci_usb.c	2005-07-01 17:48:30.000000000 +0000
+++ linux-2.6-git/drivers/bluetooth/hci_usb.c	2005-07-03 14:15:48.000000000 +0000
@@ -126,7 +126,7 @@
 	{ }	/* Terminating entry */
 };
 
-static struct _urb *_urb_alloc(int isoc, int gfp)
+static struct _urb *_urb_alloc(int isoc, unsigned int __nocast gfp)
 {
 	struct _urb *_urb = kmalloc(sizeof(struct _urb) +
 				sizeof(struct usb_iso_packet_descriptor) * isoc, gfp);

--Boundary-00=_yWDyCUMjhrGRfkO
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_yWDyCUMjhrGRfkO--
