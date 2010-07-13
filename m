From: Wang Sheng-Hui <crosslonelyover@gmail.com>
Date: Tue, 13 Jul 2010 14:55:21 +0000
Subject: [PATCH] ext2: return -ENODATA for NULL i_file_acl in ext2_xattr_list
Message-Id: <4C3C7E59.8040905@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors <kernel-janitors@vger.kernel.org>, linux-ext4 <linux-ext4@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

 Hi,

In ext2_xattr_list, if (!EXT2_I(inode)->i_file_acl)
is true, we should return -ENODATA instead of 0.
Following patch is against 2.6.35-rc5. Please check
it.

Signed-off-by: Wang Sheng-Hui <crosslonelyover@gmail.com>
---
fs/ext2/xattr.c | 2 +-
1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ext2/xattr.c b/fs/ext2/xattr.c
index 7c39157..5ecbbd8 100644
--- a/fs/ext2/xattr.c
+++ b/fs/ext2/xattr.c
@@ -263,7 +263,7 @@ ext2_xattr_list(struct dentry *dentry, char *buffer,
size_t buffer_size)
buffer, (long)buffer_size);

down_read(&EXT2_I(inode)->xattr_sem);
- error = 0;
+ error = -ENODATA;
if (!EXT2_I(inode)->i_file_acl)
goto cleanup;
ea_idebug(inode, "reading block %d", EXT2_I(inode)->i_file_acl);
-- 
1.7.1.1



-- 
Thanks and Regards,
shenghui

