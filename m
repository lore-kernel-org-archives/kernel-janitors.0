From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 May 2017 21:10:51 +0000
Subject: [PATCH 7/7] kernel-trace: Delete an error message for a failed memory allocation in create_trace_upr
Message-Id: <74587923-6261-8177-bff3-57cff57b8e87@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
In-Reply-To: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 May 2017 22:38:51 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: Possible unnecessary 'out of memory' message

Thus remove such a statement here.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/trace/trace_uprobe.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index e9c1865f7397..d19fa2a6cc7b 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -490,9 +490,7 @@ static int create_trace_uprobe(int argc, char **argv)
 	tu->offset = offset;
 	tu->inode = inode;
 	tu->filename = kstrdup(filename, GFP_KERNEL);
-
 	if (!tu->filename) {
-		pr_info("Failed to allocate filename.\n");
 		ret = -ENOMEM;
 		goto error;
 	}
-- 
2.12.2

