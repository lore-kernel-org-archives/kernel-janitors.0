From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 29 Sep 2004 17:23:49 +0000
Subject: [Kernel-janitors] Re: sbus/aurora: replace schedule_timeout() with
Message-Id: <20040929172349.GB1652@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48012635655726199=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040929161006.GA3599@masina.coderock.org>
In-Reply-To: <20040929161006.GA3599@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============48012635655726199==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 29, 2004 at 06:10:06PM +0200, Domen Puncer wrote:
> On 27/09/04 10:24 -0700, Nishanth Aravamudan wrote:
> > -			current->state = TASK_INTERRUPTIBLE;
> > -			schedule_timeout(port->close_delay);
> > +			msleep_interruptible(port->close_delay);
> 
> I think you forgot jiffies_to_msecs here.

Please find the corrected patch below.
Thanks for catching this, Domen.


--- 2.6.9-rc2-vanilla/drivers/sbus/char/aurora.c	2004-09-13 17:16:08.000000000 -0700
+++ 2.6.9-rc2/drivers/sbus/char/aurora.c	2004-09-29 10:19:14.000000000 -0700
@@ -1519,8 +1519,7 @@ static void aurora_close(struct tty_stru
 		 */
 		timeout = jiffies+HZ;
 		while(port->SRER & SRER_TXEMPTY)  {
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(port->timeout);
+			msleep_interruptible(jiffies_to_msecs(port->timeout));
 			if (time_after(jiffies, timeout))
 				break;
 		}
@@ -1538,8 +1537,7 @@ static void aurora_close(struct tty_stru
 	port->tty = 0;
 	if (port->blocked_open) {
 		if (port->close_delay) {
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(port->close_delay);
+			msleep_interruptible(jiffies_to_msecs(port->close_delay));
 		}
 		wake_up_interruptible(&port->open_wait);
 	}

--===============48012635655726199==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48012635655726199==--
