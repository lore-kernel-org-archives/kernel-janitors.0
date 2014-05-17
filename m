From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 17 May 2014 22:14:14 +0000
Subject: [PATCH 2/4 V2] cpupower: Remove redundant error check
Message-Id: <1400364854-9575-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Peter Senna Tschudin <peter.senna@gmail.com>, Thomas Renninger <trenn@suse.de>, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Alan Cox <alan@linux.intel.com>, kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com

Remove double checks, and move the call to print_error to the
first check. Replace break by return, and return 0 on success.
The simplified version of the coccinelle semantic patch that
fixes this issue is as follows:

// <smpl>
@@
expression E; identifier pr; expression list es;
@@
for(...;...;...){
...
-	if (E) break;
+	if (E){
+		pr(es);
+		break;
+	}
...
}
- if(E) pr(es);
// </smpl>

Untested.

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
Changes from V1:
 - Replaced break with a return
 - Return 0 instead of ret on success

 tools/power/cpupower/utils/cpufreq-set.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/power/cpupower/utils/cpufreq-set.c b/tools/power/cpupower/utils/cpufreq-set.c
index a416de8..f656e58 100644
--- a/tools/power/cpupower/utils/cpufreq-set.c
+++ b/tools/power/cpupower/utils/cpufreq-set.c
@@ -320,12 +320,11 @@ int cmd_freq_set(int argc, char **argv)
 
 		printf(_("Setting cpu: %d\n"), cpu);
 		ret = do_one_cpu(cpu, &new_pol, freq, policychange);
-		if (ret)
-			break;
+		if (ret) {
+			print_error();
+			return ret;
+		}
 	}
 
-	if (ret)
-		print_error();
-
-	return ret;
+	return 0;
 }
