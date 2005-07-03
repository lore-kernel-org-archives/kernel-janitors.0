From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 18:57:08 +0000
Subject: [KJ] [PATCH 2.6.13-rc1 9/17] fix sparse warnings (__nocast type)
Message-Id: <200507031857.08600.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_EUDyC4qiDPQDAXX"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_EUDyC4qiDPQDAXX
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"
 
File/Subsystem: fs/reiserfs

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
 

--Boundary-00=_EUDyC4qiDPQDAXX
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="reiserfs_fs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfs_fs.patch"

 include/linux/reiserfs_fs.h |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6-git/include/linux/reiserfs_fs.h
===================================================================
--- linux-2.6-git.orig/include/linux/reiserfs_fs.h	2005-07-01 17:48:51.000000000 +0000
+++ linux-2.6-git/include/linux/reiserfs_fs.h	2005-07-03 14:15:48.000000000 +0000
@@ -2008,7 +2008,7 @@
 void * reiserfs_kmalloc (size_t size, int flags, struct super_block * s);
 void reiserfs_kfree (const void * vp, size_t size, struct super_block * s);
 #else
-static inline void *reiserfs_kmalloc(size_t size, int flags,
+static inline void *reiserfs_kmalloc(size_t size, unsigned int __nocast flags,
 					struct super_block *s)
 {
 	return kmalloc(size, flags);

--Boundary-00=_EUDyC4qiDPQDAXX
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_EUDyC4qiDPQDAXX--
