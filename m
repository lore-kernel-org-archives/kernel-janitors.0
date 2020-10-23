From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Oct 2020 11:26:33 +0000
Subject: [PATCH] btrfs: clean up NULL checks in qgroup_unreserve_range()
Message-Id: <20201023112633.GE282278@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Qu Wenruo <wqu@suse.com>
Cc: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that this code dereferences "entry" before checking
whether it's NULL on the next line.  Fortunately, rb_entry() will never
return NULL so it doesn't cause a problem.  We can clean up the NULL
checking a bit to silence the warning and make the code more clear.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
My patch does not change run-time, but it's possible that the original
code was buggy and I missed it.

 fs/btrfs/qgroup.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/btrfs/qgroup.c b/fs/btrfs/qgroup.c
index 580899bdb991..a7ae2f18f486 100644
--- a/fs/btrfs/qgroup.c
+++ b/fs/btrfs/qgroup.c
@@ -3417,24 +3417,20 @@ static int qgroup_unreserve_range(struct btrfs_inode *inode,
 {
 	struct rb_node *node;
 	struct rb_node *next;
-	struct ulist_node *entry = NULL;
+	struct ulist_node *entry;
 	int ret = 0;
 
 	node = reserved->range_changed.root.rb_node;
+	if (!node)
+		return 0;
 	while (node) {
 		entry = rb_entry(node, struct ulist_node, rb_node);
 		if (entry->val < start)
 			node = node->rb_right;
-		else if (entry)
-			node = node->rb_left;
 		else
-			break;
+			node = node->rb_left;
 	}
 
-	/* Empty changeset */
-	if (!entry)
-		return 0;
-
 	if (entry->val > start && rb_prev(&entry->rb_node))
 		entry = rb_entry(rb_prev(&entry->rb_node), struct ulist_node,
 				 rb_node);
-- 
2.28.0
