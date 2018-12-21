From: Colin King <colin.king@canonical.com>
Date: Fri, 21 Dec 2018 08:48:09 +0000
Subject: [PATCH][next] perf trace: use correct SECCOMP prefix spelling, "SECOMP_*" -> "SECCOMP_*"
Message-Id: <20181221084809.6108-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The spelling of the SECCOMP is incorrect, fix these.

Fixes: c65c83ffe904 ("perf trace: Allow asking for not suppressing common string prefixes")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/perf/trace/beauty/seccomp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/trace/beauty/seccomp.c b/tools/perf/trace/beauty/seccomp.c
index 4600c28a3cfe..637722e2796b 100644
--- a/tools/perf/trace/beauty/seccomp.c
+++ b/tools/perf/trace/beauty/seccomp.c
@@ -9,7 +9,7 @@
 static size_t syscall_arg__scnprintf_seccomp_op(char *bf, size_t size, struct syscall_arg *arg)
 {
 	bool show_prefix = arg->show_string_prefix;
-	const char *prefix = "SECOMP_SET_MODE_";
+	const char *prefix = "SECCOMP_SET_MODE_";
 	int op = arg->val;
 	size_t printed = 0;
 
@@ -34,7 +34,7 @@ static size_t syscall_arg__scnprintf_seccomp_flags(char *bf, size_t size,
 						   struct syscall_arg *arg)
 {
 	bool show_prefix = arg->show_string_prefix;
-	const char *prefix = "SECOMP_FILTER_FLAG_";
+	const char *prefix = "SECCOMP_FILTER_FLAG_";
 	int printed = 0, flags = arg->val;
 
 #define	P_FLAG(n) \
-- 
2.19.1
