From: Neil Horman <nhorman@tuxdriver.com>
Date: Sat, 29 Jul 2006 20:15:55 +0000
Subject: Re: [KJ] (re) audit return code handling for kernel_thread [1/3]
Message-Id: <20060729201555.GB8574@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060729201139.GA8574@localhost.localdomain>
In-Reply-To: <20060729201139.GA8574@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, torvalds@osdl.org, akpm@osdl.org, marcel@holtman.org, fpavlic@de.ibm.com, paulus@au.ibm.com, bcollins@debian.org, tony.luck@intel.com

Patch to audit return code checking of kernel_thread.  These fixes correct those
callers who fail to check the return code of kernel_thread at all

Thanks & Regards
Neil

Signed-off-by: Neil Horman <nhorman@tuxdriver.com>


 arch/s390/mm/cmm.c           |    6 +++++-
 drivers/macintosh/mediabay.c |    4 +++-
 drivers/s390/net/lcs.c       |   10 +++++++---
 drivers/s390/net/qeth_main.c |   12 +++++++++---
 init/main.c                  |    6 +++++-
 net/bluetooth/rfcomm/core.c  |    6 +++++-
 6 files changed, 34 insertions(+), 10 deletions(-)


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
 
--- a/drivers/macintosh/mediabay.c
+++ b/drivers/macintosh/mediabay.c
@@ -699,7 +699,9 @@ static int __devinit media_bay_attach(st
 
 	/* Startup kernel thread */
 	if (i = 0)
-		kernel_thread(media_bay_task, NULL, CLONE_KERNEL);
+		if (kernel_thread(media_bay_task, NULL, CLONE_KERNEL) < 0)
+			printk(KERN_WARNING "Could not start kernel thread at %s:%d\n",
+				__FUNCTION__,__LINE__);
 
 	return 0;
 
--- a/drivers/s390/net/lcs.c
+++ b/drivers/s390/net/lcs.c
@@ -1729,11 +1729,15 @@ lcs_start_kernel_thread(struct lcs_card 
 {
 	LCS_DBF_TEXT(5, trace, "krnthrd");
 	if (lcs_do_start_thread(card, LCS_RECOVERY_THREAD))
-		kernel_thread(lcs_recovery, (void *) card, SIGCHLD);
+		if (kernel_thread(lcs_recovery, (void *) card, SIGCHLD) < 0)
+			printk(KERN_WARNING "Could not start kernel thread at %s:%d\n",
+				__FUNCTION__, __LINE__);
 #ifdef CONFIG_IP_MULTICAST
 	if (lcs_do_start_thread(card, LCS_SET_MC_THREAD))
-		kernel_thread(lcs_register_mc_addresses,
-				(void *) card, SIGCHLD);
+		if (kernel_thread(lcs_register_mc_addresses,
+				(void *) card, SIGCHLD) < 0)
+			printk(KERN_WARNING "Could not start kernel thread at %s:%d\n",
+				__FUNCTION__, __LINE__);
 #endif
 }
 
--- a/drivers/s390/net/qeth_main.c
+++ b/drivers/s390/net/qeth_main.c
@@ -1048,11 +1048,17 @@ qeth_start_kernel_thread(struct qeth_car
 		return;
 
 	if (qeth_do_start_thread(card, QETH_SET_IP_THREAD))
-		kernel_thread(qeth_register_ip_addresses, (void *)card,SIGCHLD);
+		if (kernel_thread(qeth_register_ip_addresses, (void *)card,SIGCHLD) < 0)
+			printk(KERN_WARNING "Could not start kernel thread at %s:%d\n",
+				__FUNCTION__, __LINE__);
 	if (qeth_do_start_thread(card, QETH_SET_PROMISC_MODE_THREAD))
-		kernel_thread(qeth_set_promisc_mode, (void *)card, SIGCHLD);
+		if (kernel_thread(qeth_set_promisc_mode, (void *)card, SIGCHLD) < 0)
+			printk(KERN_WARNING "Could not start kernel thread at %s:%d\n",
+				__FUNCTION__, __LINE__);
 	if (qeth_do_start_thread(card, QETH_RECOVER_THREAD))
-		kernel_thread(qeth_recover, (void *) card, SIGCHLD);
+		if (kernel_thread(qeth_recover, (void *) card, SIGCHLD) < 0)
+			printk(KERN_WARNING "Could not start kernel thread at %s:%d\n",
+				__FUNCTION__, __LINE__);
 }
 
 
--- a/init/main.c
+++ b/init/main.c
@@ -389,7 +389,11 @@ #endif
 static void noinline rest_init(void)
 	__releases(kernel_lock)
 {
-	kernel_thread(init, NULL, CLONE_FS | CLONE_SIGHAND);
+	if (kernel_thread(init, NULL, CLONE_FS | CLONE_SIGHAND) < 0) {
+		printk(KERN_CRIT "Unable to start kernel thread at %s:%d\n",
+			__FUNCTION__, __LINE__);
+		BUG();
+	}
 	numa_default_policy();
 	unlock_kernel();
 
--- a/net/bluetooth/rfcomm/core.c
+++ b/net/bluetooth/rfcomm/core.c
@@ -2052,11 +2052,15 @@ static CLASS_ATTR(rfcomm_dlc, S_IRUGO, r
 /* ---- Initialization ---- */
 static int __init rfcomm_init(void)
 {
+	int ret;
 	l2cap_load();
 
 	hci_register_cb(&rfcomm_cb);
 
-	kernel_thread(rfcomm_run, NULL, CLONE_KERNEL);
+	ret = kernel_thread(rfcomm_run, NULL, CLONE_KERNEL);
+	
+	if (ret < 0)
+		return ret;
 
 	class_create_file(bt_class, &class_attr_rfcomm_dlc);
 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
