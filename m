From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 19:56:02 +0000
Subject: [KJ] [PATCH 32/39] telephony/ixj: replace schedule_timeout() with
Message-Id: <20050121195602.GM3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31919455978553746=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============31919455978553746==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep()/msleep_interruptible() instead of custom delay code. I
think this driver should not have a private variable for hertz, but that fix
can wait.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/telephony/ixj.c	2005-01-15 16:55:44.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/telephony/ixj.c	2005-01-17 17:03:10.000000000 -0800
@@ -779,10 +779,7 @@ static int ixj_wink(IXJ *j)
 	j->pots_winkstart = jiffies;
 	SLIC_SetState(PLD_SLIC_STATE_OC, j);
 
-	while (time_before(jiffies, j->pots_winkstart + j->winktime)) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(1);
-	}
+	msleep_interruptible(jiffies_to_msecs(j->winktime));
 
 	SLIC_SetState(slicnow, j);
 	return 0;
@@ -1917,7 +1914,6 @@ static int ixj_pcmcia_cable_check(IXJ *j
 
 static int ixj_hookstate(IXJ *j)
 {
-	unsigned long det;
 	int fOffHook = 0;
 
 	switch (j->cardtype) {
@@ -1948,11 +1944,7 @@ static int ixj_hookstate(IXJ *j)
 			    j->pld_slicr.bits.state == PLD_SLIC_STATE_STANDBY) {
 				if (j->flags.ringing || j->flags.cringing) {
 					if (!in_interrupt()) {
-						det = jiffies + (hertz / 50);
-						while (time_before(jiffies, det)) {
-							set_current_state(TASK_INTERRUPTIBLE);
-							schedule_timeout(1);
-						}
+						msleep(20);
 					}
 					SLIC_GetState(j);
 					if (j->pld_slicr.bits.state == PLD_SLIC_STATE_RINGING) {
@@ -2067,7 +2059,7 @@ static void ixj_ring_start(IXJ *j)
 static int ixj_ring(IXJ *j)
 {
 	char cntr;
-	unsigned long jif, det;
+	unsigned long jif;
 
 	j->flags.ringing = 1;
 	if (ixj_hookstate(j) & 1) {
@@ -2094,13 +2086,7 @@ static int ixj_ring(IXJ *j)
 		ixj_ring_off(j);
 		while (time_before(jiffies, jif)) {
 			if (ixj_hookstate(j) & 1) {
-				det = jiffies + (hertz / 100);
-				while (time_before(jiffies, det)) {
-					set_current_state(TASK_INTERRUPTIBLE);
-					schedule_timeout(1);
-					if (signal_pending(current))
-						break;
-				}
+				msleep_interruptible(10);
 				if (ixj_hookstate(j) & 1) {
 					j->flags.ringing = 0;
 					return 1;
@@ -6703,8 +6689,6 @@ static struct file_operations ixj_fops =
 
 static int ixj_linetest(IXJ *j)
 {
-	unsigned long jifwait;
-
 	j->flags.pstncheck = 1;	/* Testing */
 	j->flags.pstn_present = 0; /* Assume the line is not there */
 
@@ -6735,11 +6719,7 @@ static int ixj_linetest(IXJ *j)
 
 		outb_p(j->pld_scrw.byte, j->XILINXbase);
 		daa_set_mode(j, SOP_PU_CONVERSATION);
-		jifwait = jiffies + hertz;
-		while (time_before(jiffies, jifwait)) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1);
-		}
+		ssleep(1);
 		daa_int_read(j);
 		daa_set_mode(j, SOP_PU_RESET);
 		if (j->m_DAAShadowRegs.XOP_REGS.XOP.xr0.bitreg.VDD_OK) {
@@ -6759,11 +6739,7 @@ static int ixj_linetest(IXJ *j)
 	j->pld_slicw.bits.rly3 = 0;
 	outb_p(j->pld_slicw.byte, j->XILINXbase + 0x01);
 	daa_set_mode(j, SOP_PU_CONVERSATION);
-	jifwait = jiffies + hertz;
-	while (time_before(jiffies, jifwait)) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(1);
-	}
+	ssleep(1);
 	daa_int_read(j);
 	daa_set_mode(j, SOP_PU_RESET);
 	if (j->m_DAAShadowRegs.XOP_REGS.XOP.xr0.bitreg.VDD_OK) {
@@ -6792,7 +6768,6 @@ static int ixj_linetest(IXJ *j)
 static int ixj_selfprobe(IXJ *j)
 {
 	unsigned short cmd;
-	unsigned long jif;
 	int cnt;
 	BYTES bytes;
 
@@ -6942,29 +6917,13 @@ static int ixj_selfprobe(IXJ *j)
 	} else {
 		if (j->cardtype == QTI_LINEJACK) {
 			LED_SetState(0x1, j);
-			jif = jiffies + (hertz / 10);
-			while (time_before(jiffies, jif)) {
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(1);
-			}
+			msleep(100);
 			LED_SetState(0x2, j);
-			jif = jiffies + (hertz / 10);
-			while (time_before(jiffies, jif)) {
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(1);
-			}
+			msleep(100);
 			LED_SetState(0x4, j);
-			jif = jiffies + (hertz / 10);
-			while (time_before(jiffies, jif)) {
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(1);
-			}
+			msleep(100);
 			LED_SetState(0x8, j);
-			jif = jiffies + (hertz / 10);
-			while (time_before(jiffies, jif)) {
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(1);
-			}
+			msleep(100);
 			LED_SetState(0x0, j);
 			daa_get_version(j);
 			if (ixjdebug & 0x0002)

--===============31919455978553746==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31919455978553746==--
