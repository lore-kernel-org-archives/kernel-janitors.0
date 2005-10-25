From: irwan.djajadi@iname.com
Date: Tue, 25 Oct 2005 03:15:08 +0000
Subject: Re: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/block/swim_iop.c: replace
Message-Id: <20051025031508.GB22046@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85422110853788746=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023025351.GC2438@poopie.dyndns.org>
In-Reply-To: <20051023025351.GC2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============85422110853788746==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 25, 2005 at 01:25:21AM +0400, Alexey Dobriyan wrote:
> On Sat, Oct 22, 2005 at 09:56:31PM -0500, irwan.djajadi@iname.com wrote:
> > --- 2.6.14-rc5/drivers/block/swim_iop.c
> > +++ mod/drivers/block/swim_iop.c
> > @@ -436,7 +436,7 @@ static int grab_drive(struct floppy_stat
> >  				local_irq_restore(flags);
> >  				return -EINTR;
> >  			}
> > -			interruptible_sleep_on(&fs->wait);
> > +			wait_event_interruptible(fs->wait, fs->state == available);
> >  		}
> >  		--fs->wanted;
> >  	}
> 
> Ditto. local_irq_save().
> 

Yup, ditto as well.. :-)

Here's my next try. Thanks man
--
Irwan



Fix interruptible_sleep_on() with wait_event_interruptible() or wait_event(),
and fix waiting while interrupt is disabled.

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/block/swim_iop.c mod/drivers/block/swim_iop.c
--- 2.6.14-rc5/drivers/block/swim_iop.c	2005-10-22 00:06:17.000000000 -0500
+++ mod/drivers/block/swim_iop.c	2005-10-24 22:01:34.000000000 -0500
@@ -426,23 +426,27 @@ static int grab_drive(struct floppy_stat
 		      int interruptible)
 {
 	unsigned long flags;
+	int err = 0;
 
 	local_irq_save(flags);
-	if (fs->state != idle) {
+	while ((fs->state != idle) && !err) {
 		++fs->wanted;
-		while (fs->state != available) {
-			if (interruptible && signal_pending(current)) {
-				--fs->wanted;
-				local_irq_restore(flags);
-				return -EINTR;
-			}
-			interruptible_sleep_on(&fs->wait);
+		local_irq_restore(flags);
+		if (interruptible) {
+			err = wait_event_interruptible(fs->wait,
+				fs->state == available);
+			if (err)
+				err = -EINTR;
+		} else {
+			wait_event(fs->wait, fs->state == available);
 		}
+		local_irq_save(flags);
 		--fs->wanted;
 	}
-	fs->state = state;
+	if (!err)
+		fs->state = state;
 	local_irq_restore(flags);
-	return 0;
+	return err;
 }
 
 static void release_drive(struct floppy_state *fs)

--===============85422110853788746==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85422110853788746==--
