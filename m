From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Nov 2013 07:49:40 +0000
Subject: [patch] aio: checking for NULL instead of IS_ERR
Message-Id: <20131113074940.GG25541@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

alloc_anon_inode() returns an ERR_PTR(), it doesn't return NULL.

Fixes: 71ad7490c1f3 ('rework aio migrate pages to use aio fs')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/aio.c b/fs/aio.c
index bf8d080..699f53e 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -164,8 +164,8 @@ static struct file *aio_private_file(struct kioctx *ctx, loff_t nr_pages)
 	struct file *file;
 	struct path path;
 	struct inode *inode = alloc_anon_inode(aio_mnt->mnt_sb);
-	if (!inode)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(inode))
+		return ERR_CAST(inode);
 
 	inode->i_mapping->a_ops = &aio_ctx_aops;
 	inode->i_mapping->private_data = ctx;
