From: Colin King <colin.king@canonical.com>
Date: Tue, 11 Apr 2017 12:51:02 +0000
Subject: [PATCH] mm/migrate: check for null vma before dereferencing it
Message-Id: <20170411125102.19497-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Minchan Kim <minchan@kernel.org>, Mel Gorman <mgorman@techsingularity.net>, Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

check if vma is null before dereferencing it, this avoiding any
potential null pointer dereferences on vma via the is_vm_hugetlb_page
call or the direct vma->vm_flags reference.

Detected with CoverityScan, CID#1427995 ("Dereference before null check")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 mm/migrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 7958dfa01b16..039f7bc3b9ee 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2757,10 +2757,10 @@ int migrate_vma(const struct migrate_vma_ops *ops,
 	/* Sanity check the arguments */
 	start &= PAGE_MASK;
 	end &= PAGE_MASK;
-	if (is_vm_hugetlb_page(vma) || (vma->vm_flags & VM_SPECIAL))
-		return -EINVAL;
 	if (!vma || !ops || !src || !dst || start >= end)
 		return -EINVAL;
+	if (is_vm_hugetlb_page(vma) || (vma->vm_flags & VM_SPECIAL))
+		return -EINVAL;
 	if (start < vma->vm_start || start >= vma->vm_end)
 		return -EINVAL;
 	if (end <= vma->vm_start || end > vma->vm_end)
-- 
2.11.0

