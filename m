From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 19:06:48 +0000
Subject: [KJ] [PATCH 2.6.13-rc1 16/17] fix sparse warnings (__nocast type)
Message-Id: <200507031906.48856.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_IdDyCj9dpcHhWoM"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_IdDyCj9dpcHhWoM
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"
 
File/Subsystem: drivers/ieee1394/raw1394.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
 

--Boundary-00=_IdDyCj9dpcHhWoM
Content-Type: text/x-diff; charset="iso-8859-1"; name="ieee1394_raw1394.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="ieee1394_raw1394.patch"

 drivers/ieee1394/raw1394.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletion(-)

Index: linux-2.6-git/drivers/ieee1394/raw1394.c
===================================================================
--- linux-2.6-git.orig/drivers/ieee1394/raw1394.c	2005-07-01 17:48:31.000000000 +0000
+++ linux-2.6-git/drivers/ieee1394/raw1394.c	2005-07-03 17:06:04.000000000 +0000
@@ -98,7 +98,8 @@
 
 static void queue_complete_cb(struct pending_request *req);
 
-static struct pending_request *__alloc_pending_request(int flags)
+static struct
+pending_request *__alloc_pending_request(unsigned int __nocast flags)
 {
 	struct pending_request *req;
 

--Boundary-00=_IdDyCj9dpcHhWoM
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_IdDyCj9dpcHhWoM--
