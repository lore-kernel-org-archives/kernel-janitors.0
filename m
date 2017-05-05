From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 May 2017 21:04:29 +0000
Subject: [PATCH 4/7] kernel-trace: Improve a size determination in create_hist_field()
Message-Id: <8b0724f4-18aa-c31d-8969-883816efbd2b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
In-Reply-To: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 May 2017 20:15:46 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/trace/trace_events_hist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 36412deac24c..a75223572374 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -353,7 +353,7 @@ static struct hist_field *create_hist_field(struct ftrace_event_field *field,
 	if (field && is_function_field(field))
 		return NULL;
 
-	hist_field = kzalloc(sizeof(struct hist_field), GFP_KERNEL);
+	hist_field = kzalloc(sizeof(*hist_field), GFP_KERNEL);
 	if (!hist_field)
 		return NULL;
 
-- 
2.12.2

