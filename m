From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 07 Sep 2014 16:18:32 +0000
Subject: [PATCH 4/7] staging: lustre: lvfs: expand the GOTO macro
Message-Id: <1410106715-9573-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, "Dilger, Andreas" <andreas.dilger@intel.com>, "Drokin, Oleg" <oleg.drokin@intel.com>, Peng Tao <bergwolf@gmail.com>

From: Julia Lawall <Julia.Lawall@lip6.fr>

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier lbl;
identifier rc;
constant c;
@@

- GOTO(lbl,\(rc\|c\));
+ goto lbl;

@@
identifier lbl;
expression rc;
@@

- GOTO(lbl,rc);
+ rc;
+ goto lbl;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/lvfs/lvfs_linux.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/lustre/lustre/lvfs/lvfs_linux.c b/drivers/staging/lustre/lustre/lvfs/lvfs_linux.c
index eea0b2c..d9209b9 100644
--- a/drivers/staging/lustre/lustre/lvfs/lvfs_linux.c
+++ b/drivers/staging/lustre/lustre/lvfs/lvfs_linux.c
@@ -215,12 +215,16 @@ int lustre_rename(struct dentry *dir, struct vfsmount *mnt,
 	if (IS_ERR(dchild_old))
 		return PTR_ERR(dchild_old);
 
-	if (!dchild_old->d_inode)
-		GOTO(put_old, err = -ENOENT);
+	if (!dchild_old->d_inode) {
+		err = -ENOENT;
+		goto put_old;
+	}
 
 	dchild_new = ll_lookup_one_len(newname, dir, strlen(newname));
-	if (IS_ERR(dchild_new))
-		GOTO(put_old, err = PTR_ERR(dchild_new));
+	if (IS_ERR(dchild_new)) {
+		err = PTR_ERR(dchild_new);
+		goto put_old;
+	}
 
 	err = ll_vfs_rename(dir->d_inode, dchild_old, mnt,
 			    dir->d_inode, dchild_new, mnt);
