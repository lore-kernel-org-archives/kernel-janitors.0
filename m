From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 May 2017 20:40:51 +0000
Subject: [PATCH 5/6] lockdep: Improve a size determination in lock_stat_open()
Message-Id: <d8ceba55-646a-e0ac-1c1a-8178b79d3200@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3f95acb5-c037-b6fa-7a9b-258b4ae465fb@users.sourceforge.net>
In-Reply-To: <3f95acb5-c037-b6fa-7a9b-258b4ae465fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 May 2017 22:05:57 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/locking/lockdep_proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index 2cc0ccd2b3de..509a17f5ea01 100644
--- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -607,7 +607,7 @@ static int lock_stat_open(struct inode *inode, struct file *file)
 {
 	int res;
 	struct lock_class *class;
-	struct lock_stat_seq *data = vmalloc(sizeof(struct lock_stat_seq));
+	struct lock_stat_seq *data = vmalloc(sizeof(*data));
 
 	if (!data)
 		return -ENOMEM;
-- 
2.12.2

