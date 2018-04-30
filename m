From: Colin King <colin.king@canonical.com>
Date: Mon, 30 Apr 2018 14:48:01 +0000
Subject: [PATCH] cpufreq: s3c2440: fix spelling mistake: "divsiors" -> "divisors"
Message-Id: <20180430144801.6727-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in s3c_freq_dbg debug message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/cpufreq/s3c2440-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/s3c2440-cpufreq.c b/drivers/cpufreq/s3c2440-cpufreq.c
index d0d75b65ddd6..d2f67b7a20dd 100644
--- a/drivers/cpufreq/s3c2440-cpufreq.c
+++ b/drivers/cpufreq/s3c2440-cpufreq.c
@@ -143,7 +143,7 @@ static void s3c2440_cpufreq_setdivs(struct s3c_cpufreq_config *cfg)
 {
 	unsigned long clkdiv, camdiv;
 
-	s3c_freq_dbg("%s: divsiors: h=%d, p=%d\n", __func__,
+	s3c_freq_dbg("%s: divisors: h=%d, p=%d\n", __func__,
 		     cfg->divs.h_divisor, cfg->divs.p_divisor);
 
 	clkdiv = __raw_readl(S3C2410_CLKDIVN);
-- 
2.17.0

