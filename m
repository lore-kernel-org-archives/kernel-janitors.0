From: Colin King <colin.king@canonical.com>
Date: Thu, 15 Jun 2017 09:55:59 +0000
Subject: [PATCH] cpufreq: sfi: make freq_table static
Message-Id: <20170615095559.21973-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

pointer freq_table can be made static as it does not need to be in
global scope.

Cleans up sparse warning:
"symbol 'freq_table' was not declared. Should it be static?"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/cpufreq/sfi-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/sfi-cpufreq.c b/drivers/cpufreq/sfi-cpufreq.c
index 992ce6f9abec..3779742f86e3 100644
--- a/drivers/cpufreq/sfi-cpufreq.c
+++ b/drivers/cpufreq/sfi-cpufreq.c
@@ -24,7 +24,7 @@
 
 #include <asm/msr.h>
 
-struct cpufreq_frequency_table *freq_table;
+static struct cpufreq_frequency_table *freq_table;
 static struct sfi_freq_table_entry *sfi_cpufreq_array;
 static int num_freq_table_entries;
 
-- 
2.11.0

