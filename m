From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Nov 2019 09:12:52 +0000
Subject: [PATCH] locking/lockdep: update the comment for __lock_release()
Message-Id: <20191104091252.GA31509@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This changes "to the list" to "from the list" and also deletes the
obsolete comment about the "@nested" argument.  The "nested" argument
was removed in commit 5facae4f3549 ("locking/lockdep: Remove unused
@nested argument from lock_release()").

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 kernel/locking/lockdep.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 8123518f9045..32282e7112d3 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -4208,11 +4208,9 @@ static int __lock_downgrade(struct lockdep_map *lock, unsigned long ip)
 }
 
 /*
- * Remove the lock to the list of currently held locks - this gets
+ * Remove the lock from the list of currently held locks - this gets
  * called on mutex_unlock()/spin_unlock*() (or on a failed
  * mutex_lock_interruptible()).
- *
- * @nested is an hysterical artifact, needs a tree wide cleanup.
  */
 static int
 __lock_release(struct lockdep_map *lock, unsigned long ip)
-- 
2.20.1
