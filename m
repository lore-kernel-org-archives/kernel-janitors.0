From: "tip-bot2 for Christophe JAILLET" <tip-bot2@linutronix.de>
Date: Sat, 04 Apr 2020 08:41:53 +0000
Subject: [tip: perf/urgent] perf cpumap: Fix snprintf overflow check
Message-Id: <158598971346.28353.11677112853050770868.tip-bot2@tip-bot2>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200324070319.10901-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200324070319.10901-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-tip-commits@vger.kernel.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, David Laight <David.Laight@ACULAB.COM>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Don Zickus <dzickus@redhat.com>, He Zhe <zhe.he@windriver.com>, Jan Stancek <jstancek@redhat.com>, Jiri Olsa <jolsa@redhat.com>, Kan Liang <kan.liang@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <peterz@infradead.org>, kernel-janitors@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     d74b181a028bb5a468f0c609553eff6a8fdf4887
Gitweb:        https://git.kernel.org/tip/d74b181a028bb5a468f0c609553eff6a8fdf4887
Author:        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
AuthorDate:    Tue, 24 Mar 2020 08:03:19 +01:00
Committer:     Arnaldo Carvalho de Melo <acme@redhat.com>
CommitterDate: Tue, 24 Mar 2020 10:36:00 -03:00

perf cpumap: Fix snprintf overflow check

'snprintf' returns the number of characters which would be generated for
the given input.

If the returned value is *greater than* or equal to the buffer size, it
means that the output has been truncated.

Fix the overflow test accordingly.

Fixes: 7780c25bae59f ("perf tools: Allow ability to map cpus to nodes easily")
Fixes: 92a7e1278005b ("perf cpumap: Add cpu__max_present_cpu()")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Suggested-by: David Laight <David.Laight@ACULAB.COM>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Don Zickus <dzickus@redhat.com>
Cc: He Zhe <zhe.he@windriver.com>
Cc: Jan Stancek <jstancek@redhat.com>
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: kernel-janitors@vger.kernel.org
Link: http://lore.kernel.org/lkml/20200324070319.10901-1-christophe.jaillet@wanadoo.fr
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/util/cpumap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/cpumap.c b/tools/perf/util/cpumap.c
index 983b738..dc5c5e6 100644
--- a/tools/perf/util/cpumap.c
+++ b/tools/perf/util/cpumap.c
@@ -317,7 +317,7 @@ static void set_max_cpu_num(void)
 
 	/* get the highest possible cpu number for a sparse allocation */
 	ret = snprintf(path, PATH_MAX, "%s/devices/system/cpu/possible", mnt);
-	if (ret = PATH_MAX) {
+	if (ret >= PATH_MAX) {
 		pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
 		goto out;
 	}
@@ -328,7 +328,7 @@ static void set_max_cpu_num(void)
 
 	/* get the highest present cpu number for a sparse allocation */
 	ret = snprintf(path, PATH_MAX, "%s/devices/system/cpu/present", mnt);
-	if (ret = PATH_MAX) {
+	if (ret >= PATH_MAX) {
 		pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
 		goto out;
 	}
@@ -356,7 +356,7 @@ static void set_max_node_num(void)
 
 	/* get the highest possible cpu number for a sparse allocation */
 	ret = snprintf(path, PATH_MAX, "%s/devices/system/node/possible", mnt);
-	if (ret = PATH_MAX) {
+	if (ret >= PATH_MAX) {
 		pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
 		goto out;
 	}
@@ -441,7 +441,7 @@ int cpu__setup_cpunode_map(void)
 		return 0;
 
 	n = snprintf(path, PATH_MAX, "%s/devices/system/node", mnt);
-	if (n = PATH_MAX) {
+	if (n >= PATH_MAX) {
 		pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
 		return -1;
 	}
@@ -456,7 +456,7 @@ int cpu__setup_cpunode_map(void)
 			continue;
 
 		n = snprintf(buf, PATH_MAX, "%s/%s", path, dent1->d_name);
-		if (n = PATH_MAX) {
+		if (n >= PATH_MAX) {
 			pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
 			continue;
 		}
