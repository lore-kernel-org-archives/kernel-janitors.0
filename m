From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 04 May 2005 09:58:03 +0000
Subject: [KJ] [PATCH] drivers/block/swim_iop.c: replace direct assignment
Message-Id: <20050504095803.GS8647@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Pgaa2uWPnPrfixyx"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Pgaa2uWPnPrfixyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--Pgaa2uWPnPrfixyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc3_drivers_block_swim_iop.c.patch"

diff -urpNX dontdiff a/drivers/block/swim_iop.c b/drivers/block/swim_iop.c
--- a/drivers/block/swim_iop.c	2005-04-21 02:03:13.000000000 +0200
+++ b/drivers/block/swim_iop.c	2005-04-29 09:55:32.000000000 +0200
@@ -338,7 +338,7 @@ static int swimiop_eject(struct floppy_s
 			err = -EINTR;
 			break;
 		}
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(1);
 	}
 	release_drive(fs);

--Pgaa2uWPnPrfixyx
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Pgaa2uWPnPrfixyx--
