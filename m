From: Julia Lawall <julia@diku.dk>
Date: Tue, 02 Aug 2011 10:35:04 +0000
Subject: [PATCH 11/11] arch/tile/mm/init.c: trivial: use BUG_ON
Message-Id: <1312281304-11847-12-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312281304-11847-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Metcalf <cmetcalf@tilera.com>, trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use BUG_ON(x) rather than if(x) BUG();

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ identifier x; @@
-if (x) BUG();
+BUG_ON(x);

@@ identifier x; @@
-if (!x) BUG();
+BUG_ON(!x);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/tile/mm/init.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/arch/tile/mm/init.c b/arch/tile/mm/init.c
--- a/arch/tile/mm/init.c
+++ b/arch/tile/mm/init.c
@@ -836,8 +836,7 @@ void __init mem_init(void)
 #endif
 
 #ifdef CONFIG_FLATMEM
-	if (!mem_map)
-		BUG();
+	BUG_ON(!mem_map);
 #endif
 
 #ifdef CONFIG_HIGHMEM

