From: Colin King <colin.king@canonical.com>
Date: Thu, 07 Nov 2019 15:58:01 +0000
Subject: [PATCH] squashfs: generate uuid for the superblock rather than leaving it zero
Message-Id: <20191107155801.345452-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The squashfs superblock uuid is currently all zero and it can be useful
to have this set. Generate the uuid based on some of squashfs superblock
data to produce a reasonable uuid pattern.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/squashfs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
index 0cc4ceec0562..ac9d17e05fac 100644
--- a/fs/squashfs/super.c
+++ b/fs/squashfs/super.c
@@ -193,6 +193,12 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	err = -ENOMEM;
 
+	memcpy(&sb->s_uuid.b[0], &sblk->inodes, 4);
+	memcpy(&sb->s_uuid.b[4], &sblk->mkfs_time, 4);
+	memcpy(&sb->s_uuid.b[8], &sblk->fragments, 4);
+	memcpy(&sb->s_uuid.b[12], &sblk->compression, 2);
+	memcpy(&sb->s_uuid.b[14], &sblk->block_log, 2);
+
 	msblk->block_cache = squashfs_cache_init("metadata",
 			SQUASHFS_CACHED_BLKS, SQUASHFS_METADATA_SIZE);
 	if (msblk->block_cache = NULL)
-- 
2.20.1
