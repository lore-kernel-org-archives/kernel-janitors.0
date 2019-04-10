From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 10 Apr 2019 02:47:42 +0000
Subject: [PATCH -next] crypto: remove set but not used variable 'fini'
Message-Id: <20190410024742.2103-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/crypto/mxs-dcp.c: In function 'dcp_chan_thread_sha':
drivers/crypto/mxs-dcp.c:707:11: warning:
 variable 'fini' set but not used [-Wunused-but-set-variable]

It's not used since commit d80771c08363 ("crypto: mxs-dcp - Fix wait
logic on chan threads"),so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/mxs-dcp.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
index 494cfc4272f3..b4429891e368 100644
--- a/drivers/crypto/mxs-dcp.c
+++ b/drivers/crypto/mxs-dcp.c
@@ -700,11 +700,7 @@ static int dcp_chan_thread_sha(void *data)
 
 	struct crypto_async_request *backlog;
 	struct crypto_async_request *arq;
-
-	struct dcp_sha_req_ctx *rctx;
-
-	struct ahash_request *req;
-	int ret, fini;
+	int ret;
 
 	while (!kthread_should_stop()) {
 		set_current_state(TASK_INTERRUPTIBLE);
@@ -725,11 +721,7 @@ static int dcp_chan_thread_sha(void *data)
 			backlog->complete(backlog, -EINPROGRESS);
 
 		if (arq) {
-			req = ahash_request_cast(arq);
-			rctx = ahash_request_ctx(req);
-
 			ret = dcp_sha_req_to_buf(arq);
-			fini = rctx->fini;
 			arq->complete(arq, ret);
 		}
 	}
