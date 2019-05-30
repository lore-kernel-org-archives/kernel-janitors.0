From: Colin King <colin.king@canonical.com>
Date: Thu, 30 May 2019 16:33:36 +0000
Subject: [PATCH][next] z3fold: remove redundant assignment to bud
Message-Id: <20190530163336.5148-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Vitaly Wool <vitalywool@gmail.com>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable bud is initialized with the value 'LAST' which is never
read and bud is reassigned later on the return from the call to the
function handle_to_buddy. This initialization is redundant and
can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 mm/z3fold.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/z3fold.c b/mm/z3fold.c
index 2bc3dbde6255..0a62bc293de4 100644
--- a/mm/z3fold.c
+++ b/mm/z3fold.c
@@ -1176,7 +1176,7 @@ static void z3fold_free(struct z3fold_pool *pool, unsigned long handle)
 {
 	struct z3fold_header *zhdr;
 	struct page *page;
-	enum buddy bud = LAST; /* initialize to !HEADLESS */
+	enum buddy bud;
 
 	zhdr = get_z3fold_header(handle);
 
-- 
2.20.1
