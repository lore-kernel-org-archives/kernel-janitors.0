From: Colin King <colin.king@canonical.com>
Date: Mon, 04 Jan 2021 13:02:27 +0000
Subject: [PATCH][next] cpufreq: powernow-k8: add null check to policy to avoid null pointer dereference
Message-Id: <20210104130227.35354-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Stephen Warren <swarren@nvidia.com>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there is an unlikely case where cpufreq_cpu_get returns a
null policy and this will cause a null pointer dereference later on.
Fix this by adding a null check and adding an error return.

Addresses-Coverity: ("Dereference null return")
Fixes: b43a7ffbf33b ("cpufreq: Notify all policy->cpus in cpufreq_notify_transition()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/cpufreq/powernow-k8.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index 0acc9e241cd7..c5368545ba1f 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -913,6 +913,8 @@ static int transition_frequency_fidvid(struct powernow_k8_data *data,
 	freqs.new = find_khz_freq_from_fid(fid);
 
 	policy = cpufreq_cpu_get(smp_processor_id());
+	if (!policy)
+		return 1;
 	cpufreq_cpu_put(policy);
 
 	cpufreq_freq_transition_begin(policy, &freqs);
-- 
2.29.2
