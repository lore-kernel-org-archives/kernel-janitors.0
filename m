From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 21 Sep 2015 16:23:14 +0000
Subject: [patch] mm/huge_memory: add a missing tab
Message-Id: <20150921162314.GB5648@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Ebru Akagunduz <ebru.akagunduz@gmail.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@suse.de>, Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@linux.intel.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

This line should be indented one more tab.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 4b057ab..61d2162 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2887,7 +2887,7 @@ static int khugepaged_scan_pmd(struct mm_struct *mm,
 		khugepaged_node_load[node]++;
 		VM_BUG_ON_PAGE(PageCompound(page), page);
 		if (!PageLRU(page)) {
-		result = SCAN_SCAN_ABORT;
+			result = SCAN_SCAN_ABORT;
 			goto out_unmap;
 		}
 		if (PageLocked(page)) {
