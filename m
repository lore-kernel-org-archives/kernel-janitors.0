From: "Luiz Fernando N. Capitulino" <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 15 Apr 2004 21:12:48 +0000
Subject: [Kernel-janitors] [PATCH 2/2] - last floppy merges: debugt
Message-Id: <20040415181248.2c8d5268.lcapitulino@prefeitura.sp.gov.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2675217943977497=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============2675217943977497==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit



floppy_debugt.patch: better use of the debugt functions.

 drivers/block/floppy.c |   38 ++++++++------------------------------
 1 files changed, 8 insertions(+), 30 deletions(-)


diff -X dontdiff -Nparu a/drivers/block/floppy.c a~/drivers/block/floppy.c
--- a/drivers/block/floppy.c	2004-04-15 15:28:39.000000000 -0300
+++ a~/drivers/block/floppy.c	2004-04-15 15:33:12.000000000 -0300
@@ -604,28 +604,27 @@ static inline int fd_eject(int drive)
 }
 #endif
 
-#ifdef DEBUGT
-static long unsigned debugtimer;
-#endif
-
 /*
  * Debugging
  * =========
  */
+#ifdef DEBUGT
+static long unsigned debugtimer;
+
 static inline void set_debugt(void)
 {
-#ifdef DEBUGT
 	debugtimer = jiffies;
-#endif
 }
 
 static inline void debugt(const char *message)
 {
-#ifdef DEBUGT
 	if (DP->flags & DEBUGT)
 		printk("%s dtime=%lu\n", message, jiffies - debugtimer);
-#endif
 }
+#else
+static inline void set_debugt(void) { }
+static inline void debugt(const char *message) { }
+#endif /* DEBUGT */
 
 typedef void (*timeout_fn) (unsigned long);
 static struct timer_list fd_timeout = TIMER_INITIALIZER(floppy_shutdown, 0, 0);
@@ -1546,9 +1545,8 @@ static void setup_rw_floppy(void)
 	for (i = 0; i < raw_cmd->cmd_count; i++)
 		r |= output_byte(raw_cmd->cmd[i]);
 
-#ifdef DEBUGT
 	debugt("rw_command: ");
-#endif
+
 	if (r) {
 		cont->error();
 		reset_fdc();
@@ -1570,9 +1568,7 @@ static int blind_seek;
  */
 static void seek_interrupt(void)
 {
-#ifdef DEBUGT
 	debugt("seek interrupt:");
-#endif
 	if (inr != 2 || (ST0 & 0xF8) != 0x20) {
 		DPRINT("seek failed\n");
 		DRS->track = NEED_2_RECAL;
@@ -1676,24 +1672,18 @@ static void seek_floppy(void)
 	output_byte(FD_SEEK);
 	output_byte(UNIT(current_drive));
 	LAST_OUT(track);
-#ifdef DEBUGT
 	debugt("seek command:");
-#endif
 }
 
 static void recal_interrupt(void)
 {
-#ifdef DEBUGT
 	debugt("recal interrupt:");
-#endif
 	if (inr != 2)
 		FDCS->reset = 1;
 	else if (ST0 & ST0_ECE) {
 		switch (DRS->track) {
 		case NEED_1_RECAL:
-#ifdef DEBUGT
 			debugt("recal interrupt need 1 recal:");
-#endif
 			/* after a second recalibrate, we still haven't
 			 * reached track 0. Probably no drive. Raise an
 			 * error, as failing immediately might upset
@@ -1702,9 +1692,7 @@ static void recal_interrupt(void)
 			cont->redo();
 			return;
 		case NEED_2_RECAL:
-#ifdef DEBUGT
 			debugt("recal interrupt need 2 recal:");
-#endif
 			/* If we already did a recalibrate,
 			 * and we are not at track 0, this
 			 * means we have moved. (The only way
@@ -1722,9 +1710,7 @@ static void recal_interrupt(void)
 			DRS->select_date = jiffies;
 			/* fall through */
 		default:
-#ifdef DEBUGT
 			debugt("recal interrupt default:");
-#endif
 			/* Recalibrate moves the head by at
 			 * most 80 steps. If after one
 			 * recalibrate we don't have reached
@@ -1813,9 +1799,7 @@ irqreturn_t floppy_interrupt(int irq, vo
 
 static void recalibrate_floppy(void)
 {
-#ifdef DEBUGT
 	debugt("recalibrate floppy:");
-#endif
 	do_floppy = recal_interrupt;
 	output_byte(FD_RECALIBRATE);
 	LAST_OUT(UNIT(current_drive));
@@ -1826,9 +1810,7 @@ static void recalibrate_floppy(void)
  */
 static void reset_interrupt(void)
 {
-#ifdef DEBUGT
 	debugt("reset interrupt:");
-#endif
 	result();		/* get the status ready for set_fdc */
 	if (FDCS->reset) {
 		printk("reset set in interrupt, calling %p\n", cont->error);
@@ -2266,9 +2248,7 @@ static void redo_format(void)
 	buffer_track = -1;
 	setup_format_params(format_req.track << STRETCH(_floppy));
 	floppy_start();
-#ifdef DEBUGT
 	debugt("queue format request");
-#endif
 }
 
 static struct cont_t format_cont = {
@@ -2992,9 +2972,7 @@ static void redo_fd_request(void)
 		if (TESTF(FD_NEED_TWADDLE))
 			twaddle();
 		schedule_bh(floppy_start);
-#ifdef DEBUGT
 		debugt("queue fd request");
-#endif
 		return;
 	}
 #undef REPEAT


-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

--===============2675217943977497==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2675217943977497==--
