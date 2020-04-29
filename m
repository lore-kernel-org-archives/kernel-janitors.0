From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Apr 2020 13:22:35 +0000
Subject: [PATCH] rcutorture: Fix error codes in rcu_torture_read_exit_init()
Message-Id: <20200429132235.GA815283@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, kernel-janitors@vger.kernel.org

The rcu_torture_read_exit_init() function is supposed to return negative
error codes which get propagated back down the call tree but the current
code returns true on failure.

Fixes: e02882cd57e3 ("rcutorture: Add races with task-exit processing")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 kernel/rcu/rcutorture.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 269881e51dc6d..5270674128029 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -2434,10 +2434,10 @@ static int rcu_torture_read_exit(void *unused)
 	return 0;
 }
 
-static bool rcu_torture_read_exit_init(void)
+static int rcu_torture_read_exit_init(void)
 {
 	if (read_exit <= 0)
-		return true;
+		return -EINVAL;
 	init_waitqueue_head(&read_exit_wq);
 	read_exit_child_stop = false;
 	read_exit_child_stopped = false;
-- 
2.26.2
