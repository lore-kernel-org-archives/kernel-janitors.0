From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Sep 2019 14:26:34 +0000
Subject: [PATCH] rcu/nocb: Fix uninitialized variable in nocb_gp_wait()
Message-Id: <20190923142634.GC31251@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, rcu@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We never set this to false.  This probably doesn't affect most people's
runtime because GCC will automatically initialize it to false at certain
common optimization levels.  But that behavior is related to a bug in
GCC and obviously should not be relied on.

Fixes: 5d6742b37727 ("rcu/nocb: Use rcu_segcblist for no-CBs CPUs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 kernel/rcu/tree_plugin.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
index 2defc7fe74c3..fa08d55f7040 100644
--- a/kernel/rcu/tree_plugin.h
+++ b/kernel/rcu/tree_plugin.h
@@ -1946,7 +1946,7 @@ static void nocb_gp_wait(struct rcu_data *my_rdp)
 	int __maybe_unused cpu = my_rdp->cpu;
 	unsigned long cur_gp_seq;
 	unsigned long flags;
-	bool gotcbs;
+	bool gotcbs = false;
 	unsigned long j = jiffies;
 	bool needwait_gp = false; // This prevents actual uninitialized use.
 	bool needwake;
-- 
2.20.1
