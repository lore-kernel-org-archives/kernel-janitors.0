From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jan 2020 05:09:02 +0000
Subject: [PATCH] zswap: potential NULL dereference on error in init_zswap()
Message-Id: <20200114050902.og32fkllkod5ycf5@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Seth Jennings <sjenning@redhat.com>, Vitaly Wool <vitaly.wool@konsulko.com>
Cc: Dan Streetman <ddstreet@ieee.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

The "pool" pointer can be NULL at the end of the init_zswap().  (We
would allocate a new pool later in that situation.)  So in the error
handling then we need to make sure pool is a valid pointer before
calling "zswap_pool_destroy(pool);" because that function dereferences
the argument.

Fixes: 93d4dfa9fbd0 ("mm/zswap.c: add allocation hysteresis if pool limit is hit")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 mm/zswap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 7ec8bd912d13..55094e63b72d 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1359,7 +1359,8 @@ static int __init init_zswap(void)
 	return 0;
 
 fallback_fail:
-	zswap_pool_destroy(pool);
+	if (pool)
+		zswap_pool_destroy(pool);
 hp_fail:
 	cpuhp_remove_state(CPUHP_MM_ZSWP_MEM_PREPARE);
 dstmem_fail:
-- 
2.11.0
