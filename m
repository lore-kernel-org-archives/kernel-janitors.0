From: "crosslonelyover" <crosslonelyover@gmail.com>
Date: Mon, 12 Jul 2010 15:09:09 +0000
Subject: [PATCH] remove unnecesary while loop in ext2_xattr_get
Message-Id: <201007122309063128435@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ext4 <linux-ext4@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

Hi,
     In ext2_xattr_get, we'll check the xattr entry one 
by one in the following loop:
         entry = FIRST_ENTRY(bh);
         while (!IS_LAST_ENTRY(entry)) {
                 struct ext2_xattr_entry *next                          EXT2_XATTR_NEXT(entry);
                 if ((char *)next >= end)
                         goto bad_block;
                 if (name_index = entry->e_name_index &&
                     name_len = entry->e_name_len &&
                     memcmp(name, entry->e_name, name_len) = 0)
                         goto found;
                 entry = next;
         }
We can only execute the code immediately following 
the loop when !IS_LAST_ENTRY(entry) is true. So the
followed while loop seems unnecessary. I think we can
remove it.
      Following is my patch. It's against 2.6.35-rc4.
Please check it.


Signed-off-by: Wang Sheng-Hui <crosslonelyover@gmail.com>
---
 fs/ext2/xattr.c |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/fs/ext2/xattr.c b/fs/ext2/xattr.c
index 0b94d61..a6bccdb 100644
--- a/fs/ext2/xattr.c
+++ b/fs/ext2/xattr.c
@@ -201,14 +201,7 @@ bad_block:	ext2_error(inode->i_sb, "ext2_xattr_get",
 			goto found;
 		entry = next;
 	}
-	/* Check the remaining name entries */
-	while (!IS_LAST_ENTRY(entry)) {
-		struct ext2_xattr_entry *next -			EXT2_XATTR_NEXT(entry);
-		if ((char *)next >= end)
-			goto bad_block;
-		entry = next;
-	}
+
 	if (ext2_xattr_cache_insert(bh))
 		ea_idebug(inode, "cache insert failed");
 	error = -ENODATA;
-- 
1.7.1.1


