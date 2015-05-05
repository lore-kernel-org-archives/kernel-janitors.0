From: Adir Kuhn <adirkuhn@gmail.com>
Date: Tue, 05 May 2015 00:43:18 +0000
Subject: [PATCH 4/5] fs: ext4: balloc: Added required space after comma
Message-Id: <1430786599-3843-5-git-send-email-adirkuhn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Added required space after comma

Signed-off-by: Adir Kuhn <adirkuhn@gmail.com>
---
 fs/ext4/balloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/balloc.c b/fs/ext4/balloc.c
index 023457e..d45d43b 100644
--- a/fs/ext4/balloc.c
+++ b/fs/ext4/balloc.c
@@ -798,7 +798,7 @@ unsigned long ext4_bg_num_gdb(struct super_block *sb, ext4_group_t group)
 			le32_to_cpu(EXT4_SB(sb)->s_es->s_first_meta_bg);
 	unsigned long metagroup = group / EXT4_DESC_PER_BLOCK(sb);

-	if (!EXT4_HAS_INCOMPAT_FEATURE(sb,EXT4_FEATURE_INCOMPAT_META_BG) ||
+	if (!EXT4_HAS_INCOMPAT_FEATURE(sb, EXT4_FEATURE_INCOMPAT_META_BG) ||
 			metagroup < first_meta_bg)
 		return ext4_bg_num_gdb_nometa(sb, group);

--
2.1.4

