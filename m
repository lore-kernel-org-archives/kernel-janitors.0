From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 21 Dec 2020 05:13:20 +0000
Subject: [PATCH] cpufreq: intel_pstate: remove obsolete functions
Message-Id: <20201221051320.18391-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

percent_fp() was used in intel_pstate_pid_reset(), which was removed in
commit 9d0ef7af1f2d ("cpufreq: intel_pstate: Do not use PID-based P-state
selection") and hence, percent_fp() is unused since then.

percent_ext_fp() was last used in intel_pstate_update_perf_limits(), which
was refactored in commit 1a4fe38add8b ("cpufreq: intel_pstate: Remove
max/min fractions to limit performance"), and hence, percent_ext_fp() is
unused since then.

make CC=clang W=1 points us those unused functions:

drivers/cpufreq/intel_pstate.c:79:23: warning: unused function 'percent_fp' [-Wunused-function]
static inline int32_t percent_fp(int percent)
                      ^

drivers/cpufreq/intel_pstate.c:94:23: warning: unused function 'percent_ext_fp' [-Wunused-function]
static inline int32_t percent_ext_fp(int percent)
                      ^

Remove those obsolete functions.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201221

Srinivas, Len, Rafael, Viresh, please pick this minor non-urgent cleanup patch.

 drivers/cpufreq/intel_pstate.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 2a4db856222f..0e35dd247986 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -76,11 +76,6 @@ static inline int ceiling_fp(int32_t x)
 	return ret;
 }
 
-static inline int32_t percent_fp(int percent)
-{
-	return div_fp(percent, 100);
-}
-
 static inline u64 mul_ext_fp(u64 x, u64 y)
 {
 	return (x * y) >> EXT_FRAC_BITS;
@@ -91,11 +86,6 @@ static inline u64 div_ext_fp(u64 x, u64 y)
 	return div64_u64(x << EXT_FRAC_BITS, y);
 }
 
-static inline int32_t percent_ext_fp(int percent)
-{
-	return div_ext_fp(percent, 100);
-}
-
 /**
  * struct sample -	Store performance sample
  * @core_avg_perf:	Ratio of APERF/MPERF which is the actual average
-- 
2.17.1
