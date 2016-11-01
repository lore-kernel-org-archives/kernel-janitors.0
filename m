From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 01 Nov 2016 06:45:25 +0000
Subject: [PATCH] UBIFS: Remove some dead code
Message-Id: <20161101064525.11813-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'ubifs_fast_find_freeable()' can not return an error pointer, so this test
can be removed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/ubifs/gc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index e845c64b6ce1..7b35e3d6cde7 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -846,10 +846,6 @@ int ubifs_gc_start_commit(struct ubifs_info *c)
 	 */
 	while (1) {
 		lp = ubifs_fast_find_freeable(c);
-		if (IS_ERR(lp)) {
-			err = PTR_ERR(lp);
-			goto out;
-		}
 		if (!lp)
 			break;
 		ubifs_assert(!(lp->flags & LPROPS_TAKEN));
-- 
2.9.3

