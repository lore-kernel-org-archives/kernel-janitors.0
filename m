From: Felix Oxley <lkml@oxley.org>
Date: Sat, 08 Oct 2005 15:45:20 +0000
Subject: [KJ] [PATCH] intrep.c char -> unsigned char
Message-Id: <200510081645.22440.lkml@oxley.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_Sm+RDiAfqN6afPd"
List-Id: <kernel-janitors.vger.kernel.org>
To: jffs-dev@axis.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

--Boundary-00=_Sm+RDiAfqN6afPd
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi,
IANAKH but I believe you need the following patch.
As suggested on the Kernel Janitors To Do list, I have been searching for 
chars > 127.
I only found this one!

If the fix is correct please, ACK and push upstream.

regards,
Felix

--- fs/jffs/intrep.c.orig	2005-10-08 15:47:13.000000000 +0100
+++ fs/jffs/intrep.c	2005-10-08 16:13:16.000000000 +0100
@@ -1969,7 +1969,7 @@ retry:
 		iovec_cnt++;
 
 		if (JFFS_GET_PAD_BYTES(raw_inode->nsize)) {
-			static char allff[3]={255,255,255};
+			static unsigned char allff[3]={255,255,255};
 			/* Add some extra padding if necessary */
 			node_iovec[iovec_cnt].iov_base = allff;
 			node_iovec[iovec_cnt].iov_len =

Signed-off-by: Felix Oxley <lkml@oxley.org>

--Boundary-00=_Sm+RDiAfqN6afPd
Content-Type: text/x-diff; charset="us-ascii"; name="patch-intrep.c-2.6.13"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="patch-intrep.c-2.6.13"

--- fs/jffs/intrep.c.orig	2005-10-08 15:47:13.000000000 +0100
+++ fs/jffs/intrep.c	2005-10-08 16:13:16.000000000 +0100
@@ -1969,7 +1969,7 @@ retry:
 		iovec_cnt++;
 
 		if (JFFS_GET_PAD_BYTES(raw_inode->nsize)) {
-			static char allff[3]={255,255,255};
+			static unsigned char allff[3]={255,255,255};
 			/* Add some extra padding if necessary */
 			node_iovec[iovec_cnt].iov_base = allff;
 			node_iovec[iovec_cnt].iov_len =

--Boundary-00=_Sm+RDiAfqN6afPd
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_Sm+RDiAfqN6afPd--
