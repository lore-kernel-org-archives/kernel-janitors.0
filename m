From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 15 Aug 2017 19:33:24 +0000
Subject: [PATCH] crypto: inside-secure - fix an error handling path in safexcel_probe()
Message-Id: <20170815193324.8193-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: antoine.tenart@free-electrons.com, herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'ret' is known to be 0 at this point.
If 'safexcel_request_ring_irq()' fails, it returns an error code.
Return this value instead of 0 which means success.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/inside-secure/safexcel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/inside-secure/safexcel.c b/drivers/crypto/inside-secure/safexcel.c
index 1fabd4aee81b..89ba9e85c0f3 100644
--- a/drivers/crypto/inside-secure/safexcel.c
+++ b/drivers/crypto/inside-secure/safexcel.c
@@ -839,9 +839,10 @@ static int safexcel_probe(struct platform_device *pdev)
 		snprintf(irq_name, 6, "ring%d", i);
 		irq = safexcel_request_ring_irq(pdev, irq_name, safexcel_irq_ring,
 						ring_irq);
-
-		if (irq < 0)
+		if (irq < 0) {
+			ret = irq;
 			goto err_clk;
+		}
 
 		priv->ring[i].work_data.priv = priv;
 		priv->ring[i].work_data.ring = i;
-- 
2.11.0

