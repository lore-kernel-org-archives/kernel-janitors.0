From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:52:12 +0000
Subject: [Kernel-janitors] [PATCH] scsi/qla_os: replace schedule_timeout()
Message-Id: <20040727225212.GA4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22134246478095321=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============22134246478095321==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/scsi/qla2xxx/qla_os.c	2004-06-16 05:20:26.000000000 +0000
+++ linux-dev/drivers/scsi/qla2xxx/qla_os.c	2004-07-03 03:55:29.000000000 +0000
@@ -917,8 +917,7 @@ qla2x00_eh_wait_on_command(scsi_qla_host
 
 		spin_unlock_irq(ha->host->host_lock);
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(2*HZ);
+		msleep(2000);
 
 		spin_lock_irq(ha->host->host_lock);
 
@@ -965,8 +964,7 @@ qla2x00_wait_for_hba_online(scsi_qla_hos
 	    test_bit(ISP_ABORT_RETRY, &ha->dpc_flags)) &&
 		time_before(jiffies, wait_online)) {
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ);
+		msleep(1000);
 	}
 	if (ha->flags.online == TRUE) 
 		return_status = QLA_SUCCESS; 
@@ -1008,8 +1006,7 @@ qla2x00_wait_for_loop_ready(scsi_qla_hos
 	    atomic_read(&ha->loop_state) == LOOP_DOWN) ||
 	    test_bit(CFG_ACTIVE, &ha->cfg_flags) ||
 	    atomic_read(&ha->loop_state) != LOOP_READY) {
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ);
+		msleep(1000);
 		if (time_after_eq(jiffies, loop_timeout)) {
 			return_status = QLA_FUNCTION_FAILED;
 			break;
@@ -2133,8 +2130,7 @@ int qla2x00_probe_one(struct pci_dev *pd
 
 		qla2x00_check_fabric_devices(ha);
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ/100);
+		msleep(10);
 	}
 
 	pci_set_drvdata(pdev, ha);
@@ -2870,8 +2866,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - request_ring\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2884,8 +2879,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - response_ring\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2898,8 +2892,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - init_cb\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2911,8 +2904,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - ioctl_mem\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2923,8 +2915,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "qla2x00_allocate_sp_pool()\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2940,8 +2931,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 				    "Memory Allocation failed - sns_cmd\n");
 
 				qla2x00_mem_free(ha);
-				set_current_state(TASK_UNINTERRUPTIBLE);
-				schedule_timeout(HZ/10);
+				msleep(100);
 
 				continue;
 			}
@@ -2956,8 +2946,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 				    "Memory Allocation failed - ms_iocb\n");
 
 				qla2x00_mem_free(ha);
-				set_current_state(TASK_UNINTERRUPTIBLE);
-				schedule_timeout(HZ/10);
+				msleep(100);
 
 				continue;
 			}
@@ -2975,8 +2964,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 				    "Memory Allocation failed - ct_sns\n");
 
 				qla2x00_mem_free(ha);
-				set_current_state(TASK_UNINTERRUPTIBLE);
-				schedule_timeout(HZ/10);
+				msleep(100);
 
 				continue;
 			}
@@ -2992,8 +2980,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - iodesc_pd\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}

--===============22134246478095321==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22134246478095321==--
