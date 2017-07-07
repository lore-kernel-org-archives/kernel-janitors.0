From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 07 Jul 2017 04:56:16 +0000
Subject: [PATCH] arcnet: com20020-pci: Fix an error handling path in 'com20020pci_probe()'
Message-Id: <20170707045616.8909-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: m.grzeschik@pengutronix.de
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If this memory allocation fails, we should go through the error handling
path as done everywhere else in this function before returning.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/arcnet/com20020-pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/arcnet/com20020-pci.c b/drivers/net/arcnet/com20020-pci.c
index 239de38fbd6a..8e89a2ac071e 100644
--- a/drivers/net/arcnet/com20020-pci.c
+++ b/drivers/net/arcnet/com20020-pci.c
@@ -196,8 +196,10 @@ static int com20020pci_probe(struct pci_dev *pdev,
 
 		card = devm_kzalloc(&pdev->dev, sizeof(struct com20020_dev),
 				    GFP_KERNEL);
-		if (!card)
-			return -ENOMEM;
+		if (!card) {
+			ret = -ENOMEM;
+			goto out_port;
+		}
 
 		card->index = i;
 		card->pci_priv = priv;
-- 
2.11.0

