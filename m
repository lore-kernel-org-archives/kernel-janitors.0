From: Colin King <colin.king@canonical.com>
Date: Sat, 16 Sep 2017 16:32:51 +0000
Subject: [PATCH] staging: ccree: remove unused and redundant variable idx
Message-Id: <20170916163251.29796-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilad Ben-Yossef <gilad@benyossef.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable idx is being set but never read and thus it can be
removed because it is redundant. Cleans up clang build warnings:

warning: Value stored to 'idx' during its initialization is never read
warning: Value stored to 'idx' is never read
warning: Value stored to 'idx' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/ccree/ssi_aead.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/ccree/ssi_aead.c b/drivers/staging/ccree/ssi_aead.c
index 5abe6b24ff8c..8d6b95efce86 100644
--- a/drivers/staging/ccree/ssi_aead.c
+++ b/drivers/staging/ccree/ssi_aead.c
@@ -1812,7 +1812,6 @@ static inline int ssi_aead_gcm(
 	unsigned int *seq_size)
 {
 	struct aead_req_ctx *req_ctx = aead_request_ctx(req);
-	unsigned int idx = *seq_size;
 	unsigned int cipher_flow_mode;
 
 	if (req_ctx->gen_ctx.op_type = DRV_CRYPTO_DIRECTION_DECRYPT) {
@@ -1829,7 +1828,6 @@ static inline int ssi_aead_gcm(
 		ssi_aead_create_assoc_desc(req, DIN_HASH, desc, seq_size);
 		ssi_aead_gcm_setup_gctr_desc(req, desc, seq_size);
 		ssi_aead_process_gcm_result_desc(req, desc, seq_size);
-		idx = *seq_size;
 		return 0;
 	}
 
@@ -1844,7 +1842,6 @@ static inline int ssi_aead_gcm(
 		ssi_aead_process_cipher_data_desc(req, cipher_flow_mode, desc, seq_size);
 	ssi_aead_process_gcm_result_desc(req, desc, seq_size);
 
-	idx = *seq_size;
 	return 0;
 }
 
-- 
2.14.1

