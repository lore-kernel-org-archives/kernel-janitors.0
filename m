From: Colin King <colin.king@canonical.com>
Date: Mon, 27 Nov 2017 16:19:09 +0000
Subject: [PATCH] tools lib traceevent: fix an incorrect comparison with the literal "s64"
Message-Id: <20171127161909.15565-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaldo Carvalho de Melo <acme@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, "David S . Miller" <davem@davemloft.net>, Daniel Borkmann <daniel@iogearbox.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

I believe the comparison of the string 'type' with the literal string
"s64" is currently incorrect, it is missing a = 0 comparison as per
the other comparisons.

Detected by cppcheck:
tools/lib/traceevent/event-parse.c:2209: (warning) The comparison
operator in 'strcmp(type,"s64") != 0' should maybe be '=' instead,
currently the expression 'strcmp(type,"u64") = 0' is redundant.

Fixes: f7d82350e597 ("tools/events: Add files to create libtraceevent.a")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/lib/traceevent/event-parse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/traceevent/event-parse.c b/tools/lib/traceevent/event-parse.c
index 7ce724fc0544..82b6c64c5b39 100644
--- a/tools/lib/traceevent/event-parse.c
+++ b/tools/lib/traceevent/event-parse.c
@@ -2206,7 +2206,7 @@ eval_type_str(unsigned long long val, const char *type, int pointer)
 		return val & 0xffffffff;
 
 	if (strcmp(type, "u64") = 0 ||
-	    strcmp(type, "s64"))
+	    strcmp(type, "s64") = 0)
 		return val;
 
 	if (strcmp(type, "s8") = 0)
-- 
2.14.1

