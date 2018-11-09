From: Colin King <colin.king@canonical.com>
Date: Fri, 09 Nov 2018 13:23:12 +0000
Subject: [PATCH] tracing: clean an indentation issue, remove extraneous spaces
Message-Id: <20181109132312.20994-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up an indentation issue, a whole chunk of code
has an extra space in the indentation.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/trace/trace_events_filter.c | 48 +++++++++++++++---------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 84a65173b1e9..86b237215952 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1205,30 +1205,30 @@ static int parse_pred(const char *str, void *data,
 		 * (perf doesn't use it) and grab everything.
 		 */
 		if (strcmp(field->name, "ip") != 0) {
-			 parse_error(pe, FILT_ERR_IP_FIELD_ONLY, pos + i);
-			 goto err_free;
-		 }
-		 pred->fn = filter_pred_none;
-
-		 /*
-		  * Quotes are not required, but if they exist then we need
-		  * to read them till we hit a matching one.
-		  */
-		 if (str[i] = '\'' || str[i] = '"')
-			 q = str[i];
-		 else
-			 q = 0;
-
-		 for (i++; str[i]; i++) {
-			 if (q && str[i] = q)
-				 break;
-			 if (!q && (str[i] = ')' || str[i] = '&' ||
-				    str[i] = '|'))
-				 break;
-		 }
-		 /* Skip quotes */
-		 if (q)
-			 s++;
+			parse_error(pe, FILT_ERR_IP_FIELD_ONLY, pos + i);
+			goto err_free;
+		}
+		pred->fn = filter_pred_none;
+
+		/*
+		 * Quotes are not required, but if they exist then we need
+		 * to read them till we hit a matching one.
+		 */
+		if (str[i] = '\'' || str[i] = '"')
+			q = str[i];
+		else
+			q = 0;
+
+		for (i++; str[i]; i++) {
+			if (q && str[i] = q)
+				break;
+			if (!q && (str[i] = ')' || str[i] = '&' ||
+				   str[i] = '|'))
+				break;
+		}
+		/* Skip quotes */
+		if (q)
+			s++;
 		len = i - s;
 		if (len >= MAX_FILTER_STR_VAL) {
 			parse_error(pe, FILT_ERR_OPERAND_TOO_LONG, pos + i);
-- 
2.19.1
