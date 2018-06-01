From: Colin King <colin.king@canonical.com>
Date: Fri, 01 Jun 2018 13:05:12 +0000
Subject: [PATCH] cpufreq: ACPI: make function acpi_cpufreq_fast_switch static
Message-Id: <20180601130512.30857-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function acpi_cpufreq_fast_switch is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
drivers/cpufreq/acpi-cpufreq.c:468:14: warning: symbol
'acpi_cpufreq_fast_switch' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/cpufreq/acpi-cpufreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index 9449657d72f0..32ba4bc972e7 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -465,8 +465,8 @@ static int acpi_cpufreq_target(struct cpufreq_policy *policy,
 	return result;
 }
 
-unsigned int acpi_cpufreq_fast_switch(struct cpufreq_policy *policy,
-				      unsigned int target_freq)
+static unsigned int acpi_cpufreq_fast_switch(struct cpufreq_policy *policy,
+					     unsigned int target_freq)
 {
 	struct acpi_cpufreq_data *data = policy->driver_data;
 	struct acpi_processor_performance *perf;
-- 
2.17.0

