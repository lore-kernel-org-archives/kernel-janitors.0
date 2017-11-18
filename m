From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 18 Nov 2017 13:45:45 +0000
Subject: [PATCH] crypto: hifn_795x - Fix a memory leak in the error handling path of 'hifn_probe()'
Message-Id: <20171118134545.25784-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'dev' is leaking in the error handling path of 'hifn_probe()'.

Add a 'kfree(dev)' to match the code in 'hifn_remove()'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/hifn_795x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/hifn_795x.c b/drivers/crypto/hifn_795x.c
index e09d4055b19e..a5a36fe7bf2c 100644
--- a/drivers/crypto/hifn_795x.c
+++ b/drivers/crypto/hifn_795x.c
@@ -2579,6 +2579,7 @@ static int hifn_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	for (i = 0; i < 3; ++i)
 		if (dev->bar[i])
 			iounmap(dev->bar[i]);
+	kfree(dev);
 
 err_out_free_regions:
 	pci_release_regions(pdev);
-- 
2.14.1

