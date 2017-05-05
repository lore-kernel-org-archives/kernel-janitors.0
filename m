From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 May 2017 21:09:30 +0000
Subject: [PATCH 6/7] kernel-trace: Adjust two checks for null pointers in uprobe_buffer_init()
Message-Id: <b0ef0720-4ba4-1281-395f-e6ce639873d2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
In-Reply-To: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 May 2017 22:30:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/trace/trace_uprobe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index 3e662d7ea6a4..e9c1865f7397 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -705,13 +705,13 @@ static int uprobe_buffer_init(void)
 	int cpu, err_cpu;
 
 	uprobe_cpu_buffer = alloc_percpu(struct uprobe_cpu_buffer);
-	if (uprobe_cpu_buffer = NULL)
+	if (!uprobe_cpu_buffer)
 		return -ENOMEM;
 
 	for_each_possible_cpu(cpu) {
 		struct page *p = alloc_pages_node(cpu_to_node(cpu),
 						  GFP_KERNEL, 0);
-		if (p = NULL) {
+		if (!p) {
 			err_cpu = cpu;
 			goto err;
 		}
-- 
2.12.2

