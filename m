From: Adir Kuhn <adirkuhn@gmail.com>
Date: Tue, 05 May 2015 00:43:17 +0000
Subject: [PATCH 3/5] fs: ext4: balloc: Added required space after comma
Message-Id: <1430786599-3843-4-git-send-email-adirkuhn@gmail.com>
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
index 7eb2b3d..023457e 100644
--- a/fs/ext4/balloc.c
+++ b/fs/ext4/balloc.c
@@ -777,7 +777,7 @@ static unsigned long ext4_bg_num_gdb_nometa(struct super_block *sb,
 	if (!ext4_bg_has_super(sb, group))
 		return 0;

-	if (EXT4_HAS_INCOMPAT_FEATURE(sb,EXT4_FEATURE_INCOMPAT_META_BG))
+	if (EXT4_HAS_INCOMPAT_FEATURE(sb, EXT4_FEATURE_INCOMPAT_META_BG))
 		return le32_to_cpu(EXT4_SB(sb)->s_es->s_first_meta_bg);
 	else
 		return EXT4_SB(sb)->s_gdb_count;
--
2.1.4

