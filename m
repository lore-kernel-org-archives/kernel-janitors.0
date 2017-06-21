From: Colin King <colin.king@canonical.com>
Date: Wed, 21 Jun 2017 10:14:33 +0000
Subject: [PATCH][mm-next] mm: clean up build warning with unused variable ret2
Message-Id: <20170621101433.9847-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, Mel Gorman <mgorman@techsingularity.net>, Jan Kara <jack@suse.cz>, Michal Hocko <mhocko@suse.com>, Jeff Layton <jlayton@redhat.com>, Dave Chinner <dchinner@redhat.com>, Matthew Wilcox <mawilcox@microsoft.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable ret2 is unused and should be removed. Cleans up
build warning:

warning: unused variable 'ret2' [-Wunused-variable]

Fixes: 4118ba44fa2cd040e ("mm: clean up error handling in write_one_page")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 mm/page-writeback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 64b75bd996a4..0b60cc7ddac2 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2377,7 +2377,7 @@ int do_writepages(struct address_space *mapping, struct writeback_control *wbc)
 int write_one_page(struct page *page)
 {
 	struct address_space *mapping = page->mapping;
-	int ret = 0, ret2;
+	int ret = 0;
 	struct writeback_control wbc = {
 		.sync_mode = WB_SYNC_ALL,
 		.nr_to_write = 1,
-- 
2.11.0

