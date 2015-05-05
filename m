From: Adir Kuhn <adirkuhn@gmail.com>
Date: Tue, 05 May 2015 00:43:15 +0000
Subject: [PATCH 1/5] fs: ext4: balloc: removed trailing whitespace
Message-Id: <1430786599-3843-2-git-send-email-adirkuhn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed trailing whitespace

Signed-off-by: Adir Kuhn <adirkuhn@gmail.com>
---
 fs/ext4/balloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/balloc.c b/fs/ext4/balloc.c
index 68a3019..31a4152 100644
--- a/fs/ext4/balloc.c
+++ b/fs/ext4/balloc.c
@@ -252,7 +252,7 @@ unsigned ext4_free_clusters_after_init(struct super_block *sb,
 				       ext4_group_t block_group,
 				       struct ext4_group_desc *gdp)
 {
-	return num_clusters_in_group(sb, block_group) -
+	return num_clusters_in_group(sb, block_group) -
 		ext4_num_overhead_clusters(sb, block_group, gdp);
 }

--
2.1.4

