From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Nov 2015 19:34:09 +0000
Subject: [patch -next] rcu: off by one in gp_state_getname()
Message-Id: <20151119193408.GA24110@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It should be >= ARRAY_SIZE() instead of > ARRAY_SIZE().

Fixes: 6231da675578 ('rcu: Print symbolic name for ->gp_state')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 6a5e1c4..6559b3c 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -1203,7 +1203,7 @@ static void record_gp_stall_check_time(struct rcu_state *rsp)
  */
 static char *gp_state_getname(short gs)
 {
-	if (gs < 0 || gs > ARRAY_SIZE(gp_state_names))
+	if (gs < 0 || gs >= ARRAY_SIZE(gp_state_names))
 		return "???";
 	return gp_state_names[gs];
 }
