From: Colin King <colin.king@canonical.com>
Date: Mon, 22 Jun 2020 15:44:32 +0000
Subject: [PATCH][next] mm/zswap: remove redundant assignment to variable dlen
Message-Id: <20200622154432.50133-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Seth Jennings <sjenning@redhat.com>, Dan Streetman <ddstreet@ieee.org>, Vitaly Wool <vitaly.wool@konsulko.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable dlen is being assigned a value that is never read, the
assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 mm/zswap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 14839cbac7ff..d63b90edd833 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1249,7 +1249,6 @@ static int zswap_frontswap_load(unsigned type, pgoff_t offset,
 	sg_init_one(&output, dst, dlen);
 	acomp_request_set_params(acomp_ctx->req, &input, &output, entry->length, dlen);
 	ret = crypto_wait_req(crypto_acomp_decompress(acomp_ctx->req), &acomp_ctx->wait);
-	dlen = acomp_ctx->req->dlen;
 	mutex_unlock(&acomp_ctx->mutex);
 
 	kunmap(page);
-- 
2.27.0
