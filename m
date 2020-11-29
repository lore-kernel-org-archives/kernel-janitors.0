From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 29 Nov 2020 07:51:26 +0000
Subject: [PATCH] EDAC/al-mc-edac: Slighly simplify code
Message-Id: <20201129075126.1450573-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: talel@amazon.com, bp@alien8.de, mchehab@kernel.org, tony.luck@intel.com, james.morse@arm.com, rric@kernel.org
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Use 'devm_add_action_or_reset()' instead of open coding it.
This makes the error handling code look more consistent.
This also save a few LoC.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/edac/al_mc_edac.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/al_mc_edac.c b/drivers/edac/al_mc_edac.c
index 7d4f396c27b5..178b9e581a72 100644
--- a/drivers/edac/al_mc_edac.c
+++ b/drivers/edac/al_mc_edac.c
@@ -238,11 +238,9 @@ static int al_mc_edac_probe(struct platform_device *pdev)
 	if (!mci)
 		return -ENOMEM;
 
-	ret = devm_add_action(&pdev->dev, devm_al_mc_edac_free, mci);
-	if (ret) {
-		edac_mc_free(mci);
+	ret = devm_add_action_or_reset(&pdev->dev, devm_al_mc_edac_free, mci);
+	if (ret)
 		return ret;
-	}
 
 	platform_set_drvdata(pdev, mci);
 	al_mc = mci->pvt_info;
@@ -293,11 +291,9 @@ static int al_mc_edac_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_add_action(&pdev->dev, devm_al_mc_edac_del, &pdev->dev);
-	if (ret) {
-		edac_mc_del_mc(&pdev->dev);
+	ret = devm_add_action_or_reset(&pdev->dev, devm_al_mc_edac_del, &pdev->dev);
+	if (ret)
 		return ret;
-	}
 
 	if (al_mc->irq_ue > 0) {
 		ret = devm_request_irq(&pdev->dev,
-- 
2.27.0
