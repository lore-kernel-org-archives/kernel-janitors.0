From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 21:32:07 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/33] char/drm_os_linux: replace
Message-Id: <20040915213207.GH5778@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20965267639238117=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============20965267639238117==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/drm/drm_os_linux.h	2004-09-09 23:05:38.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/drm/drm_os_linux.h	2004-09-10 10:34:04.000000000 -0700
@@ -134,7 +134,7 @@ do {								\
 	add_wait_queue(&(queue), &entry);			\
 								\
 	for (;;) {						\
-		current->state = TASK_INTERRUPTIBLE;		\
+		set_current_state(TASK_INTERRUPTIBLE);		\
 		if (condition)					\
 			break;					\
 		if (time_after_eq(jiffies, end)) {		\

--===============20965267639238117==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20965267639238117==--
