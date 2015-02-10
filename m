From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Feb 2015 10:35:47 +0000
Subject: [patch] PM / devfreq: event: testing the wrong variable
Message-Id: <20150210103547.GA18481@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

There is a typo here so we test "edev" but we intended to test
"edev[i]".

Fixes: f262f28c1470 ('PM / devfreq: event: Add devfreq_event class')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/devfreq/event/exynos-ppmu.c b/drivers/devfreq/event/exynos-ppmu.c
index 135be0a..ad83473 100644
--- a/drivers/devfreq/event/exynos-ppmu.c
+++ b/drivers/devfreq/event/exynos-ppmu.c
@@ -327,8 +327,8 @@ static int exynos_ppmu_probe(struct platform_device *pdev)
 
 	for (i = 0; i < info->num_events; i++) {
 		edev[i] = devm_devfreq_event_add_edev(&pdev->dev, &desc[i]);
-		if (IS_ERR(edev)) {
-			ret = PTR_ERR(edev);
+		if (IS_ERR(edev[i])) {
+			ret = PTR_ERR(edev[i]);
 			dev_err(&pdev->dev,
 				"failed to add devfreq-event device\n");
 			goto err;
