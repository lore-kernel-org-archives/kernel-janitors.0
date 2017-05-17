From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 17 May 2017 19:44:46 +0000
Subject: rcu: Call mod_timer() correctly in wake_nocb_leader_defer()
Message-Id: <20170517194446.yz42z4wwrplbngxn@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains that:

	kernel/rcu/tree_plugin.h:1838 wake_nocb_leader_defer()
	warn: mod_timer() takes an absolute time not an offset.

which is true.

Fixes: ebf7068a4396 ("rcu: Use timer as backstop for NOCB deferred wakeups")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
index 34dbd0aad732..74492f20c252 100644
--- a/kernel/rcu/tree_plugin.h
+++ b/kernel/rcu/tree_plugin.h
@@ -1835,7 +1835,7 @@ static void wake_nocb_leader_defer(struct rcu_data *rdp, int waketype,
 	trace_rcu_nocb_wake(rdp->rsp->name, rdp->cpu, reason);
 	raw_spin_unlock_irqrestore(&rdp->nocb_lock, flags);
 	if (needtimer)
-		mod_timer(&rdp->nocb_timer, 1);
+		mod_timer(&rdp->nocb_timer, jiffies + 1);
 }
 
 /*
