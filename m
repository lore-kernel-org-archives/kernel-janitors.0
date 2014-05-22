From: =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Date: Thu, 22 May 2014 17:45:23 +0000
Subject: [PATCH] sched: Use time_after()
Message-Id: <1400780723-24626-1-git-send-email-manuel.schoelling@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mingo@redhat.com
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>

To be future-proof and for better readability the time comparisons are modi=
fied
to use time_after() instead of plain, error-prone math.

Signed-off-by: Manuel Sch=C3=B6lling <manuel.schoelling@gmx.de>
---
 kernel/sched/fair.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7570dd9..716360a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4014,7 +4014,7 @@ static void record_wakee(struct task_struct *p)
 	 * about the boundary, really active task won't care
 	 * about the loss.
 	 */
-	if (jiffies > current->wakee_flip_decay_ts + HZ) {
+	if (time_after(jiffies, current->wakee_flip_decay_ts + HZ)) {
 		current->wakee_flips =3D 0;
 		current->wakee_flip_decay_ts =3D jiffies;
 	}
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
