From: Colin King <colin.king@canonical.com>
Date: Wed, 17 May 2017 12:51:56 +0000
Subject: [PATCH] tools/power x86_energy_perf_policy: fix resource leak on file descriptor
Message-Id: <20170517125156.10977-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <len.brown@intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Function get_pkg_num is leaking an open file, fix this with a fclose().

Detected with static analysis by cppcheck:
[tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c:1115]:
   (error) Resource leak: fp

Fixes: 4beec1d7519691 ("tools/power x86_energy_perf_policy: support HWP.EPP")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c b/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
index 65bbe627a425..26a5b5265290 100644
--- a/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
+++ b/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
@@ -1110,6 +1110,7 @@ unsigned int get_pkg_num(int cpu)
 
 	fp = fopen_or_die(pathname, "r");
 	retval = fscanf(fp, "%d\n", &pkg);
+	fclose(fp);
 	if (retval != 1)
 		errx(1, "%s: failed to parse", pathname);
 	return pkg;
-- 
2.11.0

