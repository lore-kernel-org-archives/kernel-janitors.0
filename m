From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 03 Nov 2004 17:55:23 +0000
Subject: [KJ] [PATCH] class/usblp: cleanup usblp_write()
Message-Id: <20041103175523.GC2163@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041022225624.GE11126@us.ibm.com>
In-Reply-To: <20041022225624.GE11126@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Nov 02, 2004 at 03:04:15PM -0800, Nishanth Aravamudan wrote:
> On Sat, Oct 23, 2004 at 02:20:00AM +0200, Oliver Neukum wrote:
> > Am Samstag, 23. Oktober 2004 00:56 schrieb Nishanth Aravamudan:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0while (timeout) {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0if (signal_pending(current)) {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0remove_wait_queue(&usblp=
->wait, &wait);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return writecount ? writ=
ecount : -EINTR;
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0set_current_state(TASK_INTERRUPTIBLE);
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0if (timeout && !usblp->wcomplete) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0timeout =3D schedule_tim=
eout(timeout);
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0} else {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0set_current_state(TASK_R=
UNNING);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0if (usblp->wcomplete) {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0set_current_state(TASK_INTERRUPTIBLE);
> >=20
> > You can miss a wake up here.
> >=20
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0timeout =3D schedule_timeout(timeout);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0}
> >=20
> > The order of checking wcomplete and setting the state must be reversed.
>=20
> OK, thanks for the pointer. Please find the corrected patch below.

Sorry, I missed a reassignment of the state to TASK_RUNNING in this
patch. Thanks, Domen, for cathing this. Please find the (further)
corrected patch below.

Description: The while-loop seemed excessively blocked with
conditionals. By reorganizing the code so timeout is the condition for
the loop and changing the checks within the loop, several lines of code
were removed.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.10-rc1-vanilla/drivers/usb/class/usblp.c	2004-10-30 15:33:37.000000=
000 -0700
+++ 2.6.10-rc1/drivers/usb/class/usblp.c	2004-11-03 09:54:41.000000000 -0800
@@ -636,19 +636,17 @@ static ssize_t usblp_write(struct file *
=20
 			timeout =3D USBLP_WRITE_TIMEOUT;
 			add_wait_queue(&usblp->wait, &wait);
-			while ( 1=3D1 ) {
-
+			while (timeout) {
 				if (signal_pending(current)) {
 					remove_wait_queue(&usblp->wait, &wait);
 					return writecount ? writecount : -EINTR;
 				}
 				set_current_state(TASK_INTERRUPTIBLE);
-				if (timeout && !usblp->wcomplete) {
-					timeout =3D schedule_timeout(timeout);
-				} else {
+				if (usblp->wcomplete) {
 					set_current_state(TASK_RUNNING);
 					break;
 				}
+				timeout =3D schedule_timeout(timeout);
 			}
 			remove_wait_queue(&usblp->wait, &wait);
 		}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
