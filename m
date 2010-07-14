From: shenghui <crosslonelyover@gmail.com>
Date: Wed, 14 Jul 2010 00:51:12 +0000
Subject: [PATCH]trivial: clear the comment on parameters for ext2_xattr_set
Message-Id: <4C3D0A00.4000900@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4C3C8043.3030700@gmail.com>
In-Reply-To: <4C3C8043.3030700@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, error27@gmail.com

Sorry. I changed to another mail client.
Please recheck the patch.


Signed-off-by: Wang Sheng-Hui <crosslonelyover@gmail.com>
---
 fs/ext2/xattr.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ext2/xattr.c b/fs/ext2/xattr.c
index 7c39157..194269e 100644
--- a/fs/ext2/xattr.c
+++ b/fs/ext2/xattr.c
@@ -355,7 +355,7 @@ static void ext2_xattr_update_super_block(struct super_block *sb)
 /*
  * ext2_xattr_set()
  *
- * Create, replace or remove an extended attribute for this inode. Buffer
+ * Create, replace or remove an extended attribute for this inode. Value
  * is NULL to remove an existing extended attribute, and non-NULL to
  * either replace an existing extended attribute, or create a new extended
  * attribute. The flags XATTR_REPLACE and XATTR_CREATE
-- 
1.6.3.3

