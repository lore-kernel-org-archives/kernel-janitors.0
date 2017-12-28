From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 17:10:45 +0000
Subject: [PATCH 2/2] perf: arm_spe: Delete an unnecessary return statement in __arm_spe_pmu_dev_probe()
Message-Id: <d1eceb38-27b9-40a9-d995-ca06e2d8e90a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8a92bb8f-4295-6912-19a4-9103226a3c62@users.sourceforge.net>
In-Reply-To: <8a92bb8f-4295-6912-19a4-9103226a3c62@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 17:34:54 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/perf/arm_spe_pmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 27fac8907d1d..b30654f75a8c 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -1033,7 +1033,6 @@ static void __arm_spe_pmu_dev_probe(void *info)
 		 spe_pmu->max_record_sz, spe_pmu->align, spe_pmu->features);
 
 	spe_pmu->features |= SPE_PMU_FEAT_DEV_PROBED;
-	return;
 }
 
 static void __arm_spe_pmu_reset_local(void)
-- 
2.15.1

