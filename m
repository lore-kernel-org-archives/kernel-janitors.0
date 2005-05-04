From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 04 May 2005 09:56:53 +0000
Subject: [KJ] [PATCH] drivers/block/swim3.c: replace direct assignment with
Message-Id: <20050504095653.GR8647@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="MIdTMoZhcV1D07fI"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--MIdTMoZhcV1D07fI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--MIdTMoZhcV1D07fI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc3_drivers_block_swim3.c.patch"

diff -urpNX dontdiff a/drivers/block/swim3.c b/drivers/block/swim3.c
--- a/drivers/block/swim3.c	2005-04-21 02:03:13.000000000 +0200
+++ b/drivers/block/swim3.c	2005-04-29 09:55:09.000000000 +0200
@@ -832,7 +832,7 @@ static int fd_eject(struct floppy_state 
 			break;
 		}
 		swim3_select(fs, RELAX);
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(1);
 		if (swim3_readbit(fs, DISK_IN) == 0)
 			break;
@@ -900,7 +900,7 @@ static int floppy_open(struct inode *ino
 				break;
 			}
 			swim3_select(fs, RELAX);
-			current->state = TASK_INTERRUPTIBLE;
+			set_current_state(TASK_INTERRUPTIBLE);
 			schedule_timeout(1);
 		}
 		if (err == 0 && (swim3_readbit(fs, SEEK_COMPLETE) == 0
@@ -984,7 +984,7 @@ static int floppy_revalidate(struct gend
 		if (signal_pending(current))
 			break;
 		swim3_select(fs, RELAX);
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(1);
 	}
 	ret = swim3_readbit(fs, SEEK_COMPLETE) == 0

--MIdTMoZhcV1D07fI
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--MIdTMoZhcV1D07fI--
