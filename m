From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Date: Thu, 19 Nov 2015 21:18:52 +0000
Subject: Re: [patch -next] rcu: off by one in gp_state_getname()
Message-Id: <20151119211852.GS5184@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151119193408.GA24110@mwanda>
In-Reply-To: <20151119193408.GA24110@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 19, 2015 at 10:34:09PM +0300, Dan Carpenter wrote:
> It should be >= ARRAY_SIZE() instead of > ARRAY_SIZE().
> 
> Fixes: 6231da675578 ('rcu: Print symbolic name for ->gp_state')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch!  I folded this into the original commit with attribution,
please see below.

							Thanx, Paul

> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index 6a5e1c4..6559b3c 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -1203,7 +1203,7 @@ static void record_gp_stall_check_time(struct rcu_state *rsp)
>   */
>  static char *gp_state_getname(short gs)
>  {
> -	if (gs < 0 || gs > ARRAY_SIZE(gp_state_names))
> +	if (gs < 0 || gs >= ARRAY_SIZE(gp_state_names))
>  		return "???";
>  	return gp_state_names[gs];
>  }

------------------------------------------------------------------------

commit 31bf937d2dcbe71a329e5bc6c7726f3a5949089a
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Tue Nov 17 14:39:26 2015 -0800

    rcu: Print symbolic name for ->gp_state
    
    Currently, ->gp_state is printed as an integer, which slows debugging.
    This commit therefore prints a symbolic name in addition to the integer.
    
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
    [ Updated to fix relational operator called out by Daniel Carpenter. ]

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index e768fc64583f..6559b3cb5ea6 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -1199,6 +1199,16 @@ static void record_gp_stall_check_time(struct rcu_state *rsp)
 }
 
 /*
+ * Convert a ->gp_state value to a character string.
+ */
+static char *gp_state_getname(short gs)
+{
+	if (gs < 0 || gs >= ARRAY_SIZE(gp_state_names))
+		return "???";
+	return gp_state_names[gs];
+}
+
+/*
  * Complain about starvation of grace-period kthread.
  */
 static void rcu_check_gp_kthread_starvation(struct rcu_state *rsp)
@@ -1209,10 +1219,11 @@ static void rcu_check_gp_kthread_starvation(struct rcu_state *rsp)
 	j = jiffies;
 	gpa = READ_ONCE(rsp->gp_activity);
 	if (j - gpa > 2 * HZ) {
-		pr_err("%s kthread starved for %ld jiffies! g%lu c%lu f%#x s%d ->state=%#lx\n",
+		pr_err("%s kthread starved for %ld jiffies! g%lu c%lu f%#x %s(%d) ->state=%#lx\n",
 		       rsp->name, j - gpa,
 		       rsp->gpnum, rsp->completed,
-		       rsp->gp_flags, rsp->gp_state,
+		       rsp->gp_flags,
+		       gp_state_getname(rsp->gp_state), rsp->gp_state,
 		       rsp->gp_kthread ? rsp->gp_kthread->state : ~0);
 		if (rsp->gp_kthread)
 			sched_show_task(rsp->gp_kthread);
diff --git a/kernel/rcu/tree.h b/kernel/rcu/tree.h
index 6cbec31f99d6..5c70b09a85d4 100644
--- a/kernel/rcu/tree.h
+++ b/kernel/rcu/tree.h
@@ -546,6 +546,15 @@ struct rcu_state {
 #define RCU_GP_DOING_FQS 4	/* Wait done for force-quiescent-state time. */
 #define RCU_GP_CLEANUP   5	/* Grace-period cleanup started. */
 #define RCU_GP_CLEANED   6	/* Grace-period cleanup complete. */
+static char * const gp_state_names[] = {
+	"RCU_GP_IDLE",
+	"RCU_GP_WAIT_GPS",
+	"RCU_GP_DONE_GPS",
+	"RCU_GP_WAIT_FQS",
+	"RCU_GP_DOING_FQS",
+	"RCU_GP_CLEANUP",
+	"RCU_GP_CLEANED",
+};
 
 extern struct list_head rcu_struct_flavors;
 

