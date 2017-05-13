From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 May 2017 16:33:42 +0000
Subject: [PATCH 1/2] oprofile_perf: Improve a size determination in oprofile_perf_init()
Message-Id: <0fc2061c-a358-b158-898f-5aa6325cfe02@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8e408a15-7884-e9a1-0df2-a7419987c450@users.sourceforge.net>
In-Reply-To: <8e408a15-7884-e9a1-0df2-a7419987c450@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oprofile-list@lists.sf.net, Robert Richter <rric@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 May 2017 18:00:13 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/oprofile/oprofile_perf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/oprofile/oprofile_perf.c b/drivers/oprofile/oprofile_perf.c
index d5b2732b1b81..033f2c26f2ad 100644
--- a/drivers/oprofile/oprofile_perf.c
+++ b/drivers/oprofile/oprofile_perf.c
@@ -285,7 +285,6 @@ int __init oprofile_perf_init(struct oprofile_operations *ops)
 		goto out;
 	}
 
-	counter_config = kcalloc(num_counters,
-			sizeof(struct op_counter_config), GFP_KERNEL);
-
+	counter_config = kcalloc(num_counters, sizeof(*counter_config),
+				 GFP_KERNEL);
 	if (!counter_config) {
-- 
2.12.3

