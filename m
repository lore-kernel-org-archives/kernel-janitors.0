From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 May 2017 21:05:34 +0000
Subject: [PATCH 5/7] kernel-trace: Replace two seq_printf() calls by seq_puts() in probes_seq_show()
Message-Id: <87adfa77-5558-43b6-70ff-fcbde24f9002@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
In-Reply-To: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 May 2017 20:30:05 +0200

Two strings which did not contain data format specifications should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/trace/trace_uprobe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index a7581fec9681..3e662d7ea6a4 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -612,11 +612,11 @@ static int probes_seq_show(struct seq_file *m, void *v)
 	} else {
 		switch (sizeof(void *)) {
 		case 4:
-			seq_printf(m, "0x00000000");
+			seq_puts(m, "0x00000000");
 			break;
 		case 8:
 		default:
-			seq_printf(m, "0x0000000000000000");
+			seq_puts(m, "0x0000000000000000");
 			break;
 		}
 	}
-- 
2.12.2

