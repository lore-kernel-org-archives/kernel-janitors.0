From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Nov 2017 12:37:19 +0000
Subject: [PATCH] crypto: cavium: fix memory leak on info
Message-Id: <20171115123719.12667-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Cherian <george.cherian@cavium.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The object info is being leaked on an error return path, fix this
by setting ret to -ENOMEM and exiting via the request_cleanup path
that will free info.

Detected by CoverityScan, CID#1408439 ("Resource Leak")

Fixes: c694b233295b ("crypto: cavium - Add the Virtual Function driver for CPT")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/cavium/cpt/cptvf_reqmanager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/cavium/cpt/cptvf_reqmanager.c b/drivers/crypto/cavium/cpt/cptvf_reqmanager.c
index 169e66231bcf..b0ba4331944b 100644
--- a/drivers/crypto/cavium/cpt/cptvf_reqmanager.c
+++ b/drivers/crypto/cavium/cpt/cptvf_reqmanager.c
@@ -459,7 +459,8 @@ int process_request(struct cpt_vf *cptvf, struct cpt_request_info *req)
 	info->completion_addr = kzalloc(sizeof(union cpt_res_s), GFP_KERNEL);
 	if (unlikely(!info->completion_addr)) {
 		dev_err(&pdev->dev, "Unable to allocate memory for completion_addr\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto request_cleanup;
 	}
 
 	result = (union cpt_res_s *)info->completion_addr;
-- 
2.14.1

