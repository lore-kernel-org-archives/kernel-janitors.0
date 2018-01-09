From: Colin King <colin.king@canonical.com>
Date: Tue, 09 Jan 2018 17:06:40 +0000
Subject: [PATCH][staging-next] ncpfs: remove redundant cast of struct ncp_inode_info
Message-Id: <20180109170640.16561-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.cz>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Casting a value returned by memory an allocation function is
not required and can be removed. Also add in a newline after before
the first statement. Code clean up as suggested by coccinelle.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/ncpfs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/ncpfs/inode.c b/drivers/staging/ncpfs/inode.c
index 41de88cdc053..bb411610a071 100644
--- a/drivers/staging/ncpfs/inode.c
+++ b/drivers/staging/ncpfs/inode.c
@@ -53,7 +53,8 @@ static struct kmem_cache * ncp_inode_cachep;
 static struct inode *ncp_alloc_inode(struct super_block *sb)
 {
 	struct ncp_inode_info *ei;
-	ei = (struct ncp_inode_info *)kmem_cache_alloc(ncp_inode_cachep, GFP_KERNEL);
+
+	ei = kmem_cache_alloc(ncp_inode_cachep, GFP_KERNEL);
 	if (!ei)
 		return NULL;
 	return &ei->vfs_inode;
-- 
2.15.1

