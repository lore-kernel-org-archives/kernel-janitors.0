From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 13:19:06 +0000
Subject: [patch] cpufreq: s3c2416: double free on driver init error path
Message-Id: <20170207131906.GD27416@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kukjin Kim <kgene@kernel.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

The "goto err_armclk;" error path already does a clk_put(s3c_freq->hclk);
so this is a double free.

Fixes: 34ee55075265 ("[CPUFREQ] Add S3C2416/S3C2450 cpufreq driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/cpufreq/s3c2416-cpufreq.c b/drivers/cpufreq/s3c2416-cpufreq.c
index d6d425773fa4..5b2db3c6568f 100644
--- a/drivers/cpufreq/s3c2416-cpufreq.c
+++ b/drivers/cpufreq/s3c2416-cpufreq.c
@@ -400,7 +400,6 @@ static int s3c2416_cpufreq_driver_init(struct cpufreq_policy *policy)
 	rate = clk_get_rate(s3c_freq->hclk);
 	if (rate < 133 * 1000 * 1000) {
 		pr_err("cpufreq: HCLK not at 133MHz\n");
-		clk_put(s3c_freq->hclk);
 		ret = -EINVAL;
 		goto err_armclk;
 	}
