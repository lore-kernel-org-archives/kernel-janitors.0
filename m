From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 14 Apr 2012 20:48:41 +0000
Subject: [PATCH] drivers/crypto/amcc/crypto4xx_core.c: move up err_request_irq label
Message-Id: <1334436521-28622-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Move the err_request_irq error label up to reflect that tasklet_init and
irq_of_parse_and_map have taken place.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/crypto/amcc/crypto4xx_core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/amcc/crypto4xx_core.c b/drivers/crypto/amcc/crypto4xx_core.c
index 13f8e1a..802e851 100644
--- a/drivers/crypto/amcc/crypto4xx_core.c
+++ b/drivers/crypto/amcc/crypto4xx_core.c
@@ -1244,9 +1244,9 @@ err_start_dev:
 	iounmap(core_dev->dev->ce_base);
 err_iomap:
 	free_irq(core_dev->irq, dev);
+err_request_irq:
 	irq_dispose_mapping(core_dev->irq);
 	tasklet_kill(&core_dev->tasklet);
-err_request_irq:
 	crypto4xx_destroy_sdr(core_dev->dev);
 err_build_sdr:
 	crypto4xx_destroy_gdr(core_dev->dev);

