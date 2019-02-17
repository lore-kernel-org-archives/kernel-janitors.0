From: Colin King <colin.king@canonical.com>
Date: Sun, 17 Feb 2019 22:32:22 +0000
Subject: [PATCH] tracing: fix spelling mistake: "analagous" -> "analogous"
Message-Id: <20190217223222.16479-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the mini-howto help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/trace/trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index f380139e972c..4dd8a52a71e0 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -4740,7 +4740,7 @@ static const char readme_msg[]  	"\t    unchanged.\n\n"
 	"\t    The enable_hist and disable_hist triggers can be used to\n"
 	"\t    have one event conditionally start and stop another event's\n"
-	"\t    already-attached hist trigger.  The syntax is analagous to\n"
+	"\t    already-attached hist trigger.  The syntax is analogous to\n"
 	"\t    the enable_event and disable_event triggers.\n"
 #endif
 ;
-- 
2.20.1
