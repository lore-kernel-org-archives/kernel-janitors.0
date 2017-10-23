From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Mon, 23 Oct 2017 23:47:33 +0000
Subject: [PATCH 21/24] perf script: Fix error handling path
Message-Id: <20171023234736.5335-22-acme@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171023234736.5335-1-acme@kernel.org>
In-Reply-To: <20171023234736.5335-1-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, kernel-janitors@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If the string passed in '--time' is invalid, or if failed to set
libtraceevent function resolver, we must do some cleanup before leaving.
As in the other error handling paths of this function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: kernel-janitors@vger.kernel.org
Link: http://lkml.kernel.org/r/20170916062537.28921-1-christophe.jaillet@wanadoo.fr
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/builtin-script.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index 3e83f4735b21..a3add2cd7856 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -3074,7 +3074,8 @@ int cmd_script(int argc, const char **argv)
 					 machine__resolve_kernel_addr,
 					 &session->machines.host) < 0) {
 		pr_err("%s: failed to set libtraceevent function resolver\n", __func__);
-		return -1;
+		err = -1;
+		goto out_delete;
 	}
 
 	if (generate_script_lang) {
@@ -3134,7 +3135,8 @@ int cmd_script(int argc, const char **argv)
 	/* needs to be parsed after looking up reference time */
 	if (perf_time__parse_str(&script.ptime, script.time_str) != 0) {
 		pr_err("Invalid time string\n");
-		return -EINVAL;
+		err = -EINVAL;
+		goto out_delete;
 	}
 
 	err = __cmd_script(&script);
-- 
2.13.6

