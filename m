From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Sep 2015 06:19:49 +0000
Subject: [patch] mmc: sdhci-of-at91: remove a line of dead code
Message-Id: <20150916061949.GA21542@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org

The goto is correct and the unreachable "return -EINVAL" should be
removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of-at91.c
index d155664..d3df786 100644
--- a/drivers/mmc/host/sdhci-of-at91.c
+++ b/drivers/mmc/host/sdhci-of-at91.c
@@ -110,7 +110,6 @@ static int sdhci_at91_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to set gck");
 		goto hclock_disable_unprepare;
-		return -EINVAL;
 	}
 	/*
 	 * We need to check if we have the requested rate for gck because in
