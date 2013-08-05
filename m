From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 05 Aug 2013 14:47:36 +0000
Subject: [PATCH] fs/nfs/inode.c: adjust code alignment
Message-Id: <1375714059-29567-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375714059-29567-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1375714059-29567-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: kernel-janitors@vger.kernel.org, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

This patch adjusts the code so that the alignment matches the current
semantics.  I have no idea if it is the intended semantics, though.  Should
the call to nfs_setsecurity also be under the else?

 fs/nfs/inode.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index af6e806..d8ad685 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -463,7 +463,7 @@ nfs_fhget(struct super_block *sb, struct nfs_fh *fh, struct nfs_fattr *fattr, st
 		unlock_new_inode(inode);
 	} else
 		nfs_refresh_inode(inode, fattr);
-		nfs_setsecurity(inode, fattr, label);
+	nfs_setsecurity(inode, fattr, label);
 	dprintk("NFS: nfs_fhget(%s/%Ld fh_crc=0x%08x ct=%d)\n",
 		inode->i_sb->s_id,
 		(long long)NFS_FILEID(inode),

