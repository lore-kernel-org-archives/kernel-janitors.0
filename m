From: nhorman@tuxdriver.com
Date: Fri, 28 Jul 2006 20:07:35 +0000
Subject: [KJ]  audit return code handling for kernel_thread [5/11]
Message-Id: <200607282007.k6SK7ZN7009626@ra.tuxdriver.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200607282007.k6SK75MK009573@ra.tuxdriver.com>
In-Reply-To: <200607282007.k6SK75MK009573@ra.tuxdriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: fpavlic@de.ibm.com, kernel-janitors@osdl.org, linux-kernel@vger.kernel.org, nhorman@tuxdriver.com

Audit/Cleanup of kernel_thread calls, specifically checking of return codes.
    Problems seemed to fall into 3 main categories:
    
    1) callers of kernel_thread were inconsistent about meaning of a zero return
    code.  Some callers considered a zero return code to mean success, others took
    it to mean failure.  a zero return code, while not actually possible in the
    current implementation, should be considered a success (pid 0 is/should be
    valid). fixed all callers to treat zero return as success
    
    2) caller of kernel_thread saved return code of kernel_thread for later use
    without ever checking its value.  Callers who did this tended to assume a
    non-zero return was success, and would often wait for a completion queue to be
    woken up, implying that an error (negative return code) from kernel_thread could
    lead to deadlock.  Repaired by checking return code at call time, and setting
    saved return code to zero in the event of an error.
    
    3) callers of kernel_thread never bothered to check the return code at all.
    This can lead to seemingly unrelated errors later in execution.  Fixed by
    checking return code at call time and printing a warning message on failure.

Regards
Neil
    
Signed-off-by: Neil Horman <nhorman@tuxdriver.com>


 drivers/s390/net/lcs.c         |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
--- a/drivers/s390/net/lcs.c
+++ b/drivers/s390/net/lcs.c
@@ -1729,11 +1729,13 @@ lcs_start_kernel_thread(struct lcs_card 
 {
 	LCS_DBF_TEXT(5, trace, "krnthrd");
 	if (lcs_do_start_thread(card, LCS_RECOVERY_THREAD))
-		kernel_thread(lcs_recovery, (void *) card, SIGCHLD);
+		if (kernel_thread(lcs_recovery, (void *) card, SIGCHLD) < 0)
+			printk(KERN_WARNING "Could not start lcs recovery thread\n");
 #ifdef CONFIG_IP_MULTICAST
 	if (lcs_do_start_thread(card, LCS_SET_MC_THREAD))
-		kernel_thread(lcs_register_mc_addresses,
-				(void *) card, SIGCHLD);
+		if (kernel_thread(lcs_register_mc_addresses,
+				(void *) card, SIGCHLD) < 0)
+			printk(KERN_WARNING "Could not start lcs mc thread\n");
 #endif
 }
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
