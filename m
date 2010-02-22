From: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 Feb 2010 13:10:00 +0000
Subject: [patch] rcutorture: mod_timer() takes an absolute time
Message-Id: <20100222125304.GA5416@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Paul,

I was inspired to write a smatch check based on:
http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dcomm=
itdiff;h=B857df1acc634b18db1db2a40864af985100266e

I compiled it and modprobed the resulting module...  Is this correct,
or did you intend for the timer to trigger right away?

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/kernel/rcutorture.c b/kernel/rcutorture.c
index 9bb5217..1970f61 100644
--- a/kernel/rcutorture.c
+++ b/kernel/rcutorture.c
@@ -798,7 +798,7 @@ rcu_torture_reader(void *arg)
 	do {
 		if (irqreader && cur_ops->irq_capable) {
 			if (!timer_pending(&t))
-				mod_timer(&t, 1);
+				mod_timer(&t, jiffies + 1);
 		}
 		idx =3D cur_ops->readlock();
 		completed =3D cur_ops->completed();
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
