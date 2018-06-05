From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jun 2018 08:16:16 +0000
Subject: [PATCH] mm, memory_failure: remove a stray tab
Message-Id: <20180605081616.o2q4wdbvolggefck@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org, kernel-janitors@vger.kernel.org

The return statement is indented too far.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index de0bc897d6e7..72cde4b0939e 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1147,7 +1147,7 @@ static unsigned long dax_mapping_size(struct address_space *mapping,
 	if (page->mapping != mapping) {
 		xa_unlock_irq(&mapping->i_pages);
 		i_mmap_unlock_read(mapping);
-			return 0;
+		return 0;
 	}
 	vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff) {
 		unsigned long address = vma_address(page, vma);
