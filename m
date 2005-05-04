From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 04 May 2005 10:00:44 +0000
Subject: [KJ] [PATCH] drivers/cdrom/sbpcd.c: replace direct assignment with
Message-Id: <20050504100044.GT8647@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="PpAOPzA3dXsRhoo+"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--PpAOPzA3dXsRhoo+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--PpAOPzA3dXsRhoo+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc3_drivers_cdrom_sbpcd.c.patch"

diff -urpNX dontdiff a/drivers/cdrom/sbpcd.c b/drivers/cdrom/sbpcd.c
--- a/drivers/cdrom/sbpcd.c	2005-04-21 02:03:13.000000000 +0200
+++ b/drivers/cdrom/sbpcd.c	2005-04-29 09:56:01.000000000 +0200
@@ -830,7 +830,7 @@ static void mark_timeout_audio(u_long i)
 static void sbp_sleep(u_int time)
 {
 	sti();
-	current->state = TASK_INTERRUPTIBLE;
+	set_current_state(TASK_INTERRUPTIBLE);
 	schedule_timeout(time);
 	sti();
 }

--PpAOPzA3dXsRhoo+
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--PpAOPzA3dXsRhoo+--
