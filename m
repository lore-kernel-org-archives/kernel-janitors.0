From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 07 Aug 2005 22:44:22 +0000
Subject: [KJ] [PATCH] atm_zatm.h: remove unused things
Message-Id: <20050807224422.GA26258@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58154384388768388=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58154384388768388==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 include/linux/atm_zatm.h |   15 ---------------
 1 files changed, 15 deletions(-)

diff -uprN linux-vanilla/include/linux/atm_zatm.h linux-zatm/include/linux/atm_zatm.h
--- linux-vanilla/include/linux/atm_zatm.h	2005-08-08 02:17:04.000000000 +0400
+++ linux-zatm/include/linux/atm_zatm.h	2005-08-08 02:40:54.000000000 +0400
@@ -7,11 +7,6 @@
 #ifndef LINUX_ATM_ZATM_H
 #define LINUX_ATM_ZATM_H
 
-/*
- * Note: non-kernel programs including this file must also include
- * sys/types.h for struct timeval
- */
-
 #include <linux/atmapi.h>
 #include <linux/atmioc.h>
 
@@ -35,18 +30,8 @@ struct zatm_pool_req {
 	struct zatm_pool_info info;	/* actual information */
 };
 
-struct zatm_t_hist {
-	struct timeval real;		/* real (wall-clock) time */
-	struct timeval expected;	/* expected real time */
-};
-
-
-#define ZATM_OAM_POOL		0	/* free buffer pool for OAM cells */
 #define ZATM_AAL0_POOL		1	/* free buffer pool for AAL0 cells */
 #define ZATM_AAL5_POOL_BASE	2	/* first AAL5 free buffer pool */
 #define ZATM_LAST_POOL	ZATM_AAL5_POOL_BASE+10 /* max. 64 kB */
 
-#define ZATM_TIMER_HISTORY_SIZE	16	/* number of timer adjustments to
-					   record; must be 2^n */
-
 #endif


--===============58154384388768388==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58154384388768388==--
