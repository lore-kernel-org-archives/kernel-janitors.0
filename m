From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 28 Oct 2016 09:09:45 +0000
Subject: [PATCH] drm/tegra: dpaux: Fix error handling
Message-Id: <20161028090945.11573-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thierry.reding@gmail.com, airlied@linux.ie, swarren@wwwdotorg.org, gnurou@gmail.com, jonathanh@nvidia.com, treding@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'devm_pinctrl_register()' returns an error pointer or a valid handle. So
checking for NULL here is pointless and can never trigger.

Check the returned value with IS_ERR instead and propagate this value as
done in the other functions which call 'devm_pinctrl_register()'

Fixes: 0751bb5c44fe ("drm/tegra: dpaux: Add pinctrl support")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/tegra/dpaux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 059f409556d5..2fde44c3a1b3 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -539,9 +539,9 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	dpaux->desc.owner = THIS_MODULE;
 
 	dpaux->pinctrl = devm_pinctrl_register(&pdev->dev, &dpaux->desc, dpaux);
-	if (!dpaux->pinctrl) {
+	if (IS_ERR(dpaux->pinctrl)) {
 		dev_err(&pdev->dev, "failed to register pincontrol\n");
-		return -ENODEV;
+		return PTR_ERR(dpaux->pinctrl);
 	}
 #endif
 	/* enable and clear all interrupts */
-- 
2.9.3

