From: Colin King <colin.king@canonical.com>
Date: Thu, 30 Jan 2020 10:05:37 +0000
Subject: [PATCH][next] thermal: stm32: fix spelling mistake "preprare" -> "prepare"
Message-Id: <20200130100537.18069-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Pascal Paillet <p.paillet@st.com>, linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/thermal/st/stm_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 1cc5e6c5709e..ad9e3bf8fdf6 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -535,7 +535,7 @@ static int stm_thermal_probe(struct platform_device *pdev)
 	/* Configure and enable HW sensor */
 	ret = stm_thermal_prepare(sensor);
 	if (ret) {
-		dev_err(&pdev->dev, "Error preprare sensor: %d\n", ret);
+		dev_err(&pdev->dev, "Error prepare sensor: %d\n", ret);
 		return ret;
 	}
 
-- 
2.24.0
