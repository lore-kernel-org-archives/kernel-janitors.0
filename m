From: Colin King <colin.king@canonical.com>
Date: Fri, 02 Oct 2020 15:48:00 +0000
Subject: [PATCH][next] perf: arm-cmn: fix less than zero check on unsigned dtc->irq
Message-Id: <20201002154800.92607-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the failure check on dtc->irq is always false because
dtc->irq is an unsigned int. Fix this by using a temporary signed
int for the less than zero error check.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: 0ba64770a2f2 ("perf: Add Arm CMN-600 PMU driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/perf/arm-cmn.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index a76ff594f3ca..21819af163f3 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -1246,11 +1246,13 @@ static int arm_cmn_init_dtc(struct arm_cmn *cmn, struct arm_cmn_node *dn, int id
 {
 	struct arm_cmn_dtc *dtc = cmn->dtc + idx;
 	struct arm_cmn_node *xp;
+	int irq;
 
 	dtc->base = dn->pmu_base - CMN_PMU_OFFSET;
-	dtc->irq = platform_get_irq(to_platform_device(cmn->dev), idx);
-	if (dtc->irq < 0)
-		return dtc->irq;
+	irq = platform_get_irq(to_platform_device(cmn->dev), idx);
+	if (irq < 0)
+		return irq;
+	dtc->irq = irq;
 
 	writel_relaxed(0, dtc->base + CMN_DT_PMCR);
 	writel_relaxed(0x1ff, dtc->base + CMN_DT_PMOVSR_CLR);
-- 
2.27.0
