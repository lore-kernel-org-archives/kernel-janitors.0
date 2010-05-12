From: =?UTF-8?B?Iua9mOWNq+W5syhQZXRlciBQYW4pIg==?=
Date: Wed, 12 May 2010 03:07:38 +0000
Subject: [PATCH] ext2:delete two redundant assignments
Message-Id: <4BEA1B7A.7020109@redflag-linux.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

es->s_free_blocks_count and es->s_free_inodes_count are assigned in
ext2_sync_super().

Signed-off-by: Peter Pan <wppan@redflag-linux.com>
---
  fs/ext2/super.c |    4 ----
  1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/fs/ext2/super.c b/fs/ext2/super.c
index 42e4a30..1cf58aa 100644
--- a/fs/ext2/super.c
+++ b/fs/ext2/super.c
@@ -1182,10 +1182,6 @@ static int ext2_sync_fs(struct super_block *sb, 
int wait)
  	if (es->s_state & cpu_to_le16(EXT2_VALID_FS)) {
  		ext2_debug("setting valid to 0\n");
  		es->s_state &= cpu_to_le16(~EXT2_VALID_FS);
-		es->s_free_blocks_count -			cpu_to_le32(ext2_count_free_blocks(sb));
-		es->s_free_inodes_count -			cpu_to_le32(ext2_count_free_inodes(sb));
  		es->s_mtime = cpu_to_le32(get_seconds());
  		ext2_sync_super(sb, es);
  	} else {
-- 
1.6.6


