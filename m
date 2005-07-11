From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 11 Jul 2005 18:32:35 +0000
Subject: [KJ] [UPDATE PATCH 14/14] telephony/ixj: use msleep() instead of
Message-Id: <20050711183235.GD2603@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72193905104178335=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============72193905104178335==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08.07.2005 [17:17:02 -0700], Nishanth Aravamudan wrote:
> From: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> Description: Replace schedule_timeout() with mlseep() to
> guarantee the task delays as expected.

Domen pointed out on IRC that these can all probably be msleep() as
signal_pending() is currently not a means to break the loop (just a
timeout).

Thanks,
Nish

Description: Replace schedule_timeout() with msleep() to
guarantee the task delays as expected.

Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

---

 ixj.c |   62 ++++++++++----------------------------------------------------
 1 files changed, 10 insertions(+), 52 deletions(-)

diff -urp 2.6.13-rc2-kj/drivers/telephony/ixj.c 2.6.13-rc2-kj-dev/drivers/telephony/ixj.c
--- 2.6.13-rc2-kj/drivers/telephony/ixj.c	2005-07-06 07:57:19.000000000 -0700
+++ 2.6.13-rc2-kj-dev/drivers/telephony/ixj.c	2005-07-08 14:13:43.000000000 -0700
@@ -774,10 +774,7 @@ static int ixj_wink(IXJ *j)
 	j->pots_winkstart = jiffies;
 	SLIC_SetState(PLD_SLIC_STATE_OC, j);
 
-	while (time_before(jiffies, j->pots_winkstart + j->winktime)) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(1);
-	}
+	msleep(jiffies_to_msecs(j->winktime));
 
 	SLIC_SetState(slicnow, j);
 	return 0;
@@ -1912,7 +1909,6 @@ static int ixj_pcmcia_cable_check(IXJ *j
 
 static int ixj_hookstate(IXJ *j)
 {
-	unsigned long det;
 	int fOffHook = 0;
 
 	switch (j->cardtype) {
@@ -1943,11 +1939,7 @@ static int ixj_hookstate(IXJ *j)
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
@@ -2062,7 +2054,7 @@ static void ixj_ring_start(IXJ *j)
 static int ixj_ring(IXJ *j)
 {
 	char cntr;
-	unsigned long jif, det;
+	unsigned long jif;
 
 	j->flags.ringing = 1;
 	if (ixj_hookstate(j) & 1) {
@@ -2070,7 +2062,6 @@ static int ixj_ring(IXJ *j)
 		j->flags.ringing = 0;
 		return 1;
 	}
-	det = 0;
 	for (cntr = 0; cntr < j->maxrings; cntr++) {
 		jif = jiffies + (1 * hertz);
 		ixj_ring_on(j);
@@ -2089,13 +2080,7 @@ static int ixj_ring(IXJ *j)
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
+				mlseep(10);
 				if (ixj_hookstate(j) & 1) {
 					j->flags.ringing = 0;
 					return 1;
@@ -6694,8 +6679,6 @@ static struct file_operations ixj_fops =
 
 static int ixj_linetest(IXJ *j)
 {
-	unsigned long jifwait;
-
 	j->flags.pstncheck = 1;	/* Testing */
 	j->flags.pstn_present = 0; /* Assume the line is not there */
 
@@ -6726,11 +6709,7 @@ static int ixj_linetest(IXJ *j)
 
 		outb_p(j->pld_scrw.byte, j->XILINXbase);
 		daa_set_mode(j, SOP_PU_CONVERSATION);
-		jifwait = jiffies + hertz;
-		while (time_before(jiffies, jifwait)) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1);
-		}
+		mlseep(1000);
 		daa_int_read(j);
 		daa_set_mode(j, SOP_PU_RESET);
 		if (j->m_DAAShadowRegs.XOP_REGS.XOP.xr0.bitreg.VDD_OK) {
@@ -6750,11 +6729,7 @@ static int ixj_linetest(IXJ *j)
 	j->pld_slicw.bits.rly3 = 0;
 	outb_p(j->pld_slicw.byte, j->XILINXbase + 0x01);
 	daa_set_mode(j, SOP_PU_CONVERSATION);
-	jifwait = jiffies + hertz;
-	while (time_before(jiffies, jifwait)) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(1);
-	}
+	mlseep(1000);
 	daa_int_read(j);
 	daa_set_mode(j, SOP_PU_RESET);
 	if (j->m_DAAShadowRegs.XOP_REGS.XOP.xr0.bitreg.VDD_OK) {
@@ -6783,7 +6758,6 @@ static int ixj_linetest(IXJ *j)
 static int ixj_selfprobe(IXJ *j)
 {
 	unsigned short cmd;
-	unsigned long jif;
 	int cnt;
 	BYTES bytes;
 
@@ -6933,29 +6907,13 @@ static int ixj_selfprobe(IXJ *j)
 	} else {
 		if (j->cardtype == QTI_LINEJACK) {
 			LED_SetState(0x1, j);
-			jif = jiffies + (hertz / 10);
-			while (time_before(jiffies, jif)) {
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(1);
-			}
+			mlseep(100);
 			LED_SetState(0x2, j);
-			jif = jiffies + (hertz / 10);
-			while (time_before(jiffies, jif)) {
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(1);
-			}
+			mlseep(100);
 			LED_SetState(0x4, j);
-			jif = jiffies + (hertz / 10);
-			while (time_before(jiffies, jif)) {
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(1);
-			}
+			mlseep(100);
 			LED_SetState(0x8, j);
-			jif = jiffies + (hertz / 10);
-			while (time_before(jiffies, jif)) {
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(1);
-			}
+			mlseep(100);
 			LED_SetState(0x0, j);
 			daa_get_version(j);
 			if (ixjdebug & 0x0002)


--===============72193905104178335==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72193905104178335==--
