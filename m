From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Fri, 04 Dec 2009 20:24:22 +0000
Subject: [PATCH] Fix misspelling of "journaled".
Message-Id: <1259958262-24386-1-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"Journaled" is misspelled "journlaled" in an output string; this patch
fixed it. No changes in functionality.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 fs/reiserfs/fix_node.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/reiserfs/fix_node.c b/fs/reiserfs/fix_node.c
index 5e5a4e6..db3fd7d 100644
--- a/fs/reiserfs/fix_node.c
+++ b/fs/reiserfs/fix_node.c
@@ -834,7 +834,7 @@ static int get_empty_nodes(struct tree_balance *tb, int h)
 		RFALSE(buffer_dirty(new_bh) ||
 		       buffer_journaled(new_bh) ||
 		       buffer_journal_dirty(new_bh),
-		       "PAP-8140: journlaled or dirty buffer %b for the new block",
+		       "PAP-8140: journaled or dirty buffer %b for the new block",
 		       new_bh);
 
 		/* Put empty buffers into the array. */
-- 
1.6.3.3

