From: Domen Puncer <domen@coderock.org>
Date: Tue, 17 Aug 2004 09:21:13 +0000
Subject: [Kernel-janitors] Re: 2.6.8.1-kjt1
Message-Id: <20040817092113.GA2581@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5476441757515973=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040815170452.GA2578@masina.coderock.org>
In-Reply-To: <20040815170452.GA2578@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============5476441757515973==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Compile-warning fixes for 2 patches follow...

On 15/08/04 15:55 +0200, maximilian attems wrote:
> msleep-drivers_scsi_eta_pio.patch

  CC      drivers/scsi/eata_pio.o
  drivers/scsi/eata_pio.c: In function `eata_pio_host_reset':
  drivers/scsi/eata_pio.c:514: warning: implicit declaration of function `msleep'

Original from: Nishanth Aravamudan <nacc@us.ibm.com>
Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/scsi/eata_pio.c	Sat Aug 14 10:56:38 2004
+++ a/drivers/scsi/eata_pio.c	Tue Aug 17 11:04:04 2004
@@ -59,6 +59,7 @@
 #include <linux/interrupt.h>
 #include <linux/blkdev.h>
 #include <linux/spinlock.h>
+#include <linux/delay.h>
 #include <asm/io.h>
 
 #include <scsi/scsi.h>
@@ -511,8 +512,7 @@ static int eata_pio_host_reset(struct sc
 	HD(cmd)->state = RESET;
 
 	spin_unlock_irq(host->host_lock);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(3 * HZ);
+	msleep(3000);
 	spin_lock_irq(host->host_lock);
 
 	DBG(DBG_ABNORM, printk(KERN_WARNING "eata_pio_reset: interrupts disabled, " "loops %d.\n", limit));



> msleep-drivers_scsi_qla2xxx_qla_os.patch

  CC      drivers/scsi/qla2xxx/qla_os.o
  drivers/scsi/qla2xxx/qla_os.c: In function `qla2x00_wait_for_hba_online':
  drivers/scsi/qla2xxx/qla_os.c:972: warning: implicit declaration of function `msleep'

Original from: Nishanth Aravamudan <nacc@us.ibm.com>
Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/scsi/qla2xxx/qla_os.c	Wed Jul 14 19:15:06 2004
+++ a/drivers/scsi/qla2xxx/qla_os.c	Tue Aug 17 11:09:51 2004
@@ -21,6 +21,7 @@
 #include <linux/moduleparam.h>
 #include <linux/vmalloc.h>
 #include <linux/smp_lock.h>
+#include <linux/delay.h>
 
 #include <scsi/scsi_tcq.h>
 #include <scsi/scsicam.h>
@@ -969,8 +970,7 @@ qla2x00_wait_for_hba_online(scsi_qla_hos
 	    test_bit(ISP_ABORT_RETRY, &ha->dpc_flags) ||
 	    ha->dpc_active) && time_before(jiffies, wait_online)) {
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ);
+		msleep(1000);
 	}
 	if (ha->flags.online) 
 		return_status = QLA_SUCCESS; 
@@ -1011,8 +1011,7 @@ qla2x00_wait_for_loop_ready(scsi_qla_hos
 	    atomic_read(&ha->loop_state) == LOOP_DOWN) ||
 	    test_bit(CFG_ACTIVE, &ha->cfg_flags) ||
 	    atomic_read(&ha->loop_state) != LOOP_READY) {
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ);
+		msleep(1000);
 		if (time_after_eq(jiffies, loop_timeout)) {
 			return_status = QLA_FUNCTION_FAILED;
 			break;
@@ -2120,8 +2119,7 @@ int qla2x00_probe_one(struct pci_dev *pd
 
 		qla2x00_check_fabric_devices(ha);
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ/100);
+		msleep(10);
 	}
 
 	pci_set_drvdata(pdev, ha);
@@ -2833,8 +2831,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - request_ring\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2847,8 +2844,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - response_ring\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2861,8 +2857,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - init_cb\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2874,8 +2869,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - ioctl_mem\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2886,8 +2880,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "qla2x00_allocate_sp_pool()\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}
@@ -2903,8 +2896,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 				    "Memory Allocation failed - sns_cmd\n");
 
 				qla2x00_mem_free(ha);
-				set_current_state(TASK_UNINTERRUPTIBLE);
-				schedule_timeout(HZ/10);
+				msleep(100);
 
 				continue;
 			}
@@ -2919,8 +2911,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 				    "Memory Allocation failed - ms_iocb\n");
 
 				qla2x00_mem_free(ha);
-				set_current_state(TASK_UNINTERRUPTIBLE);
-				schedule_timeout(HZ/10);
+				msleep(100);
 
 				continue;
 			}
@@ -2938,8 +2929,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 				    "Memory Allocation failed - ct_sns\n");
 
 				qla2x00_mem_free(ha);
-				set_current_state(TASK_UNINTERRUPTIBLE);
-				schedule_timeout(HZ/10);
+				msleep(100);
 
 				continue;
 			}
@@ -2955,8 +2945,7 @@ qla2x00_mem_alloc(scsi_qla_host_t *ha)
 			    "Memory Allocation failed - iodesc_pd\n");
 
 			qla2x00_mem_free(ha);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/10);
+			msleep(100);
 
 			continue;
 		}

--===============5476441757515973==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5476441757515973==--
