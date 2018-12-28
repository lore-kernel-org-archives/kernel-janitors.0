From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 28 Dec 2018 06:10:33 +0000
Subject: [PATCH -next] crypto: ux500 catch dma submission error
Message-Id: <1545977433-125317-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Markus Elfring <elfring@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <natechancellor@gmail.com>, Randy Dunlap <rdunlap@infradead.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

Test cookie return by dmaengine_submit() and return error if any.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/ux500/cryp/cryp_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/crypto/ux500/cryp/cryp_core.c b/drivers/crypto/ux500/cryp/cryp_core.c
index a92a66b..db94f89 100644
--- a/drivers/crypto/ux500/cryp/cryp_core.c
+++ b/drivers/crypto/ux500/cryp/cryp_core.c
@@ -595,6 +595,12 @@ static int cryp_set_dma_transfer(struct cryp_ctx *ctx,
 	}
 
 	cookie = dmaengine_submit(desc);
+	if (dma_submit_error(cookie)) {
+		dev_dbg(ctx->device->dev, "[%s]: DMA submission failed\n",
+			__func__);
+		return cookie;
+	}
+
 	dma_async_issue_pending(channel);
 
 	return 0;
