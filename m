From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 18:40:47 +0000
Subject: [Kernel-janitors] [PATCH] net/s2io.c: replace schedule_timeout()
Message-Id: <20040727184047.GT2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15050719070902208=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============15050719070902208==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to guarantee
the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/s2io.c	2004-06-16 05:19:37.000000000 +0000
+++ linux-dev/drivers/net/s2io.c	2004-07-03 01:37:55.000000000 +0000
@@ -555,8 +555,7 @@ static int initNic(struct s2io_nic *nic)
 	val64 = 0;
 	writeq(val64, &bar0->sw_reset);
 	val64 = readq(&bar0->sw_reset);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ / 2);
+	msleep(500);
 
 	/*  Enable Receiving broadcasts */
 	val64 = readq(&bar0->mac_cfg);
@@ -803,8 +802,7 @@ static int initNic(struct s2io_nic *nic)
 				  dev->name);
 			return -1;
 		}
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 20);
+		msleep(50);
 		time++;
 	}
 
@@ -838,8 +836,7 @@ static int initNic(struct s2io_nic *nic)
 			return -1;
 		}
 		time++;
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 20);
+		msleep(50);
 	}
 
 	/* Initializing proper values as Pause threshold into all 
@@ -1182,8 +1179,7 @@ static int startNic(struct s2io_nic *nic
 	writeq(val64, &bar0->mc_rldram_mrs);
 	val64 = readq(&bar0->mc_rldram_mrs);
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ / 10);	/* Delay by around 100 ms. */
+	msleep(100);
 
 	/* Enabling ECC Protection. */
 	val64 = readq(&bar0->adapter_control);
@@ -1891,8 +1887,7 @@ int waitForCmdComplete(nic_t * sp)
 			ret = SUCCESS;
 			break;
 		}
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 20);
+		msleep(50);
 		if (cnt++ > 10)
 			break;
 	}
@@ -1931,15 +1926,13 @@ void s2io_reset(nic_t * sp)
 	 * As of now I'am just giving a 250ms delay and hoping that the
 	 * PCI write to sw_reset register is done by this time.
 	 */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ / 4);
+	msleep(250);
 
 	/* Restore the PCI state saved during initializarion. */
 	pci_restore_state(sp->pdev, sp->config_space);
 	s2io_init_pci(sp);
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ / 4);
+	msleep(250);
 
 	/* SXE-002: Configure link and activity LED to turn it off */
 	subid = sp->pdev->subsystem_device;
@@ -2157,8 +2150,7 @@ int s2io_close(struct net_device *dev)
 
 /* If the device tasklet is running, wait till its done before killing it */
 	while (atomic_read(&(sp->tasklet_status))) {
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 10);
+		msleep(100);
 	}
 	tasklet_kill(&sp->task);
 
@@ -2169,8 +2161,7 @@ int s2io_close(struct net_device *dev)
 			break;
 		}
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 20);
+		msleep(50);
 		cnt++;
 		if (cnt == 10) {
 			DBG_PRINT(ERR_DBG,
@@ -2943,8 +2934,7 @@ static u32 readEeprom(nic_t * sp, int of
 			data = I2C_CONTROL_GET_DATA(val64);
 			break;
 		}
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 20);
+		msleep(50);
 		exit_cnt++;
 	}
 
@@ -2983,8 +2973,7 @@ static int writeEeprom(nic_t * sp, int o
 				ret = 0;
 			break;
 		}
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 20);
+		msleep(50);
 		exit_cnt++;
 	}
 
@@ -3256,8 +3245,7 @@ static int s2io_bistTest(nic_t * sp, uin
 			ret = 0;
 			break;
 		}
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 10);
+		msleep(100);
 		cnt++;
 	}
 
@@ -3356,8 +3344,7 @@ static int s2io_rldramTest(nic_t * sp, u
 			val64 = readq(&bar0->mc_rldram_test_ctrl);
 			if (val64 & MC_RLDRAM_TEST_DONE)
 				break;
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ / 5);
+			msleep(200);
 		}
 
 		if (cnt == 5)
@@ -3373,8 +3360,7 @@ static int s2io_rldramTest(nic_t * sp, u
 			val64 = readq(&bar0->mc_rldram_test_ctrl);
 			if (val64 & MC_RLDRAM_TEST_DONE)
 				break;
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ / 2);
+			msleep(500);
 		}
 
 		if (cnt == 5)
@@ -3711,8 +3697,7 @@ static void s2io_set_link(unsigned long 
 	/* Allow a small delay for the NICs self initiated 
 	 * cleanup to complete.
 	 */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ / 10);
+	msleep(100);
 
 	val64 = readq(&bar0->adapter_status);
 	if (verify_xena_quiescence(val64, nic->device_enabled_once)) {

--===============15050719070902208==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15050719070902208==--
