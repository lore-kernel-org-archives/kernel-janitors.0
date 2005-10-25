From: irwan.djajadi@iname.com
Date: Tue, 25 Oct 2005 03:12:53 +0000
Subject: Re: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/block/swim3.c: replace
Message-Id: <20051025031253.GA22046@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79445201817489774=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023025351.GC2438@poopie.dyndns.org>
In-Reply-To: <20051023025351.GC2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============79445201817489774==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 25, 2005 at 01:23:20AM +0400, Alexey Dobriyan wrote:
> On Sat, Oct 22, 2005 at 09:55:25PM -0500, irwan.djajadi@iname.com wrote:
> > --- 2.6.14-rc5/drivers/block/swim3.c
> > +++ mod/drivers/block/swim3.c
> > @@ -800,7 +800,7 @@ static int grab_drive(struct floppy_stat
> 
>         save_flags(flags);
> 	cli();
> 	if (fs->state != idle) {
> 		++fs->wanted;
> 		while (fs->state != available) {
> 			if (interruptible && signal_pending(current)) {
> >  				restore_flags(flags);
> >  				return -EINTR;
> >  			}
> > -			interruptible_sleep_on(&fs->wait);
> > +			wait_event_interruptible(fs->wait, fs->state == available);
> 
> Correct me if I'm wrong, but level of bugginess remains the same:
> scheduling with interrupts disabled.
> 
> >  		}
> >  		--fs->wanted;
> >  	}
> 

Nope, you're right.. Thanks for catching that.. I didn't think you can sleep
while interrupt is disabled.. Wouldn't the kernel BUG_ON() that ?

Anyway, here's my next try. A word of warning though, I don't have PPC machine
here, so I can't even compile this change. Please let me know if there's
anymore problem with this.

Thanks
--
Irwan


Fix interruptible_sleep_on() with wait_event_interruptible() or wait_event(),
and fix waiting while interrupt is disabled.

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/block/swim3.c mod/drivers/block/swim3.c
--- 2.6.14-rc5/drivers/block/swim3.c	2005-10-22 00:06:17.000000000 -0500
+++ mod/drivers/block/swim3.c	2005-10-24 21:32:44.000000000 -0500
@@ -789,24 +789,29 @@ static int grab_drive(struct floppy_stat
 		      int interruptible)
 {
 	unsigned long flags;
+	int err = 0;
 
 	save_flags(flags);
 	cli();
-	if (fs->state != idle) {
+	while ((fs->state != idle) && !err) {
 		++fs->wanted;
-		while (fs->state != available) {
-			if (interruptible && signal_pending(current)) {
-				--fs->wanted;
-				restore_flags(flags);
-				return -EINTR;
-			}
-			interruptible_sleep_on(&fs->wait);
+		restore_flags(flags);
+		if (interruptible) {
+			err = wait_event_interruptible(fs->wait,
+				fs->state == available);
+			if (err)
+				err = -EINTR;
+		} else {
+			wait_event(fs->wait, fs->state == available);
 		}
+		save_flags(flags);
+		cli();
 		--fs->wanted;
 	}
-	fs->state = state;
+	if (!err)
+		fs->state = state;
 	restore_flags(flags);
-	return 0;
+	return err;
 }
 
 static void release_drive(struct floppy_state *fs)

--===============79445201817489774==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79445201817489774==--
