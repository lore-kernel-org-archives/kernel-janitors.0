From: Colin King <colin.king@canonical.com>
Date: Mon, 16 Sep 2019 09:12:49 +0000
Subject: [PATCH][next] memory: exynos5422: fix spelling mistake "counld" -> "could"
Message-Id: <20190916091249.31950-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukasz Luba <l.luba@partner.samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/memory/samsung/exynos5422-dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index 8c2ec29a7d57..ac5f55813900 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -1078,7 +1078,7 @@ static int exynos5_performance_counters_init(struct exynos5_dmc *dmc)
 	ret = exynos5_counters_set_event(dmc);
 	if (ret < 0) {
 		exynos5_counters_disable_edev(dmc);
-		dev_err(dmc->dev, "counld not set event counter\n");
+		dev_err(dmc->dev, "could not set event counter\n");
 		return ret;
 	}
 
-- 
2.20.1
