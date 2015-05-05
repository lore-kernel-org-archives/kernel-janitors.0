From: Adir Kuhn <adirkuhn@gmail.com>
Date: Tue, 05 May 2015 00:43:19 +0000
Subject: [PATCH 5/5] fs: ext4: balloc: Added required space after comma
Message-Id: <1430786599-3843-6-git-send-email-adirkuhn@gmail.com>
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
index d45d43b..1d07c02 100644
--- a/fs/ext4/balloc.c
+++ b/fs/ext4/balloc.c
@@ -802,7 +802,7 @@ unsigned long ext4_bg_num_gdb(struct super_block *sb, ext4_group_t group)
 			metagroup < first_meta_bg)
 		return ext4_bg_num_gdb_nometa(sb, group);

-	return ext4_bg_num_gdb_meta(sb,group);
+	return ext4_bg_num_gdb_meta(sb, group);

 }

--
2.1.4

