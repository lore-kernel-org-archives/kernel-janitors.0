From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 17:20:51 +0000
Subject: [KJ] [Patch 8/8] BUG_ON() Conversion in fs/inode.c
Message-Id: <1138296051.9170.27.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51536753389057033=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51536753389057033==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/inode.c.orig	2006-01-26 17:57:32.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/inode.c	2006-01-26 17:59:17.000000000 +0100
@@ -172,8 +172,7 @@ static struct inode *alloc_inode(struct 
 
 void destroy_inode(struct inode *inode) 
 {
-	if (inode_has_buffers(inode))
-		BUG();
+	BUG_ON(inode_has_buffers(inode));
 	security_inode_free(inode);
 	if (inode->i_sb->s_op->destroy_inode)
 		inode->i_sb->s_op->destroy_inode(inode);
@@ -249,12 +248,9 @@ void clear_inode(struct inode *inode)
 	might_sleep();
 	invalidate_inode_buffers(inode);
        
-	if (inode->i_data.nrpages)
-		BUG();
-	if (!(inode->i_state & I_FREEING))
-		BUG();
-	if (inode->i_state & I_CLEAR)
-		BUG();
+	BUG_ON(inode->i_data.nrpages);
+	BUG_ON(!(inode->i_state & I_FREEING));
+	BUG_ON(inode->i_state & I_CLEAR);
 	wait_on_inode(inode);
 	DQUOT_DROP(inode);
 	if (inode->i_sb && inode->i_sb->s_op->clear_inode)
@@ -1054,8 +1050,7 @@ void generic_delete_inode(struct inode *
 	hlist_del_init(&inode->i_hash);
 	spin_unlock(&inode_lock);
 	wake_up_inode(inode);
-	if (inode->i_state != I_CLEAR)
-		BUG();
+	BUG_ON(inode->i_state != I_CLEAR);
 	destroy_inode(inode);
 }
 



--===============51536753389057033==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51536753389057033==--
