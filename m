From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 07:13:46 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/33] char/drm_os_linux: replace
Message-Id: <20040916071346.GB1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16608709116620091=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040915213207.GH5778@us.ibm.com>
In-Reply-To: <20040915213207.GH5778@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============16608709116620091==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Re-submission of patch incorporating Alan Cox's suggestion of using
__set_current_state() and changing the other direct assignment in the
macro.

Thanks,
Nish

Description: Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-rc2-vanilla/drivers/char/drm/drm_os_linux.h	2004-09-13 17:15:48.000000000 -0700
+++ 2.6.9-rc2/drivers/char/drm/drm_os_linux.h	2004-09-16 00:10:47.000000000 -0700
@@ -134,7 +134,7 @@ do {								\
 	add_wait_queue(&(queue), &entry);			\
 								\
 	for (;;) {						\
-		current->state = TASK_INTERRUPTIBLE;		\
+		__set_current_state(TASK_INTERRUPTIBLE);		\
 		if (condition)					\
 			break;					\
 		if (time_after_eq(jiffies, end)) {		\
@@ -147,7 +147,7 @@ do {								\
 			break;					\
 		}						\
 	}							\
-	current->state = TASK_RUNNING;				\
+	__set_current_state(TASK_RUNNING);			\
 	remove_wait_queue(&(queue), &entry);			\
 } while (0)
 

--===============16608709116620091==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16608709116620091==--
