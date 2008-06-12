From: Vegard Nossum <vegard.nossum@gmail.com>
Date: Thu, 12 Jun 2008 21:24:08 +0000
Subject: [PATCH] mm: remove initialization of static per-cpu variables
Message-Id: <20080612212408.GG3283@damson.getinternet.no>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Vegard Nossum <vegard.nossum@gmail.com>
Date: Thu, 12 Jun 2008 22:21:29 +0200
Subject: [PATCH] mm: remove initialization of static per-cpu variables

Signed-off-by: Vegard Nossum <vegard.nossum@gmail.com>
---
 mm/swap.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/swap.c b/mm/swap.c
index 45c9f25..dd89234 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -34,9 +34,9 @@
 /* How many pages do we try to swap or page in/out together? */
 int page_cluster;
 
-static DEFINE_PER_CPU(struct pagevec, lru_add_pvecs) = { 0, };
-static DEFINE_PER_CPU(struct pagevec, lru_add_active_pvecs) = { 0, };
-static DEFINE_PER_CPU(struct pagevec, lru_rotate_pvecs) = { 0, };
+static DEFINE_PER_CPU(struct pagevec, lru_add_pvecs);
+static DEFINE_PER_CPU(struct pagevec, lru_add_active_pvecs);
+static DEFINE_PER_CPU(struct pagevec, lru_rotate_pvecs);
 
 /*
  * This path almost never happens for VM activity - pages are normally
@@ -493,7 +493,7 @@ EXPORT_SYMBOL(pagevec_lookup_tag);
  */
 #define ACCT_THRESHOLD	max(16, NR_CPUS * 2)
 
-static DEFINE_PER_CPU(long, committed_space) = 0;
+static DEFINE_PER_CPU(long, committed_space);
 
 void vm_acct_memory(long pages)
 {
-- 
1.5.4.1

