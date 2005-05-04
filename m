From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 04 May 2005 10:05:40 +0000
Subject: [KJ] [PATCH] drivers/ide/ide-tape.c: replace direct assignment with
Message-Id: <20050504100540.GX8647@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="hdhkc9EpVJoq6PQ6"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--hdhkc9EpVJoq6PQ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

--hdhkc9EpVJoq6PQ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc3_drivers_ide_ide-tape.c.patch"

diff -urpNX dontdiff a/drivers/ide/ide-tape.c b/drivers/ide/ide-tape.c
--- a/drivers/ide/ide-tape.c	2005-04-21 02:03:13.000000000 +0200
+++ b/drivers/ide/ide-tape.c	2005-04-29 10:12:46.000000000 +0200
@@ -2903,7 +2903,7 @@ static int idetape_wait_ready(ide_drive_
 		} else if (!(tape->sense_key == 2 && tape->asc == 4 &&
 			     (tape->ascq == 1 || tape->ascq == 8)))
 			return -EIO;
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
   		schedule_timeout(HZ / 10);
 	}
 	return -EIO;

--hdhkc9EpVJoq6PQ6
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--hdhkc9EpVJoq6PQ6--
