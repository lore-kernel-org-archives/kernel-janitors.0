From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 01 Apr 2012 15:57:59 +0000
Subject: [patch] UBIFS: remove douple initialization in change_category()
Message-Id: <20120401155759.GA21238@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>

"heap" is initialized twice.  I removed the first one, because it makes
Smatch complain that we use "new_cat" as an offset before checking it.

This doesn't change how the code works, it's just a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index f8a181e..b5c95a6 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -447,7 +447,7 @@ static void change_category(struct ubifs_info *c, struct ubifs_lprops *lprops)
 	int new_cat = ubifs_categorize_lprops(c, lprops);
 
 	if (old_cat = new_cat) {
-		struct ubifs_lpt_heap *heap = &c->lpt_heap[new_cat - 1];
+		struct ubifs_lpt_heap *heap;
 
 		/* lprops on a heap now must be moved up or down */
 		if (new_cat < 1 || new_cat > LPROPS_HEAP_CNT)
