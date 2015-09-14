From: kan.liang@intel.com
Date: Mon, 14 Sep 2015 14:14:07 +0000
Subject: [PATCH 1/1] perf/x86/intel: Fix static checker warning in lbr enable
Message-Id: <1442240047-48149-1-git-send-email-kan.liang@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: a.p.zijlstra@chello.nl
Cc: dan.carpenter@oracle.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Kan Liang <kan.liang@intel.com>

From: Kan Liang <kan.liang@intel.com>

The commit deb27519bf1f ("perf/x86/intel: Fix LBR callstack issue caused
by FREEZE_LBRS_ON_PMI") leads to the following Smatch complaint.
warn: variable dereferenced before check 'cpuc->lbr_sel' (see line 154)

This patch is to fix this warning.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Kan Liang <kan.liang@intel.com>
---
 arch/x86/kernel/cpu/perf_event_intel_lbr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/perf_event_intel_lbr.c b/arch/x86/kernel/cpu/perf_event_intel_lbr.c
index a1d07c7..ad0b8b0 100644
--- a/arch/x86/kernel/cpu/perf_event_intel_lbr.c
+++ b/arch/x86/kernel/cpu/perf_event_intel_lbr.c
@@ -151,8 +151,9 @@ static void __intel_pmu_lbr_enable(bool pmi)
 	 * No need to reprogram LBR_SELECT in a PMI, as it
 	 * did not change.
 	 */
-	lbr_select = cpuc->lbr_sel->config;
-	if (cpuc->lbr_sel && !pmi)
+	if (cpuc->lbr_sel)
+		lbr_select = cpuc->lbr_sel->config;
+	if (!pmi)
 		wrmsrl(MSR_LBR_SELECT, lbr_select);
 
 	rdmsrl(MSR_IA32_DEBUGCTLMSR, debugctl);
-- 
1.8.3.1

