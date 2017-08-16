From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 16 Aug 2017 04:58:21 +0000
Subject: [PATCH] EDAC, thunderx: Fix an error handling path in 'thunderx_lmc_probe()'
Message-Id: <20170816045821.14165-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, david.daney@cavium.com, bp@alien8.de, mchehab@kernel.org
Cc: linux-edac@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'ret' is known to be 0 at this point.
If 'ioremap()' fails, returns -ENOMEM instead of 0 which means success.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/edac/thunderx_edac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/edac/thunderx_edac.c b/drivers/edac/thunderx_edac.c
index c8e8b9fd4772..00b89f057695 100644
--- a/drivers/edac/thunderx_edac.c
+++ b/drivers/edac/thunderx_edac.c
@@ -779,6 +779,7 @@ static int thunderx_lmc_probe(struct pci_dev *pdev,
 
 	if (!l2c_ioaddr) {
 		dev_err(&pdev->dev, "Cannot map L2C_CTL\n");
+		ret = -ENOMEM;
 		goto err_free;
 	}
 
-- 
2.11.0

