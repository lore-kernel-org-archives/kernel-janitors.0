From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 11 Jan 2016 06:16:15 +0000
Subject: [PATCH 2/2] soc: versatile: Drop a useless static qualifier
Message-Id: <1452492975-8402-2-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1452492975-8402-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1452492975-8402-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no need to have the 'struct regmap *syscon_regmap' variable
static in the probe function.
It only wastes a few bytes of memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/soc/versatile/soc-realview.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/versatile/soc-realview.c b/drivers/soc/versatile/soc-realview.c
index 39ffe18..6d26288 100644
--- a/drivers/soc/versatile/soc-realview.c
+++ b/drivers/soc/versatile/soc-realview.c
@@ -97,7 +97,7 @@ static struct device_attribute realview_build_attr  
 static int realview_soc_probe(struct platform_device *pdev)
 {
-	static struct regmap *syscon_regmap;
+	struct regmap *syscon_regmap;
 	struct soc_device *soc_dev;
 	struct soc_device_attribute *soc_dev_attr;
 	struct device_node *np = pdev->dev.of_node;
-- 
2.5.0

