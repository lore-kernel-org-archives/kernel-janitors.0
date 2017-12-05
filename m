From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Dec 2017 14:37:17 +0000
Subject: [PATCH] staging: ccree: Uninitialized return in ssi_ahash_import()
Message-Id: <20171205143717.gqhyethohcet3fz7@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The return value isn't initialized on some success paths.

Fixes: c5f39d07860c ("staging: ccree: fix leak of import() after init()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/ccree/ssi_hash.c b/drivers/staging/ccree/ssi_hash.c
index a2e8a9d32e00..3855c42e61af 100644
--- a/drivers/staging/ccree/ssi_hash.c
+++ b/drivers/staging/ccree/ssi_hash.c
@@ -1823,7 +1823,7 @@ static int ssi_ahash_import(struct ahash_request *req, const void *in)
 	struct device *dev = drvdata_to_dev(ctx->drvdata);
 	struct ahash_req_ctx *state = ahash_request_ctx(req);
 	u32 tmp;
-	int rc;
+	int rc = 0;
 
 	memcpy(&tmp, in, sizeof(u32));
 	if (tmp != CC_EXPORT_MAGIC) {
