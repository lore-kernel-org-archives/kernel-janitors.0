From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 16 Sep 2017 06:25:37 +0000
Subject: [PATCH] perf script: Fix error handling path
Message-Id: <20170916062537.28921-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, alexander.shishkin@linux.intel.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If the string passed in '--time' is invalid, or if failed to set
libtraceevent function resolver, we must do some cleanup before leaving.
As in the other error handling paths of this function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 tools/perf/builtin-script.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index 378f76cdf923..78ffdb4cbdea 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -3004,7 +3004,8 @@ int cmd_script(int argc, const char **argv)
 					 machine__resolve_kernel_addr,
 					 &session->machines.host) < 0) {
 		pr_err("%s: failed to set libtraceevent function resolver\n", __func__);
-		return -1;
+		err = -1;
+		goto out_delete;
 	}
 
 	if (generate_script_lang) {
@@ -3064,7 +3065,8 @@ int cmd_script(int argc, const char **argv)
 	/* needs to be parsed after looking up reference time */
 	if (perf_time__parse_str(&script.ptime, script.time_str) != 0) {
 		pr_err("Invalid time string\n");
-		return -EINVAL;
+		err = -EINVAL;
+		goto out_delete;
 	}
 
 	err = __cmd_script(&script);
-- 
2.11.0

