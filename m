From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 04 Oct 2020 12:58:27 +0000
Subject: [PATCH] mm/vmscan: drop unneeded assignment in kswapd()
Message-Id: <20201004125827.17679-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mel Gorman <mgorman@techsingularity.net>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@suse.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, Lukas Bulwahn <lukas.bulwahn@gmail.com>

The refactoring to kswapd() in commit e716f2eb24de ("mm, vmscan: prevent
kswapd sleeping prematurely due to mismatched classzone_idx") turned an
assignment to reclaim_order into a dead store, as in all further paths,
reclaim_order will be assigned again before it is used.

make clang-analyzer on x86_64 tinyconfig caught my attention with:

  mm/vmscan.c: warning: Although the value stored to 'reclaim_order' is
  used in the enclosing expression, the value is never actually read from
  'reclaim_order' [clang-analyzer-deadcode.DeadStores]

Compilers will detect this unneeded assignment and optimize this anyway.
So, the resulting binary is identical before and after this change.

Simplify the code and remove unneeded assignment to make clang-analyzer
happy.

No functional change. No change in binary code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201002

Mel, please ack.
Andrew, please pick this minor non-urgent clean-up patch.

I quickly confirmed that the binary did not change with this change to the
source code; The hash of mm/vmscan.o remained the same before and after
the change.

So, in my setup:
md5sum mm/vmscan.o
7da4675477f186263e36b726cc2b859d  mm/vmscan.o

linux-safety, please verify and validate this change.

 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 466fc3144fff..130ee40c1255 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3896,7 +3896,7 @@ static int kswapd(void *p)
 					highest_zoneidx);
 
 		/* Read the new order and highest_zoneidx */
-		alloc_order = reclaim_order = READ_ONCE(pgdat->kswapd_order);
+		alloc_order = READ_ONCE(pgdat->kswapd_order);
 		highest_zoneidx = kswapd_highest_zoneidx(pgdat,
 							highest_zoneidx);
 		WRITE_ONCE(pgdat->kswapd_order, 0);
-- 
2.17.1
