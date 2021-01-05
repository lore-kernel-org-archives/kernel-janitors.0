From: Colin King <colin.king@canonical.com>
Date: Tue, 05 Jan 2021 10:19:57 +0000
Subject: [PATCH][V3] cpufreq: powernow-k8: pass policy rather than use cpufreq_cpu_get
Message-Id: <20210105101957.59072-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Stephen Warren <swarren@nvidia.com>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there is an unlikely case where cpufreq_cpu_get returns a
null policy and this will cause a null pointer dereference later on.
Fix this by passing the policy to transition_frequency_fidvid from the
caller and hence eliminating the need for the cpufreq_cpu_get and
cpufreq_cpu_put.  Thanks to Viresh Kumar for suggesting the fix.

Addresses-Coverity: ("Dereference null return")
Fixes: b43a7ffbf33b ("cpufreq: Notify all policy->cpus in cpufreq_notify_transition()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: pass the policy to transition_frequency_fidvid rather than add
    a null pointer check on the return from a cpufreq_cpu_get call.
V3: update subject line to match the fix

---
 drivers/cpufreq/powernow-k8.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index 0acc9e241cd7..b9ccb6a3dad9 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -878,9 +878,9 @@ static int get_transition_latency(struct powernow_k8_data *data)
 
 /* Take a frequency, and issue the fid/vid transition command */
 static int transition_frequency_fidvid(struct powernow_k8_data *data,
-		unsigned int index)
+		unsigned int index,
+		struct cpufreq_policy *policy)
 {
-	struct cpufreq_policy *policy;
 	u32 fid = 0;
 	u32 vid = 0;
 	int res;
@@ -912,9 +912,6 @@ static int transition_frequency_fidvid(struct powernow_k8_data *data,
 	freqs.old = find_khz_freq_from_fid(data->currfid);
 	freqs.new = find_khz_freq_from_fid(fid);
 
-	policy = cpufreq_cpu_get(smp_processor_id());
-	cpufreq_cpu_put(policy);
-
 	cpufreq_freq_transition_begin(policy, &freqs);
 	res = transition_fid_vid(data, fid, vid);
 	cpufreq_freq_transition_end(policy, &freqs, res);
@@ -969,7 +966,7 @@ static long powernowk8_target_fn(void *arg)
 
 	powernow_k8_acpi_pst_values(data, newstate);
 
-	ret = transition_frequency_fidvid(data, newstate);
+	ret = transition_frequency_fidvid(data, newstate, pol);
 
 	if (ret) {
 		pr_err("transition frequency failed\n");
-- 
2.29.2
