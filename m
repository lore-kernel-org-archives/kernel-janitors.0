From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 21:47:22 +0000
Subject: [Kernel-janitors] [PATCH] hotplug/ibmphp_hpc: replace long_delay()
Message-Id: <20040727214722.GU3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93309157412349109=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727213901.GR3471@us.ibm.com>
In-Reply-To: <20040727213901.GR3471@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============93309157412349109==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace long_delay() with msleep() to guarantee the task
delays as desired.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- linux-vanilla/drivers/pci/hotplug/ibmphp_hpc.c	2004-06-16 05:19:02.000000000 +0000
+++ linux-dev/drivers/pci/hotplug/ibmphp_hpc.c	2004-07-12 22:12:43.000000000 +0000
@@ -205,7 +205,7 @@ static u8 i2c_ctrl_read (struct controll
 	// READ - step 4 : wait until start operation bit clears
 	i = CMD_COMPLETE_TOUT_SEC;
 	while (i) {
-		long_delay (1 * HZ / 100);
+		msleep(10);
 		wpg_addr = WPGBbar + WPG_I2CMCNTL_OFFSET;
 		wpg_data = readl (wpg_addr);
 		data = swab32 (wpg_data);
@@ -221,7 +221,7 @@ static u8 i2c_ctrl_read (struct controll
 	// READ - step 5 : read I2C status register
 	i = CMD_COMPLETE_TOUT_SEC;
 	while (i) {
-		long_delay (1 * HZ / 100);
+		msleep(10);
 		wpg_addr = WPGBbar + WPG_I2CSTAT_OFFSET;
 		wpg_data = readl (wpg_addr);
 		data = swab32 (wpg_data);
@@ -316,7 +316,7 @@ static u8 i2c_ctrl_write (struct control
 	// WRITE - step 4 : wait until start operation bit clears
 	i = CMD_COMPLETE_TOUT_SEC;
 	while (i) {
-		long_delay (1 * HZ / 100);
+		msleep(10);
 		wpg_addr = WPGBbar + WPG_I2CMCNTL_OFFSET;
 		wpg_data = readl (wpg_addr);
 		data = swab32 (wpg_data);
@@ -333,7 +333,7 @@ static u8 i2c_ctrl_write (struct control
 	// WRITE - step 5 : read I2C status register
 	i = CMD_COMPLETE_TOUT_SEC;
 	while (i) {
-		long_delay (1 * HZ / 100);
+		msleep(10);
 		wpg_addr = WPGBbar + WPG_I2CSTAT_OFFSET;
 		wpg_data = readl (wpg_addr);
 		data = swab32 (wpg_data);
@@ -748,7 +748,7 @@ int ibmphp_hpc_writeslot (struct slot * 
 					done = TRUE;
 			}
 			if (!done) {
-				long_delay (1 * HZ);
+				msleep(1000);
 				if (timeout < 1) {
 					done = TRUE;
 					err ("%s - Error command complete timeout\n", __FUNCTION__);
@@ -891,7 +891,7 @@ static void poll_hpc (void)
 		case POLL_SLEEP:
 			/* don't sleep with a lock on the hardware */
 			up (&semOperations);
-			long_delay (POLL_INTERVAL_SEC * HZ);
+			msleep(POLL_INTERVAL_SEC * 1000);
 
 			if (ibmphp_shutdown) 
 				break;
@@ -908,8 +908,7 @@ static void poll_hpc (void)
 		/* give up the harware semaphore */
 		up (&semOperations);
 		/* sleep for a short time just for good measure */
-		set_current_state (TASK_INTERRUPTIBLE);
-		schedule_timeout (HZ/10);
+		msleep(100);
 	}
 	up (&sem_exit);
 	debug ("%s - Exit\n", __FUNCTION__);
@@ -974,7 +973,7 @@ static int process_changeinstatus (struc
 			if (SLOT_PWRGD (pslot->status)) {
 				// power goes on and off after closing latch
 				// check again to make sure power is still ON
-				long_delay (1 * HZ);
+				msleep(1000);
 				rc = ibmphp_hpc_readslot (pslot, READ_SLOTSTATUS, &status);
 				if (SLOT_PWRGD (status))
 					update = TRUE;
@@ -1147,7 +1146,7 @@ static int hpc_wait_ctlr_notworking (int
 		if (CTLR_WORKING (*pstatus) == HPC_CTLR_WORKING_NO)
 			done = TRUE;
 		if (!done) {
-			long_delay (1 * HZ);
+			msleep(1000);
 			if (timeout < 1) {
 				done = TRUE;
 				err ("HPCreadslot - Error ctlr timeout\n");

--===============93309157412349109==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93309157412349109==--
