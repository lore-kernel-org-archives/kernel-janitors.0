From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Aug 2017 09:36:01 +0000
Subject: [PATCH 2/2] kmemleak: Use seq_puts() in print_unreferenced()
Message-Id: <b764965b-1d80-83c6-72f0-7b64d1036168@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <301bc8c9-d9f6-87be-ce1d-dc614e82b45b@users.sourceforge.net>
In-Reply-To: <301bc8c9-d9f6-87be-ce1d-dc614e82b45b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Aug 2017 11:23:11 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: Prefer seq_puts to seq_printf

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 mm/kmemleak.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index c6c798d90b2e..cfac550d4d00 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -373,7 +373,7 @@ static void print_unreferenced(struct seq_file *seq,
 		   object->comm, object->pid, object->jiffies,
 		   msecs_age / 1000, msecs_age % 1000);
 	hex_dump_object(seq, object);
-	seq_printf(seq, "  backtrace:\n");
+	seq_puts(seq, "  backtrace:\n");
 
 	for (i = 0; i < object->trace_len; i++) {
 		void *ptr = (void *)object->trace[i];
-- 
2.14.0

