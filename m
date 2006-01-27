From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 09:33:10 +0000
Subject: [KJ] [Patch 12/12] BUG_ON() Conversion in fs/freevxfs/
Message-Id: <1138354390.7391.66.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92120987272013988=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92120987272013988==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/freevxfs/vxfs_olt.c.orig	2006-01-27 01:28:54.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/freevxfs/vxfs_olt.c	2006-01-27 01:29:31.000000000 +0100
@@ -42,24 +42,21 @@
 static inline void
 vxfs_get_fshead(struct vxfs_oltfshead *fshp, struct vxfs_sb_info *infp)
 {
-	if (infp->vsi_fshino)
-		BUG();
+	BUG_ON(infp->vsi_fshino);
 	infp->vsi_fshino = fshp->olt_fsino[0];
 }
 
 static inline void
 vxfs_get_ilist(struct vxfs_oltilist *ilistp, struct vxfs_sb_info *infp)
 {
-	if (infp->vsi_iext)
-		BUG();
+	BUG_ON(infp->vsi_iext);
 	infp->vsi_iext = ilistp->olt_iext[0]; 
 }
 
 static inline u_long
 vxfs_oblock(struct super_block *sbp, daddr_t block, u_long bsize)
 {
-	if (sbp->s_blocksize % bsize)
-		BUG();
+	BUG_ON(sbp->s_blocksize % bsize);
 	return (block * (sbp->s_blocksize / bsize));
 }
 



--===============92120987272013988==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92120987272013988==--
