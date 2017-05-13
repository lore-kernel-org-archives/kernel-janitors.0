From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 May 2017 16:35:14 +0000
Subject: [PATCH 2/2] oprofile_perf: Delete error messages for a failed memory allocation in oprofile_perf_ini
Message-Id: <bcb24b7d-f046-63e2-7f17-49fcbc838353@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8e408a15-7884-e9a1-0df2-a7419987c450@users.sourceforge.net>
In-Reply-To: <8e408a15-7884-e9a1-0df2-a7419987c450@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oprofile-list@lists.sf.net, Robert Richter <rric@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 May 2017 18:08:07 +0200

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/oprofile/oprofile_perf.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/oprofile/oprofile_perf.c b/drivers/oprofile/oprofile_perf.c
index 033f2c26f2ad..6de27b90b562 100644
--- a/drivers/oprofile/oprofile_perf.c
+++ b/drivers/oprofile/oprofile_perf.c
@@ -291,5 +291,3 @@ int __init oprofile_perf_init(struct oprofile_operations *ops)
-		pr_info("oprofile: failed to allocate %d "
-				"counters\n", num_counters);
 		ret = -ENOMEM;
 		num_counters = 0;
 		goto out;
@@ -299,8 +297,6 @@ int __init oprofile_perf_init(struct oprofile_operations *ops)
 		per_cpu(perf_events, cpu) = kcalloc(num_counters,
 				sizeof(struct perf_event *), GFP_KERNEL);
 		if (!per_cpu(perf_events, cpu)) {
-			pr_info("oprofile: failed to allocate %d perf events "
-					"for cpu %d\n", num_counters, cpu);
 			ret = -ENOMEM;
 			goto out;
 		}
-- 
2.12.3

