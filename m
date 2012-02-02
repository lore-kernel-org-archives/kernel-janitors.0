From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 02 Feb 2012 14:00:47 +0000
Subject: [PATCH 3/3] kernel/rcutorture.c: Move call to PTR_ERR after reassignment
Message-Id: <1328191247-23792-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1328191247-23792-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1328191247-23792-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Triplett <josh@freedesktop.org>
Cc: kernel-janitors@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>

From: Julia Lawall <julia@diku.dk>

Delete successive assignments to the same location.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e,e1;
constant c;
@@

*e = c
... when != e = e1
    when != &e
    when != true IS_ERR(e)
*PTR_ERR(e)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
Reported-by: Josh Triplett <josh@joshtriplett.org>

---
 kernel/rcutorture.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/rcutorture.c b/kernel/rcutorture.c
index a58ac28..4b3cd87 100644
--- a/kernel/rcutorture.c
+++ b/kernel/rcutorture.c
@@ -1450,12 +1450,15 @@ rcu_torture_onoff(void *arg)
 static int __cpuinit
 rcu_torture_onoff_init(void)
 {
+	int ret;
+
 	if (onoff_interval <= 0)
 		return 0;
 	onoff_task = kthread_run(rcu_torture_onoff, NULL, "rcu_torture_onoff");
 	if (IS_ERR(onoff_task)) {
+		ret = PTR_ERR(onoff_task);
 		onoff_task = NULL;
-		return PTR_ERR(onoff_task);
+		return ret;
 	}
 	return 0;
 }

