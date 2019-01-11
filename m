From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Jan 2019 09:59:19 +0000
Subject: [PATCH] mm, swap: Potential NULL dereference in get_swap_page_of_type()
Message-Id: <20190111095919.GA1757@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Shaohua Li <shli@kernel.org>
Cc: Huang Ying <ying.huang@intel.com>, Daniel Jordan <daniel.m.jordan@oracle.com>, Dave Hansen <dave.hansen@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Omar Sandoval <osandov@fb.com>, Tejun Heo <tj@kernel.org>, Andi Kleen <ak@linux.intel.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

Smatch complains that the NULL checks on "si" aren't consistent.  This
seems like a real bug because we have not ensured that the type is
valid and so "si" can be NULL.

Fixes: ec8acf20afb8 ("swap: add per-partition lock for swapfile")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 mm/swapfile.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index f0edf7244256..21e92c757205 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1048,9 +1048,12 @@ swp_entry_t get_swap_page_of_type(int type)
 	struct swap_info_struct *si;
 	pgoff_t offset;
 
+	if (type >= nr_swapfiles)
+		goto fail;
+
 	si = swap_info[type];
 	spin_lock(&si->lock);
-	if (si && (si->flags & SWP_WRITEOK)) {
+	if (si->flags & SWP_WRITEOK) {
 		atomic_long_dec(&nr_swap_pages);
 		/* This is called for allocating swap entry, not cache */
 		offset = scan_swap_map(si, 1);
@@ -1061,6 +1064,7 @@ swp_entry_t get_swap_page_of_type(int type)
 		atomic_long_inc(&nr_swap_pages);
 	}
 	spin_unlock(&si->lock);
+fail:
 	return (swp_entry_t) {0};
 }
 
-- 
2.17.1
