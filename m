From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 04 Apr 2005 21:23:28 +0000
Subject: [KJ] [UPDATE PATCH] usb/digi_acceleport: correct wait-queue state
Message-Id: <20050404212328.GC3082@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3760272603994379=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050404181053.GB3082@us.ibm.com>
In-Reply-To: <20050404181053.GB3082@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============3760272603994379==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 04, 2005 at 11:10:53AM -0700, Nishanth Aravamudan wrote:
> On Wed, Feb 02, 2005 at 11:03:09AM -0800, Nishanth Aravamudan wrote:
> > Hello,
> > 
> > Description: Replace deprecated interruptible_sleep_on_timeout() with direct
> > wait-queue usage. Also replace some rather odd wait-queue usage with the
> > existent macros. Also adjusted the wake_up_interruptible() call appropriately,
> > as I changed all the states to TASK_UNINTERRUPTIBLE (signals were not be checked
> > in the current code). Patch is compile-tested.
> 
> Patch was broken in various ways. Fixed-up below (ends up being fewer
> changes). Please drop previous patch and apply the attached.
> 
> Description: Replace deprecated interruptible_sleep_on_timeout() with
> direct wait-queue usage. Patch is compile-tested.

Original patch was merged into 2.6.11-rc2. Incremental patch for
2.6.11-rc2 attached.

Description: First patch incorrectly changed state of the wait-queue
usage to TASK_UNINTERRUPTIBLE. Reverted to TASK_INTERRUPTIBLE.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- linux-current/drivers/usb/serial/digi_acceleport.c	2005-04-04 14:17:14.000000000 -0700
+++ 2.6.12-rc1-kj/drivers/usb/serial/digi_acceleport.c	2005-04-04 14:19:14.000000000 -0700
@@ -568,6 +568,9 @@ static struct usb_serial_device_type dig
 *  and the sleep.  In other words, spin_unlock_irqrestore and
 *  interruptible_sleep_on_timeout are "atomic" with respect to
 *  wake ups.  This is used to implement condition variables.
+*
+*  interruptible_sleep_on_timeout is deprecated and has been replaced
+*  with the equivalent code.
 */
 
 static inline long cond_wait_interruptible_timeout_irqrestore(
@@ -576,13 +579,12 @@ static inline long cond_wait_interruptib
 {
 	DEFINE_WAIT(wait);
 
-	prepare_to_wait(q, &wait, TASK_UNINTERRUPTIBLE);
+	prepare_to_wait(q, &wait, TASK_INTERRUPTIBLE);
 	spin_unlock_irqrestore(lock, flags);
 	timeout = schedule_timeout(timeout);
 	finish_wait(q, &wait);
 
 	return timeout;
-
 }
 
 
@@ -1596,7 +1598,7 @@ dbg( "digi_close: TOP: port=%d, open_cou
 			dbg( "digi_close: write oob failed, ret=%d", ret );
 
 		/* wait for final commands on oob port to complete */
-		prepare_to_wait(&priv->dp_flush_wait, &wait, TASK_UNINTERRUPTIBLE);
+		prepare_to_wait(&priv->dp_flush_wait, &wait, TASK_INTERRUPTIBLE);
 		schedule_timeout(DIGI_CLOSE_TIMEOUT);
 		finish_wait(&priv->dp_flush_wait, &wait);
 
@@ -1995,7 +1997,7 @@ opcode, line, status, val );
 
 		} else if( opcode == DIGI_CMD_IFLUSH_FIFO ) {
 
-			wake_up( &priv->dp_flush_wait );
+			wake_up_interruptible( &priv->dp_flush_wait );
 
 		}
 

--===============3760272603994379==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3760272603994379==--
