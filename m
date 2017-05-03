From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 May 2017 20:37:53 +0000
Subject: [PATCH 2/6] lockdep: Use seq_putc() in seq_header()
Message-Id: <49523826-875c-fcc7-9b47-40f3816136f4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3f95acb5-c037-b6fa-7a9b-258b4ae465fb@users.sourceforge.net>
In-Reply-To: <3f95acb5-c037-b6fa-7a9b-258b4ae465fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 May 2017 21:30:26 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/locking/lockdep_proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index 825496ece766..b1fa2ae31c0b 100644
--- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -560,7 +560,7 @@ static void seq_header(struct seq_file *m)
 			"holdtime-total",
 			"holdtime-avg");
 	seq_line(m, '-', 0, 40 + 1 + 12 * (14 + 1));
-	seq_printf(m, "\n");
+	seq_putc(m, '\n');
 }
 
 static void *ls_start(struct seq_file *m, loff_t *pos)
-- 
2.12.2

