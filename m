From: Colin King <colin.king@canonical.com>
Date: Fri, 17 Nov 2017 18:19:08 +0000
Subject: [PATCH] staging: ccree: fix incorrect indentation of break statement
Message-Id: <20171117181908.2257-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilad Ben-Yossef <gilad@benyossef.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The break statement is indented one level too many, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/ccree/ssi_aead.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ccree/ssi_aead.c b/drivers/staging/ccree/ssi_aead.c
index ba0954e4d2e5..446da9d47cd9 100644
--- a/drivers/staging/ccree/ssi_aead.c
+++ b/drivers/staging/ccree/ssi_aead.c
@@ -2108,7 +2108,7 @@ static int ssi_aead_process(struct aead_request *req, enum drv_crypto_direction
 		if (ctx->cipher_mode = DRV_CIPHER_GCTR)
 			ssi_aead_gcm(req, desc, &seq_len);
 #endif /*SSI_CC_HAS_AES_GCM*/
-			break;
+		break;
 #endif
 	default:
 		dev_err(dev, "Unsupported authenc (%d)\n", ctx->auth_mode);
-- 
2.14.1

