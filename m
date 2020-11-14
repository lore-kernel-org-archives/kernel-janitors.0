From: Nigel Christian <nigel.l.christian@gmail.com>
Date: Sat, 14 Nov 2020 05:12:19 +0000
Subject: [PATCH] memory: tegra20-emc: remove redundant error message
Message-Id: <20201114051219.GA4746@fedora-project>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: krzk@kernel.org
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org

There is no need for dev_err() since irq already prints an error. 
Eliminate unnecessary curly braces for single statement block.

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 5e10aa97809f..181a360d7d6b 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -959,10 +959,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	int irq, err;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "please update your device tree\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
 	if (!emc)
-- 
2.28.0
