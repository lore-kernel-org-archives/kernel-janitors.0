From: Dan Carpenter <error27@gmail.com>
Date: Wed, 25 Aug 2010 07:05:27 +0000
Subject: [patch] affs: testing the wrong variable
Message-Id: <20100825070350.GN29330@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roman Zippel <zippel@linux-m68k.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The intent was to verify that bh = affs_bread_ino(...) returned a valid
pointer.  We checked "ext_bh" earlier in the function and it's valid
here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/affs/file.c b/fs/affs/file.c
index c4a9875..0a90dcd 100644
--- a/fs/affs/file.c
+++ b/fs/affs/file.c
@@ -894,9 +894,9 @@ affs_truncate(struct inode *inode)
 		if (AFFS_SB(sb)->s_flags & SF_OFS) {
 			struct buffer_head *bh = affs_bread_ino(inode, last_blk, 0);
 			u32 tmp;
-			if (IS_ERR(ext_bh)) {
+			if (IS_ERR(bh)) {
 				affs_warning(sb, "truncate", "unexpected read error for last block %u (%d)",
-					     ext, PTR_ERR(ext_bh));
+					     ext, PTR_ERR(bh));
 				return;
 			}
 			tmp = be32_to_cpu(AFFS_DATA_HEAD(bh)->next);
