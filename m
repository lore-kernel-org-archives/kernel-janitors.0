From: Nigel Christian <nigel.l.christian@gmail.com>
Date: Sun, 17 Jan 2021 00:47:05 +0000
Subject: [PATCH] cpufreq: intel_pstate: Remove repeated word
Message-Id: <20210117004705.GA10789@fedora>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: srinivas.pandruvada@linux.intel.com, lenb@kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

In the comment for trace in passive mode there is an 
unnecessary "the". Eradicate it.

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/cpufreq/intel_pstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 6f2ff2775664..5175ae3cac44 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -2498,7 +2498,7 @@ static int intel_cpufreq_verify_policy(struct cpufreq_policy_data *policy)
  * driver call was via the normal or fast switch path. Various graphs
  * output from the intel_pstate_tracer.py utility that include core_busy
  * (or performance or core_avg_perf) have a fixed y-axis from 0 to 100%,
- * so we use 10 to indicate the the normal path through the driver, and
+ * so we use 10 to indicate the normal path through the driver, and
  * 90 to indicate the fast switch path through the driver.
  * The scaled_busy field is not used, and is set to 0.
  */
-- 
2.29.2
