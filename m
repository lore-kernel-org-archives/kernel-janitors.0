From: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Date: Tue, 20 Jan 2015 07:15:52 +0000
Subject: [PATCH] crypto: atmel: Free memory in error path
Message-Id: <1421738152-30462-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe Jaillet <christophe.jaillet@wanadoo.fr>

If only one of the 2 __get_free_pages fails, then there is a memory leak.

Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/atmel-aes.c  | 2 +-
 drivers/crypto/atmel-tdes.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
index 53d1c33..6597aac 100644
--- a/drivers/crypto/atmel-aes.c
+++ b/drivers/crypto/atmel-aes.c
@@ -673,9 +673,9 @@ err_map_out:
 	dma_unmap_single(dd->dev, dd->dma_addr_in, dd->buflen,
 		DMA_TO_DEVICE);
 err_map_in:
+err_alloc:
 	free_page((unsigned long)dd->buf_out);
 	free_page((unsigned long)dd->buf_in);
-err_alloc:
 	if (err)
 		pr_err("error: %d\n", err);
 	return err;
diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 5e7c896..258772d 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -376,9 +376,9 @@ err_map_out:
 	dma_unmap_single(dd->dev, dd->dma_addr_in, dd->buflen,
 		DMA_TO_DEVICE);
 err_map_in:
+err_alloc:
 	free_page((unsigned long)dd->buf_out);
 	free_page((unsigned long)dd->buf_in);
-err_alloc:
 	if (err)
 		pr_err("error: %d\n", err);
 	return err;
-- 
2.1.0

