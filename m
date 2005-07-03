From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 20:01:42 +0000
Subject: Re: [KJ] [PATCH 2.6.13-rc1 9/17] fix sparse warnings (__nocast type)
Message-Id: <200507032001.42517.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_mQEyCC4HGcxoC8p"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031857.08600.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031857.08600.victor@cetuc.puc-rio.br>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_mQEyCC4HGcxoC8p
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Em Dom 03 Jul 2005 22:36, voc=EA escreveu:
> You forget to patch the prototype 3 lines above and fs/reiserfs/fix_node.c

Here is the correction.

Thanks,

Victor Fusco

=2D------------------------------------------------------------------------=
=2D-------

Description:
=A0=A0=A0=A0=A0=A0=A0=A0Fix the sparse warning "implicit cast to nocast typ=
e"
=A0
=46ile/Subsystem: fs/reiserfs

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--Boundary-00=_mQEyCC4HGcxoC8p
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="reiserfs_fs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfs_fs.patch"

 include/linux/reiserfs_fs.h |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

Index: linux-2.6-git/include/linux/reiserfs_fs.h
===================================================================
--- linux-2.6-git.orig/include/linux/reiserfs_fs.h	2005-07-03 19:43:09.000000000 +0000
+++ linux-2.6-git/include/linux/reiserfs_fs.h	2005-07-03 19:44:45.000000000 +0000
@@ -2005,10 +2005,11 @@
 
 /* fix_nodes.c */
 #ifdef CONFIG_REISERFS_CHECK
-void * reiserfs_kmalloc (size_t size, int flags, struct super_block * s);
+void * reiserfs_kmalloc (size_t size, unsigned int __nocast flags,
+                         struct super_block * s);
 void reiserfs_kfree (const void * vp, size_t size, struct super_block * s);
 #else
-static inline void *reiserfs_kmalloc(size_t size, int flags,
+static inline void *reiserfs_kmalloc(size_t size, unsigned int __nocast flags,
 					struct super_block *s)
 {
 	return kmalloc(size, flags);

--Boundary-00=_mQEyCC4HGcxoC8p
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_mQEyCC4HGcxoC8p--
