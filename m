From: Wang Sheng-Hui <crosslonelyover@gmail.com>
Date: Tue, 13 Jul 2010 15:03:31 +0000
Subject: [PATCH]trivial: clear the comment on parameters for ext2_xattr_set
Message-Id: <4C3C8043.3030700@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors <kernel-janitors@vger.kernel.org>, linux-ext4 <linux-ext4@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

 Hi,

The comment for ext2_xattr_get is confusing for it has
no parameter named "buffer". I checked the code and think the
description is suitable for the parameter "value".
Following patch is against 2.6.35-rc5. Please check it.


Signed-off-by: Wang Sheng-Hui <crosslonelyover@gmail.com>
---
fs/ext2/xattr.c | 2 +-
1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ext2/xattr.c b/fs/ext2/xattr.c
index 5ecbbd8..f56b599 100644
--- a/fs/ext2/xattr.c
+++ b/fs/ext2/xattr.c
@@ -355,7 +355,7 @@ static void ext2_xattr_update_super_block(struct
super_block *sb)
/*
* ext2_xattr_set()
*
- * Create, replace or remove an extended attribute for this inode. Buffer
+ * Create, replace or remove an extended attribute for this inode. Value
* is NULL to remove an existing extended attribute, and non-NULL to
* either replace an existing extended attribute, or create a new extended
* attribute. The flags XATTR_REPLACE and XATTR_CREATE
-- 
1.7.1.1


-- 
Thanks and Regards,
shenghui

