From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 18:09:08 +0000
Subject: [PATCH] mm/page_poison: fix a typo in a comment
Message-Id: <20190721180908.6534-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, mhocko@suse.com, rppt@linux.vnet.ibm.com, aryabinin@virtuozzo.com, wei.w.wang@intel.com, cai@lca.pw
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

s/posioned/poisoned/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 mm/page_poison.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_poison.c b/mm/page_poison.c
index 21d4f97cb49b..34b9181ee5d1 100644
--- a/mm/page_poison.c
+++ b/mm/page_poison.c
@@ -101,7 +101,7 @@ static void unpoison_page(struct page *page)
 	/*
 	 * Page poisoning when enabled poisons each and every page
 	 * that is freed to buddy. Thus no extra check is done to
-	 * see if a page was posioned.
+	 * see if a page was poisoned.
 	 */
 	check_poison_mem(addr, PAGE_SIZE);
 	kunmap_atomic(addr);
-- 
2.20.1
