From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 16 Aug 2017 05:05:06 +0000
Subject: [PATCH] EDAC, altera: Fix an error handling path in 'altr_edac_device_probe()'
Message-Id: <20170816050506.14541-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thor.thayer@linux.intel.com, bp@alien8.de, mchehab@kernel.org
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'res' is known to be 0 at this point.
If 'devm_ioremap()' fails, returns -ENOMEM instead of 0 which means
success.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/edac/altera_edac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index fa2e5db56d24..346c4987b284 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -747,8 +747,10 @@ static int altr_edac_device_probe(struct platform_device *pdev)
 	drvdata->edac_dev_name = ecc_name;
 
 	drvdata->base = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (!drvdata->base)
+	if (!drvdata->base) {
+		res = -ENOMEM;
 		goto fail1;
+	}
 
 	/* Get driver specific data for this EDAC device */
 	drvdata->data = of_match_node(altr_edac_device_of_match, np)->data;
-- 
2.11.0

