From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 19:01:58 +0000
Subject: [KJ] [PATCH 2.6.13-rc1 12/17] fix sparse warnings (__nocast type)
Message-Id: <200507031901.58798.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_mYDyCWHuA48QCWT"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_mYDyCWHuA48QCWT
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"
 
File/Subsystem: drivers/bluetooth/bpa10x.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
 

--Boundary-00=_mYDyCWHuA48QCWT
Content-Type: text/x-diff; charset="iso-8859-1"; name="bluetooth_bpa10x.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="bluetooth_bpa10x.patch"

 drivers/bluetooth/bpa10x.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletion(-)

Index: linux-2.6-git/drivers/bluetooth/bpa10x.c
===================================================================
--- linux-2.6-git.orig/drivers/bluetooth/bpa10x.c	2005-07-03 14:18:34.000000000 +0000
+++ linux-2.6-git/drivers/bluetooth/bpa10x.c	2005-07-03 14:19:23.000000000 +0000
@@ -307,7 +307,9 @@
 	read_unlock(&data->lock);
 }
 
-static inline struct urb *bpa10x_alloc_urb(struct usb_device *udev, unsigned int pipe, size_t size, int flags, void *data)
+static inline struct urb *bpa10x_alloc_urb(struct usb_device *udev, unsigned int pipe,
+                                           size_t size, unsigned int __nocast flags,
+                                           void *data)
 {
 	struct urb *urb;
 	struct usb_ctrlrequest *cr;

--Boundary-00=_mYDyCWHuA48QCWT
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_mYDyCWHuA48QCWT--
