From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:35:32 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 15/16] scsi/st: replace
Message-Id: <20040927183532.GD1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20404083982499621=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040917180230.GP1712@us.ibm.com>
In-Reply-To: <20040917180230.GP1712@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============20404083982499621==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/scsi/st.c	2004-09-13 17:16:00.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/st.c	2004-09-14 09:20:30.000000000 -0700
@@ -757,8 +757,7 @@ static int test_ready(Scsi_Tape *STp, in
 
 			if (scode == NOT_READY) {
 				if (waits < max_wait) {
-					set_current_state(TASK_INTERRUPTIBLE);
-					schedule_timeout(HZ);
+					msleep_interruptible(1000);
 					if (signal_pending(current)) {
 						retval = (-EINTR);
 						break;

--===============20404083982499621==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20404083982499621==--
