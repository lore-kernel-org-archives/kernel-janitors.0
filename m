From: Neil Horman <nhorman@tuxdriver.com>
Date: Sat, 29 Jul 2006 20:18:09 +0000
Subject: Re: [KJ] (re) audit return code handling for kernel_thread [2/3]
Message-Id: <20060729201809.GC8574@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060729201139.GA8574@localhost.localdomain>
In-Reply-To: <20060729201139.GA8574@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, torvalds@osdl.org, akpm@osdl.org, marcel@holtman.org, fpavlic@de.ibm.com, paulus@au.ibm.com, bcollins@debian.org, tony.luck@intel.com

Patch to audit return codes from kernel_thread.  This patch handles cases in
which the return code was stored for later interrogations, but the later checks
assumed that negative return codes were successful.

Thanks 
Neil

Signed-off-by: Neil Horman <nhorman@tuxdriver.com>


 arch/s390/mm/cmm.c             |    6 +++++-
 drivers/macintosh/adb.c        |    7 +++++--
 drivers/macintosh/therm_pm72.c |    5 ++++-
 3 files changed, 14 insertions(+), 4 deletions(-)


--- a/arch/s390/mm/cmm.c
+++ b/arch/s390/mm/cmm.c
@@ -161,7 +161,11 @@ cmm_thread(void *dummy)
 static void
 cmm_start_thread(void)
 {
-	kernel_thread(cmm_thread, NULL, 0);
+	if (kernel_thread(cmm_thread, NULL, 0) < 0) {
+		printk(KERN_WARNING "Could not start kernel thread at %s:%d\n",
+			__FUNCTION__,__LINE__);
+		clear_bit(0,&cmm_thread_active);
+	}
 }
 
 static void
--- a/drivers/macintosh/adb.c
+++ b/drivers/macintosh/adb.c
@@ -137,7 +137,7 @@ #endif
 
 static __inline__ void adb_wait_ms(unsigned int ms)
 {
-	if (current->pid && adb_probe_task_pid &&
+	if (current->pid && (adb_probe_task_pid >= 0) &&
 	  adb_probe_task_pid = current->pid)
 		msleep(ms);
 	else
@@ -270,6 +270,9 @@ static void
 __adb_probe_task(void *data)
 {
 	adb_probe_task_pid = kernel_thread(adb_probe_task, NULL, SIGCHLD | CLONE_KERNEL);
+	if (adb_probe_task_pid < 0)
+		printk(KERN_WARNING "Could not start kernel thread at %s:%d\n",
+			__FUNCTION__,__LINE__);
 }
 
 static DECLARE_WORK(adb_reset_work, __adb_probe_task, NULL);
@@ -494,7 +497,7 @@ adb_request(struct adb_request *req, voi
 	 * block. Beware that the "done" callback will be overriden !
 	 */
 	if ((flags & ADBREQ_SYNC) &&
-	    (current->pid && adb_probe_task_pid &&
+	    (current->pid && (adb_probe_task_pid >= 0) &&
 	    adb_probe_task_pid = current->pid)) {
 		req->done = adb_probe_wakeup;
 		rc = adb_controller->send_request(req, 0);
--- a/drivers/macintosh/therm_pm72.c
+++ b/drivers/macintosh/therm_pm72.c
@@ -1769,6 +1769,9 @@ static void start_control_loops(void)
 	init_completion(&ctrl_complete);
 
 	ctrl_task = kernel_thread(main_control_loop, NULL, SIGCHLD | CLONE_KERNEL);
+	if (ctrl_task < 0)
+		printk(KERN_CRIT "Could not start kernel thread at %s:%d\n",
+			__FUNCTION__, __LINE__);
 }
 
 /*
@@ -1776,7 +1779,7 @@ static void start_control_loops(void)
  */
 static void stop_control_loops(void)
 {
-	if (ctrl_task != 0)
+	if (ctrl_task >= 0)
 		wait_for_completion(&ctrl_complete);
 }
 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
