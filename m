From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 22:56:24 +0000
Subject: [KJ] [PATCH] class/usblp: cleanup usblp_write()
Message-Id: <20041022225624.GE11126@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30788715070155459=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============30788715070155459==
Content-Type: text/PLAIN; charset=us-ascii
Content-Disposition: inline

Hello,

In the process of cleaning up the remaining schedule_timeout()s in the
current kernel, I came across drivers/usb/class/usblp.c::usblp_write().
in this function, the second (counting by nesting) while-loop seemed
very confusing to me. I believe the following patch would have the same
result but is significantly cleaner. Would someone be able to test this
and / or verify my belief?

Thanks,
Nish

Description: The while-loop seemed excessively blocked with
conditionals. By reorganizing the code so timeout is the condition for
the loop and changing the checks within the loop, several lines of code
were removed.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-bk7-vanilla/drivers/usb/class/usblp.c	2004-10-22 10:41:05.000000000 -0700
+++ 2.6.9-bk7/drivers/usb/class/usblp.c	2004-10-22 15:48:38.000000000 -0700
@@ -636,19 +636,16 @@ static ssize_t usblp_write(struct file *
 
 			timeout = USBLP_WRITE_TIMEOUT;
 			add_wait_queue(&usblp->wait, &wait);
-			while ( 1==1 ) {
-
+			while (timeout) {
 				if (signal_pending(current)) {
 					remove_wait_queue(&usblp->wait, &wait);
 					return writecount ? writecount : -EINTR;
 				}
-				set_current_state(TASK_INTERRUPTIBLE);
-				if (timeout && !usblp->wcomplete) {
-					timeout = schedule_timeout(timeout);
-				} else {
-					set_current_state(TASK_RUNNING);
+				if (usblp->wcomplete) {
 					break;
 				}
+				set_current_state(TASK_INTERRUPTIBLE);
+				timeout = schedule_timeout(timeout);
 			}
 			remove_wait_queue(&usblp->wait, &wait);
 		}

--===============30788715070155459==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30788715070155459==--
