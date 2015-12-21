From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Dec 2015 21:32:38 +0000
Subject: [PATCH 2/2] blackfin-cpufreq: Mark cpu_set_cclk() as static
Message-Id: <56786FF6.4060900@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5674598B.6020000@users.sourceforge.net>
 <56786EF3.3070203@users.sourceforge.net>
In-Reply-To: <56786EF3.3070203@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Dec 2015 22:12:26 +0100

The cpu_set_cclk() function was only used in a single source file so far.
Indicate this setting also by the corresponding linkage specifier.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/blackfin-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/blackfin-cpufreq.c b/drivers/cpufreq/blackfin-cpufreq.c
index 2a6f3ac..12e97d8 100644
--- a/drivers/cpufreq/blackfin-cpufreq.c
+++ b/drivers/cpufreq/blackfin-cpufreq.c
@@ -112,7 +112,7 @@ static unsigned int bfin_getfreq_khz(unsigned int cpu)
 }
 
 #ifdef CONFIG_BF60x
-int cpu_set_cclk(int cpu, unsigned long new)
+static int cpu_set_cclk(int cpu, unsigned long new)
 {
 	struct clk *clk;
 	int ret;
-- 
2.6.3

