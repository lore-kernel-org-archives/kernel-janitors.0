From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Wed, 03 Mar 2004 19:40:59 +0000
Subject: [Kernel-janitors] [PATCH 3/3] - De-uglification work for
Message-Id: <1078342461.14557.42.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


A better definition for debugt.

diff -Nparu linux-2.6.4-rc1-bk2/drivers/block/floppy.c linux-2.6.4-rc1-bk2~/drivers/block/floppy.c
--- linux-2.6.4-rc1-bk2/drivers/block/floppy.c	2004-02-18 15:54:22.000000000 -0300
+++ linux-2.6.4-rc1-bk2~/drivers/block/floppy.c	2004-03-02 18:18:06.000000000 -0300
@@ -605,28 +605,27 @@ static inline int fd_eject(int drive)
 }
 #endif
 
-#ifdef DEBUGT
-static long unsigned debugtimer;
-#endif
-
 /*
  * Debugging
  * ====  */
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
 		printk("%s dtime=%lu\n", message, jiffies-debugtimer);
-#endif
 }
+#else
+static inline void set_debug(void) {}
+static inline void debugt(const char *message) {}
+#endif /* DEBUGT */
 
 typedef void (*timeout_fn)(unsigned long);
 static struct timer_list fd_timeout = TIMER_INITIALIZER(floppy_shutdown, 0, 0);
@@ -1547,9 +1546,7 @@ static void setup_rw_floppy(void)
 	for (i=0; i< raw_cmd->cmd_count; i++)
 		r|=output_byte(raw_cmd->cmd[i]);
 
-#ifdef DEBUGT
 	debugt("rw_command: ");
-#endif
 	if (r){
 		cont->error();
 		reset_fdc();
@@ -1571,9 +1568,7 @@ static int blind_seek;
  */
 static void seek_interrupt(void)
 {
-#ifdef DEBUGT
 	debugt("seek interrupt:");
-#endif
 	if (inr != 2 || (ST0 & 0xF8) != 0x20) {
 		DPRINT("seek failed\n");
 		DRS->track = NEED_2_RECAL;
@@ -1677,24 +1672,18 @@ static void seek_floppy(void)
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
 	if (inr !=2)
 		FDCS->reset = 1;
 	else if (ST0 & ST0_ECE) {
 	       	switch(DRS->track){
 			case NEED_1_RECAL:
-#ifdef DEBUGT
 				debugt("recal interrupt need 1 recal:");
-#endif
 				/* after a second recalibrate, we still haven't
 				 * reached track 0. Probably no drive. Raise an
 				 * error, as failing immediately might upset
@@ -1703,9 +1692,7 @@ static void recal_interrupt(void)
 				cont->redo();
 				return;
 			case NEED_2_RECAL:
-#ifdef DEBUGT
 				debugt("recal interrupt need 2 recal:");
-#endif
 				/* If we already did a recalibrate,
 				 * and we are not at track 0, this
 				 * means we have moved. (The only way
@@ -1722,9 +1709,7 @@ static void recal_interrupt(void)
 				DRS->select_date = jiffies;
 				/* fall through */
 			default:
-#ifdef DEBUGT
 				debugt("recal interrupt default:");
-#endif
 				/* Recalibrate moves the head by at
 				 * most 80 steps. If after one
 				 * recalibrate we don't have reached
@@ -1812,9 +1797,7 @@ irqreturn_t floppy_interrupt(int irq, vo
 
 static void recalibrate_floppy(void)
 {
-#ifdef DEBUGT
 	debugt("recalibrate floppy:");
-#endif
 	do_floppy = recal_interrupt;
 	output_byte(FD_RECALIBRATE);
 	LAST_OUT(UNIT(current_drive));
@@ -1825,9 +1808,7 @@ static void recalibrate_floppy(void)
  */
 static void reset_interrupt(void)
 {
-#ifdef DEBUGT
 	debugt("reset interrupt:");
-#endif
 	result();		/* get the status ready for set_fdc */
 	if (FDCS->reset) {
 		printk("reset set in interrupt, calling %p\n", cont->error);
@@ -2265,9 +2246,7 @@ static void redo_format(void)
 	buffer_track = -1;
 	setup_format_params(format_req.track << STRETCH(_floppy));
 	floppy_start();
-#ifdef DEBUGT
 	debugt("queue format request");
-#endif
 }
 
 static struct cont_t format_cont = {
@@ -2978,9 +2957,7 @@ static void redo_fd_request(void)
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

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
