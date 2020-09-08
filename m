From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 Sep 2020 07:25:57 +0000
Subject: [PATCH] PM / devfreq: tegra30:  disable clock on error in probe
Message-Id: <20200908072557.GC294938@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Osipenko <digetx@gmail.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org

This error path needs to call clk_disable_unprepare().

Fixes: 7296443b900e ("PM / devfreq: tegra30: Handle possible round-rate error")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
---
 drivers/devfreq/tegra30-devfreq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index e94a27804c20..dedd39de7367 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -836,7 +836,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
 	if (rate < 0) {
 		dev_err(&pdev->dev, "Failed to round clock rate: %ld\n", rate);
-		return rate;
+		err = rate;
+		goto disable_clk;
 	}
 
 	tegra->max_freq = rate / KHZ;
@@ -897,6 +898,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	dev_pm_opp_remove_all_dynamic(&pdev->dev);
 
 	reset_control_reset(tegra->reset);
+disable_clk:
 	clk_disable_unprepare(tegra->clock);
 
 	return err;
-- 
2.28.0
