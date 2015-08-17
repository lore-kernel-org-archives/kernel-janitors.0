From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Aug 2015 14:48:56 +0000
Subject: [patch] PM / devfreq: exynos-ppmu: fix load_count calculation
Message-Id: <20150817144856.GD23820@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org

"pmcnt_high & 0xff" is a u32 so we shifting it 32 spaces is zero.  GCC
catches this bug:

drivers/devfreq/event/exynos-ppmu.c: In function ‘exynos_ppmu_v2_get_event’:
drivers/devfreq/event/exynos-ppmu.c:322:3: warning: left shift count >= width of type
   load_count = (u64)((pmcnt_high & 0xff) << 32) + (u64)pmcnt_low;

Fixes: 3d87b02281a2 ('PM / devfreq: exynos-ppmu: Add the support of PPMUv2 for Exynos5433')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/devfreq/event/exynos-ppmu.c b/drivers/devfreq/event/exynos-ppmu.c
index f9901f5..daf2cdb 100644
--- a/drivers/devfreq/event/exynos-ppmu.c
+++ b/drivers/devfreq/event/exynos-ppmu.c
@@ -319,7 +319,7 @@ static int exynos_ppmu_v2_get_event(struct devfreq_event_dev *edev,
 	case PPMU_PMNCNT3:
 		pmcnt_high = __raw_readl(info->ppmu.base + PPMU_V2_PMCNT3_HIGH);
 		pmcnt_low = __raw_readl(info->ppmu.base + PPMU_V2_PMCNT3_LOW);
-		load_count = (u64)((pmcnt_high & 0xff) << 32) + (u64)pmcnt_low;
+		load_count = (((u64)pmcnt_high & 0xff) << 32) + pmcnt_low;
 		break;
 	}
 	edata->load_count = load_count;
