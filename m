From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:26:59 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 11/16] scsi/qla_os: replace
Message-Id: <20040927182659.GZ1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============070284996280973289=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============070284996280973289==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep()/msleep_interruptible() [as appropriate]
instead of schedule_timeout() to guarantee the task delays as
expected. Change the units of the constants used to msecs.

--- 2.6.9-rc2-vanilla/drivers/scsi/qla2xxx/qla_os.c	2004-09-13 17:15:55.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/qla2xxx/qla_os.c	2004-09-14 10:04:24.000000000 -0700
@@ -21,6 +21,7 @@
 #include <linux/moduleparam.h>
 #include <linux/vmalloc.h>
 #include <linux/smp_lock.h>
+#include <linux/delay.h>
 
 #include <scsi/scsi_tcq.h>
 #include <scsi/scsicam.h>
@@ -889,8 +890,8 @@ qla2x00_queuecommand(struct scsi_cmnd *c
 static int
 qla2x00_eh_wait_on_command(scsi_qla_host_t *ha, struct scsi_cmnd *cmd)
 {
-#define ABORT_POLLING_PERIOD	HZ
-#define ABORT_WAIT_TIME		((10 * HZ) / (ABORT_POLLING_PERIOD))
+#define ABORT_POLLING_PERIOD	1000	
+#define ABORT_WAIT_TIME		((10 * 1000) / (ABORT_POLLING_PERIOD))
 
 	int		found = 0;
 	int		done = 0;
@@ -927,8 +928,7 @@ qla2x00_eh_wait_on_command(scsi_qla_host
 
 		spin_unlock_irq(ha->host->host_lock);
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(ABORT_POLLING_PERIOD);
+		msleep(ABORT_POLLING_PERIOD);
 
 		spin_lock_irq(ha->host->host_lock);
 
@@ -969,8 +969,7 @@ qla2x00_wait_for_hba_online(scsi_qla_hos
 	    test_bit(ISP_ABORT_RETRY, &ha->dpc_flags) ||
 	    ha->dpc_active) && time_before(jiffies, wait_online)) {
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ);
+		msleep(1000);
 	}
 	if (ha->flags.online) 
 		return_status = QLA_SUCCESS; 
@@ -1011,8 +1010,7 @@ qla2x00_wait_for_loop_ready(scsi_qla_hos
 	    atomic_read(&ha->loop_state) == LOOP_DOWN) ||
 	    test_bit(CFG_ACTIVE, &ha->cfg_flags) ||
 	    atomic_read(&ha->loop_state) != LOOP_READY) {
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ);
+		msleep(1000);
 		if (time_after_eq(jiffies, loop_timeout)) {
 			return_status = QLA_FUNCTION_FAILED;
 			break;
@@ -2120,8 +2118,7 @@ int qla2x00_probe_one(struct pci_dev *pd
 
 		qla2x00_check_fabric_devices(ha);
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ/100);
+		msleep(10);
 	}
 
 	pci_set_drvdata(pdev, ha);
@@ -2833,8 +2830,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - request_ring\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2847,8 +2843,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - response_ring\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2861,8 +2856,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - init_cb\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2874,8 +2868,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - ioctl_mem\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2886,8 +2879,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "qla2x00_allocate_sp_pool()\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2903,8 +2895,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 				    "Memory Allocation failed - sns_cmd\n");
 
 				qla2x00_mem_free(ha);
-				set_current_state(TASK_UNINTERRUPTIBLE);
-				schedule_timeout(HZ/10);
+				msleep(100);
 
 				continue;
 			}
@@ -2919,8 +2910,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 				    "Memory Allocation failed - ms_iocb\n");
 
 				qla2x00_mem_free(ha);
-				set_current_state(TASK_UNINTERRUPTIBLE);
-				schedule_timeout(HZ/10);
+				msleep(100);
 
 				continue;
 			}
@@ -2938,8 +2928,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 				    "Memory Allocation failed - ct_sns\n");
 
 				qla2x00_mem_free(ha);
-				set_current_state(TASK_UNINTERRUPTIBLE);
-				schedule_timeout(HZ/10);
+				msleep(100);
 
 				continue;
 			}
@@ -2955,8 +2944,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - iodesc_pd\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -3004,10 +2992,9 @@ qla2x00_mem_free(scsi_qla_host_t *ha)
 	}
 
 	/* Make sure all other threads are stopped. */
-	wtime = 60 * HZ;
+	wtime = 60 * 1000;
 	while (ha->dpc_wait && wtime) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		wtime = schedule_timeout(wtime);
+		wtime = msleep_interruptible(wtime);
 	}
 
 	/* free ioctl memory */

--===============070284996280973289==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============070284996280973289==--
