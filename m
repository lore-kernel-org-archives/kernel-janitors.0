From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 21:23:52 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 29/38] net/s2io: replace
Message-Id: <20040924212352.GM1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62497123986860115=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============62497123986860115==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/s2io.c	2004-09-13 17:15:45.000000000 -0700
+++ 2.6.9-rc2/drivers/net/s2io.c	2004-09-15 09:35:13.000000000 -0700
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
+	msleep(100);			/* Delay by around 100 ms. */
 
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
@@ -2169,8 +2162,7 @@ int s2io_close(struct net_device *dev)
 			break;
 		}
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 20);
+		msleep(50);
 		cnt++;
 		if (cnt == 10) {
 			DBG_PRINT(ERR_DBG,
@@ -2846,11 +2838,10 @@ static int s2io_ethtool_idnic(struct net
 		sp->id_timer.data = (unsigned long) sp;
 	}
 	mod_timer(&sp->id_timer, jiffies);
-	set_current_state(TASK_INTERRUPTIBLE);
 	if (data)
-		schedule_timeout(data * HZ);
+		msleep_interruptible(data * 1000);
 	else
-		schedule_timeout(MAX_SCHEDULE_TIMEOUT);
+		msleep_interruptible(jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
 	del_timer_sync(&sp->id_timer);
 
 	return 0;
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

--===============62497123986860115==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62497123986860115==--
