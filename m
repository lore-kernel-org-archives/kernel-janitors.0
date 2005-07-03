From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 18:41:19 +0000
Subject: [KJ] [PATCH 2.6.13-c1 1/17] fix sparse warnings (__nocast type)
Message-Id: <200507031841.19575.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_PFDyCwPItJ5nDaw"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_PFDyCwPItJ5nDaw
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"

File/Subsystem: include/linux/gfp.h

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--Boundary-00=_PFDyCwPItJ5nDaw
Content-Type: text/x-diff;
  charset="us-ascii";
  name="gfp.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="gfp.patch"

 include/linux/gfp.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6-git/include/linux/gfp.h
===================================================================
--- linux-2.6-git.orig/include/linux/gfp.h	2005-07-01 17:48:50.000000000 +0000
+++ linux-2.6-git/include/linux/gfp.h	2005-07-03 14:16:51.000000000 +0000
@@ -12,8 +12,8 @@
  * GFP bitmasks..
  */
 /* Zone modifiers in GFP_ZONEMASK (see linux/mmzone.h - low two bits) */
-#define __GFP_DMA	0x01
-#define __GFP_HIGHMEM	0x02
+#define __GFP_DMA	0x01u
+#define __GFP_HIGHMEM	0x02u
 
 /*
  * Action modifiers - doesn't change the zoning

--Boundary-00=_PFDyCwPItJ5nDaw
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_PFDyCwPItJ5nDaw--
