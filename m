From: Colin King <colin.king@canonical.com>
Date: Wed, 14 Mar 2018 17:33:54 +0000
Subject: [PATCH][next] perf tests: fix out of bounds access on array fd when cnt is 100
Message-Id: <20180314173354.11250-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when cnt is 100 an array bounds overflow occurs on the assignment
of fd[cnt]. Fix this by performing the bounds check on cnt before writing
to fd.

Detected by cppcheck:
tools/perf/tests/bp_account.c:115: (warning) Either the condition
'cnt=100' is redundant or the array 'fd[100]' is accessed at index 100,
which is out of bounds.

Fixes: 032db28e5fa3 ("perf tests: Add breakpoint accounting/modify test")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/perf/tests/bp_account.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tools/perf/tests/bp_account.c b/tools/perf/tests/bp_account.c
index 2f75fa0c4fef..9e88d7608951 100644
--- a/tools/perf/tests/bp_account.c
+++ b/tools/perf/tests/bp_account.c
@@ -107,16 +107,14 @@ static int detect_cnt(bool is_x)
 	int fd[100], cnt = 0, i;
 
 	while (1) {
-		fd[cnt] = __event(is_x, addr, &attr);
-
-		if (fd[cnt] < 0)
-			break;
-
 		if (cnt = 100) {
 			pr_debug("way too many debug registers, fix the test\n");
 			return 0;
 		}
+		fd[cnt] = __event(is_x, addr, &attr);
 
+		if (fd[cnt] < 0)
+			break;
 		cnt++;
 	}
 
-- 
2.15.1

