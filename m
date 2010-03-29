From: Julia Lawall <julia@diku.dk>
Date: Mon, 29 Mar 2010 09:39:22 +0000
Subject: [PATCH] drivers/macintosh: Correct potential double free
Message-Id: <Pine.LNX.4.64.1003291138520.21896@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The conditionals were testing different values, but then all freeing the
same one, which could result in a double free.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,e;
identifier f;
iterator I;
statement S;
@@

*kfree(x);
... when != &x
    when != x = e
    when != I(x,...) S
*x
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/macintosh/windfarm_pm91.c   |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/macintosh/windfarm_pm91.c b/drivers/macintosh/windfarm_pm91.c
index bea9916..3442732 100644
--- a/drivers/macintosh/windfarm_pm91.c
+++ b/drivers/macintosh/windfarm_pm91.c
@@ -687,12 +687,9 @@ static int __devexit wf_smu_remove(struct platform_device *ddev)
 		wf_put_control(cpufreq_clamp);
 
 	/* Destroy control loops state structures */
-	if (wf_smu_slots_fans)
-		kfree(wf_smu_cpu_fans);
-	if (wf_smu_drive_fans)
-		kfree(wf_smu_cpu_fans);
-	if (wf_smu_cpu_fans)
-		kfree(wf_smu_cpu_fans);
+	kfree(wf_smu_slots_fans);
+	kfree(wf_smu_drive_fans);
+	kfree(wf_smu_cpu_fans);
 
 	return 0;
 }
