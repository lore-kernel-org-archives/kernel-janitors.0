From: Colin King <colin.king@canonical.com>
Date: Mon, 22 Jun 2020 15:35:46 +0000
Subject: [PATCH][next] mm/zswap: fix a couple of memory leaks and rework kzalloc failure check
Message-Id: <20200622153546.49880-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Seth Jennings <sjenning@redhat.com>, Dan Streetman <ddstreet@ieee.org>, Vitaly Wool <vitaly.wool@konsulko.com>, Andrew Morton <akpm@linux-foundation.org>, Barry Song <song.bao.hua@hisilicon.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

kzalloc failures return NULL on out of memory errors, so replace the
IS_ERR_OR_NULL check with the usual null pointer check.  Fix two memory
leaks with on acomp and acomp_ctx by ensuring these objects are free'd
on the error return path.

Addresses-Coverity: ("Resource leak")
Fixes: d4f86abd6e35 ("mm/zswap: move to use crypto_acomp API for hardware acceleration")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 mm/zswap.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 0d914ba6b4a0..14839cbac7ff 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -433,23 +433,23 @@ static int zswap_cpu_comp_prepare(unsigned int cpu, struct hlist_node *node)
 		return 0;
 
 	acomp_ctx = kzalloc(sizeof(*acomp_ctx), GFP_KERNEL);
-	if (IS_ERR_OR_NULL(acomp_ctx)) {
+	if (!acomp_ctx) {
 		pr_err("Could not initialize acomp_ctx\n");
 		return -ENOMEM;
 	}
 	acomp = crypto_alloc_acomp(pool->tfm_name, 0, 0);
-	if (IS_ERR_OR_NULL(acomp)) {
+	if (!acomp) {
 		pr_err("could not alloc crypto acomp %s : %ld\n",
 				pool->tfm_name, PTR_ERR(acomp));
-		return -ENOMEM;
+		goto free_acomp_ctx;
 	}
 	acomp_ctx->acomp = acomp;
 
 	req = acomp_request_alloc(acomp_ctx->acomp);
-	if (IS_ERR_OR_NULL(req)) {
+	if (!req) {
 		pr_err("could not alloc crypto acomp %s : %ld\n",
 		       pool->tfm_name, PTR_ERR(acomp));
-		return -ENOMEM;
+		goto free_acomp;
 	}
 	acomp_ctx->req = req;
 
@@ -462,6 +462,12 @@ static int zswap_cpu_comp_prepare(unsigned int cpu, struct hlist_node *node)
 	*per_cpu_ptr(pool->acomp_ctx, cpu) = acomp_ctx;
 
 	return 0;
+
+free_acomp:
+	kfree(acomp);
+free_acomp_ctx:
+	kfree(acomp_ctx);
+	return -ENOMEM;
 }
 
 static int zswap_cpu_comp_dead(unsigned int cpu, struct hlist_node *node)
-- 
2.27.0
