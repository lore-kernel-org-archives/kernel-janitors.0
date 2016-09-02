From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Fri, 02 Sep 2016 09:48:53 +0000
Subject: [PATCH] crypto: ccp - add missing release in ccp_dmaengine_register
Message-Id: <20160902094853.21376-1-lambert.quentin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Lendacky <thomas.lendacky@amd.com>, Gary Hook <gary.hook@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Quentin Lambert <lambert.quentin@gmail.com>

ccp_dmaengine_register used to return with an error code before
releasing all resource. This patch adds a jump to the appropriate label
ensuring that the resources are properly released before returning.

This issue was found with Hector.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/crypto/ccp/ccp-dmaengine.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

--- a/drivers/crypto/ccp/ccp-dmaengine.c
+++ b/drivers/crypto/ccp/ccp-dmaengine.c
@@ -650,8 +650,11 @@ int ccp_dmaengine_register(struct ccp_de
 	dma_desc_cache_name = devm_kasprintf(ccp->dev, GFP_KERNEL,
 					     "%s-dmaengine-desc-cache",
 					     ccp->name);
-	if (!dma_cmd_cache_name)
-		return -ENOMEM;
+	if (!dma_cmd_cache_name) {
+		ret = -ENOMEM;
+		goto err_cache;
+	}
+
 	ccp->dma_desc_cache = kmem_cache_create(dma_desc_cache_name,
 						sizeof(struct ccp_dma_desc),
 						sizeof(void *),
