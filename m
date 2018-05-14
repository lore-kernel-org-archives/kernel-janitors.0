From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Date: Mon, 14 May 2018 16:46:02 +0000
Subject: Re: [bug report] rcu: Diagnostics for grace-period hangs
Message-Id: <20180514164602.GY26088@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180514124503.GA8398@mwanda>
In-Reply-To: <20180514124503.GA8398@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, May 14, 2018 at 03:45:03PM +0300, Dan Carpenter wrote:
> Hello Paul E. McKenney,
> 
> The patch e2ba0f065aec: "rcu: Diagnostics for grace-period hangs"
> from Apr 21, 2018, leads to the following static checker warning:
> 
> 	kernel/rcu/tree.c:2739 rcu_check_gp_start_stall()
> 	error: double lock 'irqsave:flags'
> 
> kernel/rcu/tree.c
>   2726  
>   2727          raw_spin_lock_irqsave_rcu_node(rnp, flags);
>   2728          j = jiffies;
>   2729          if (rcu_gp_in_progress(rsp) ||
>   2730              ULONG_CMP_GE(rnp_root->gp_seq, rnp_root->gp_seq_needed) ||
>   2731              time_before(j, READ_ONCE(rsp->gp_req_activity) + HZ) ||
>   2732              time_before(j, READ_ONCE(rsp->gp_activity) + HZ) ||
>   2733              atomic_read(&warned)) {
>   2734                  raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
>   2735                  return;
>   2736          }
>   2737          /* Hold onto the leaf lock to make others see warned=1. */
>   2738  
>   2739          raw_spin_lock_irqsave_rcu_node(rnp_root, flags);
> 
> Saving irqsave is not nestable.  The second save overwrites the first so
> that IRQs can't be re-enabled.
> 
>   2740          j = jiffies;
>   2741          if (rcu_gp_in_progress(rsp) ||
>   2742              ULONG_CMP_GE(rnp_root->gp_seq, rnp_root->gp_seq_needed) ||
>   2743              time_before(j, rsp->gp_req_activity + HZ) ||
>   2744              time_before(j, rsp->gp_activity + HZ) ||
>   2745              atomic_xchg(&warned, 1)) {
>   2746                  raw_spin_unlock_irqrestore_rcu_node(rnp_root, flags);
>   2747                  raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
>   2748                  return;
>   2749          }
>   2750          pr_alert("%s: g%ld->%ld gar:%lu ga:%lu f%#x %s->state:%#lx\n",
>   2751                   __func__, (long)READ_ONCE(rsp->gp_seq),
>   2752                   (long)READ_ONCE(rnp_root->gp_seq_needed),
>   2753                   j - rsp->gp_req_activity, j - rsp->gp_activity,
>   2754                   rsp->gp_flags, rsp->name,
>   2755                   rsp->gp_kthread ? rsp->gp_kthread->state : 0x1ffffL);
>   2756          WARN_ON(1);
>   2757          raw_spin_unlock_irqrestore_rcu_node(rnp_root, flags);
>   2758          raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
>   2759  }

Good catch!!!  And since this is all dead code unless there is a bug in
RCU (or a very long delay, perhaps due to vCPU preemption), it might
well have been a good long time before testing exposed this one, so
even better!

How about the (untested) patch shown below?

							Thanx, Paul

-------------------------------------------------------------------------

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 9ad931bff409..3ffcd96017b6 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -2738,14 +2738,14 @@ rcu_check_gp_start_stall(struct rcu_state *rsp, struct rcu_node *rnp,
 	}
 	/* Hold onto the leaf lock to make others see warned=1. */
 
-	raw_spin_lock_irqsave_rcu_node(rnp_root, flags);
+	raw_spin_lock_rcu_node(rnp_root); /* irqs already disabled. */
 	j = jiffies;
 	if (rcu_gp_in_progress(rsp) ||
 	    ULONG_CMP_GE(rnp_root->gp_seq, rnp_root->gp_seq_needed) ||
 	    time_before(j, rsp->gp_req_activity + HZ) ||
 	    time_before(j, rsp->gp_activity + HZ) ||
 	    atomic_xchg(&warned, 1)) {
-		raw_spin_unlock_irqrestore_rcu_node(rnp_root, flags);
+		raw_spin_unlock_rcu_node(rnp_root); /* irqs remain disabled. */
 		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 		return;
 	}
@@ -2756,7 +2756,7 @@ rcu_check_gp_start_stall(struct rcu_state *rsp, struct rcu_node *rnp,
 		 rsp->gp_flags, rsp->name,
 		 rsp->gp_kthread ? rsp->gp_kthread->state : 0x1ffffL);
 	WARN_ON(1);
-	raw_spin_unlock_irqrestore_rcu_node(rnp_root, flags);
+	raw_spin_unlock_rcu_node(rnp_root);
 	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 }
 

