From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 04 May 2005 10:02:01 +0000
Subject: [KJ] [PATCH] drivers/char/hw_random.c: replace direct assignment
Message-Id: <20050504100201.GU8647@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8/UBlNHSEJa6utmr"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--8/UBlNHSEJa6utmr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--8/UBlNHSEJa6utmr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc3_drivers_char_hw_random.c.patch"

diff -urpNX dontdiff a/drivers/char/hw_random.c b/drivers/char/hw_random.c
--- a/drivers/char/hw_random.c	2005-04-21 02:03:13.000000000 +0200
+++ b/drivers/char/hw_random.c	2005-04-29 10:03:50.000000000 +0200
@@ -514,7 +514,7 @@ static ssize_t rng_dev_read (struct file
 
 		if(need_resched())
 		{
-			current->state = TASK_INTERRUPTIBLE;
+			set_current_state(TASK_INTERRUPTIBLE);
 			schedule_timeout(1);
 		}
 		else

--8/UBlNHSEJa6utmr
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--8/UBlNHSEJa6utmr--
