From: Dan Carpenter <error27@gmail.com>
Date: Fri, 26 Aug 2011 09:19:31 +0000
Subject: [patch 1/2] jbd2: remove an unneeded NULL check
Message-Id: <20110826091931.GM5975@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: "open list:JOURNALLING LAYER..." <linux-ext4@vger.kernel.org>, kernel-janitors@vger.kernel.org

We dereference "transaction" at the start of the function so the NULL
check isn't needed here.  It's not harmful, but it silences a static
checker warning when we remove this.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/jbd2/transaction.c b/fs/jbd2/transaction.c
index a242f6f..8d7013c 100644
--- a/fs/jbd2/transaction.c
+++ b/fs/jbd2/transaction.c
@@ -1143,8 +1143,7 @@ int jbd2_journal_dirty_metadata(handle_t *handle, struct buffer_head *bh)
 			       jh->b_next_transaction,
 			       jh->b_next_transaction ?
 			         jh->b_next_transaction->t_tid : 0,
-			       transaction,
-			       transaction ? transaction->t_tid : 0);
+			       transaction, transaction->t_tid);
 			BUG_ON(1);
 		}
 		/* And this case is illegal: we can't reuse another
