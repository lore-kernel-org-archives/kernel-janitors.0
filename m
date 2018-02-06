From: Colin King <colin.king@canonical.com>
Date: Tue, 06 Feb 2018 22:10:05 +0000
Subject: [PATCH] mm/ksm: make function stable_node_dup static
Message-Id: <20180206221005.12642-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function stable_node_dup is local to the source and does not need
to be in global scope, so make it static.

Cleans up sparse warning:
mm/ksm.c:1321:13: warning: symbol 'stable_node_dup' was not
declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 mm/ksm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 293721f5da70..30ebdbfaf373 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1318,10 +1318,10 @@ bool is_page_sharing_candidate(struct stable_node *stable_node)
 	return __is_page_sharing_candidate(stable_node, 0);
 }
 
-struct page *stable_node_dup(struct stable_node **_stable_node_dup,
-			     struct stable_node **_stable_node,
-			     struct rb_root *root,
-			     bool prune_stale_stable_nodes)
+static struct page *stable_node_dup(struct stable_node **_stable_node_dup,
+				    struct stable_node **_stable_node,
+				    struct rb_root *root,
+				    bool prune_stale_stable_nodes)
 {
 	struct stable_node *dup, *found = NULL, *stable_node = *_stable_node;
 	struct hlist_node *hlist_safe;
-- 
2.15.1

