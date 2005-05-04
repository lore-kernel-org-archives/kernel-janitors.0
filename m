From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 04 May 2005 10:03:05 +0000
Subject: [KJ] [PATCH] drivers/char/ip2/i2lib.c: replace direct assignment
Message-Id: <20050504100305.GV8647@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="W13SgbpmD6bhZUTM"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--W13SgbpmD6bhZUTM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--W13SgbpmD6bhZUTM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc3_drivers_char_ip2_i2lib.c.patch"

diff -urpNX dontdiff a/drivers/char/ip2/i2lib.c b/drivers/char/ip2/i2lib.c
--- a/drivers/char/ip2/i2lib.c	2005-04-21 02:03:13.000000000 +0200
+++ b/drivers/char/ip2/i2lib.c	2005-04-29 10:05:14.000000000 +0200
@@ -655,7 +655,7 @@ i2QueueCommands(int type, i2ChanStrPtr p
 			timeout--;   // So negative values == forever
 		
 		if (!in_interrupt()) {
-			current->state = TASK_INTERRUPTIBLE;
+			set_current_state(TASK_INTERRUPTIBLE);
 			schedule_timeout(1);	// short nap 
 		} else {
 			// we cannot sched/sleep in interrrupt silly
@@ -1132,7 +1132,7 @@ i2Output(i2ChanStrPtr pCh, const char *p
 
 					ip2trace (CHANN, ITRC_OUTPUT, 61, 0 );
 
-					current->state = TASK_INTERRUPTIBLE;
+					set_current_state(TASK_INTERRUPTIBLE);
 					schedule_timeout(2);
 					if (signal_pending(current)) {
 						break;

--W13SgbpmD6bhZUTM
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--W13SgbpmD6bhZUTM--
