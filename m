From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 17:52:20 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 11/15] isdn/icn: change units of
Message-Id: <20040917175220.GL1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79863236752526445=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============79863236752526445==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2.

Description: Change units of ICN_BOOT_TIMEOUT1 to msecs instead of
jiffies for msleep_interruptible() in icn.c. Also, remove unused
constant ICN_CHANLOCK_DELAY.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/icn/icn.h	2004-09-13 17:16:04.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/icn/icn.h	2004-09-17 10:43:35.000000000 -0700
@@ -70,8 +70,7 @@ typedef struct icn_cdef {
 #define ICN_FLAGS_RUNNING  4    /* Cards driver activated                  */
 #define ICN_FLAGS_RBTIMER  8    /* cyclic scheduling of B-Channel-poll     */
 
-#define ICN_BOOT_TIMEOUT1  (HZ) /* Delay for Boot-download (jiffies)       */
-#define ICN_CHANLOCK_DELAY (HZ/10)	/* Delay for Channel-mapping (jiffies)     */
+#define ICN_BOOT_TIMEOUT1  (1000) /* Delay for Boot-download (jiffies)       */
 
 #define ICN_TIMER_BCREAD (HZ/100)	/* B-Channel poll-cycle                    */
 #define ICN_TIMER_DCREAD (HZ/2) /* D-Channel poll-cycle                    */

--===============79863236752526445==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79863236752526445==--
