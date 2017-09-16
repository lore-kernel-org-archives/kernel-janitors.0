From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 16 Sep 2017 06:09:36 +0000
Subject: [PATCH] perf kmem: Perform some cleanup if '--time' is given an invalid value
Message-Id: <20170916060936.28199-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, alexander.shishkin@linux.intel.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If the string passed in '--time' is invalid, we must do some cleanup
before leaving. As in the other error handling paths of this function.

Fixes: 2a865bd8dddd ("perf kmem: Add option to specify time window of interest")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 tools/perf/builtin-kmem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/builtin-kmem.c b/tools/perf/builtin-kmem.c
index 24ee68ecdd42..d8f25ef8157b 100644
--- a/tools/perf/builtin-kmem.c
+++ b/tools/perf/builtin-kmem.c
@@ -1983,7 +1983,8 @@ int cmd_kmem(int argc, const char **argv)
 
 	if (perf_time__parse_str(&ptime, time_str) != 0) {
 		pr_err("Invalid time string\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_delete;
 	}
 
 	if (!strcmp(argv[0], "stat")) {
-- 
2.11.0

