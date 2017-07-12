From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Jul 2017 07:35:57 +0000
Subject: [PATCH 2/2] ftrace: silence uninitialized variable warning
Message-Id: <20170712073556.h6tkpjcdzjaozozs@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20170712073340.4enzeojeoupuds5a@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that if "func" is NULL then "clear_filter"
is uninitialized.  This seems like it could be true, although it's
possible something subtle is happening that I haven't seen.

    kernel/trace/ftrace.c:3844 match_records()
    error: uninitialized symbol 'clear_filter'.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
It does occur to me that I could initialize it to 1 instead of 0 but my
guess is that zero is intended.  Please review this one carefully.

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 2a3c45743f54..5e658da91912 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3816,7 +3816,7 @@ match_records(struct ftrace_hash *hash, char *func, int len, char *mod)
 	int exclude_mod = 0;
 	int found = 0;
 	int ret;
-	int clear_filter;
+	int clear_filter = 0;
 
 	if (func) {
 		func_g.type = filter_parse_regex(func, len, &func_g.search,
