From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Jan 2017 15:26:24 +0000
Subject: [PATCH 4/4] perf strlist: Move an error code assignment in strlist__parse_list_entry()
Message-Id: <2200b6ba-7284-285b-0fb7-60688f5871b3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c8eebdee-ad45-c2a8-9a4d-e1032ec9a17f@users.sourceforge.net>
In-Reply-To: <c8eebdee-ad45-c2a8-9a4d-e1032ec9a17f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, He Kuang <hekuang@huawei.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Milian Wolff <milian.wolff@kdab.com>, Peter Zijlstra <peterz@infradead.org>, Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>, Wang Nan <wangnan0@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Jan 2017 15:56:31 +0100

A local variable was set to an error code before a concrete error situation
was detected. Thus move the corresponding assignment into an if branch
to indicate a software failure there.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 tools/perf/util/strlist.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/strlist.c b/tools/perf/util/strlist.c
index 0d3dfcb919b4..a934be385a6d 100644
--- a/tools/perf/util/strlist.c
+++ b/tools/perf/util/strlist.c
@@ -118,9 +118,10 @@ static int strlist__parse_list_entry(struct strlist *slist, const char *s,
 		return strlist__load(slist, s + 7);
 
 	if (subst_dir) {
-		err = -ENOMEM;
-		if (asprintf(&subst, "%s/%s", subst_dir, s) < 0)
+		if (asprintf(&subst, "%s/%s", subst_dir, s) < 0) {
+			err = -ENOMEM;
 			goto out;
+		}
 
 		if (access(subst, F_OK) = 0) {
 			err = strlist__load(slist, subst);
-- 
2.11.0

