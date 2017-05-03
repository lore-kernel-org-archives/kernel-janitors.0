From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 May 2017 20:39:53 +0000
Subject: [PATCH 4/6] lockdep: Combine two seq_printf() calls into one call in l_show()
Message-Id: <e93293e4-ca8c-a1a3-e098-ff9d80a91186@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3f95acb5-c037-b6fa-7a9b-258b4ae465fb@users.sourceforge.net>
In-Reply-To: <3f95acb5-c037-b6fa-7a9b-258b4ae465fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 May 2017 21:56:11 +0200

A bit of data was put into a sequence by two separate function calls.
Print the same data by a single function call instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/locking/lockdep_proc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index a353f53b6de6..2cc0ccd2b3de 100644
--- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -75,7 +75,5 @@ static int l_show(struct seq_file *m, void *v)
 #endif
 
 	get_usage_chars(class, usage);
-	seq_printf(m, " %s", usage);
-
-	seq_printf(m, ": ");
+	seq_printf(m, " %s: ", usage);
 	print_name(m, class);
-- 
2.12.2

