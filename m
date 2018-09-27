From: Colin King <colin.king@canonical.com>
Date: Thu, 27 Sep 2018 22:47:00 +0000
Subject: [PATCH] tracing: fix potential null pointer dereference on rctr_end
Message-Id: <20180927224700.13739-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently rctr_end may assigned null if strchr() fails leading to
a null pointer dereference in the following check on *(rctr_end + 1).
Fix this by also adding a null pointer check before the dereference.

Detected by CoverityScan, CID#1473700 ("Dereference null return value")

Fixes: 1cc33161a83d ("uprobes: Support SDT markers having reference count (semaphore)")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/trace/trace_uprobe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index 3a7c73c40007..c5514651e61f 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -477,7 +477,7 @@ static int create_trace_uprobe(int argc, char **argv)
 	rctr = strchr(arg, '(');
 	if (rctr) {
 		rctr_end = strchr(rctr, ')');
-		if (rctr > rctr_end || *(rctr_end + 1) != 0) {
+		if (!rctr_end || rctr > rctr_end || *(rctr_end + 1) != 0) {
 			ret = -EINVAL;
 			pr_info("Invalid reference counter offset.\n");
 			goto fail_address_parse;
-- 
2.17.1
