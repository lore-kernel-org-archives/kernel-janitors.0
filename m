From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 21 Jan 2017 04:48:19 +0000
Subject: [patch] fs/affs: affs_bread() doesn't return ERR_PTRs
Message-Id: <20170121044819.GA15269@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Fabian Frederick <fabf@skynet.be>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Boaz Harrosh <ooo@electrozaur.com>, Miklos Szeredi <mszeredi@redhat.com>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

We're checking IS_ERR() here, but we should be checking for NULL.

Fixes: e393e82a7d09 ("fs/affs: make export work with cold dcache")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/affs/namei.c b/fs/affs/namei.c
index a3df8a6..706dd06 100644
--- a/fs/affs/namei.c
+++ b/fs/affs/namei.c
@@ -453,8 +453,8 @@ static struct dentry *affs_get_parent(struct dentry *child)
 	struct buffer_head *bh;
 
 	bh = affs_bread(child->d_sb, d_inode(child)->i_ino);
-	if (IS_ERR(bh))
-		return ERR_CAST(bh);
+	if (bh)
+		return ERR_PTR(-EIO);
 
 	parent = affs_iget(child->d_sb,
 			   be32_to_cpu(AFFS_TAIL(child->d_sb, bh)->parent));
