From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Oct 2005 04:05:56 +0000
Subject: Re: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/block/acsi_slm.c: replace
Message-Id: <20051025040556.GA4597@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52391051762754426=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023025351.GC2438@poopie.dyndns.org>
In-Reply-To: <20051023025351.GC2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============52391051762754426==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 24.10.2005 [18:46:01 -0500], Irwan Djajadi wrote:
> Alexey Dobriyan wrote:
> 
> >On Sat, Oct 22, 2005 at 09:53:51PM -0500, irwan.djajadi@iname.com wrote:
> > 
> >
> >>drivers/block/acsi_slm.c: replace interruptible_sleep_on() with
> >>wait_event_interruptible()
> >>   
> >>
> >
> > 
> >
> >>--- 2.6.14-rc5/drivers/block/acsi_slm.c
> >>+++ mod/drivers/block/acsi_slm.c
> >>@@ -627,7 +627,7 @@ static ssize_t slm_write( struct file *f
> >>
> >>	while( SLMState == PRINTING ||
> >>		   (SLMState == FILLING && SLMBufOwner != device) ) {
> >>-		interruptible_sleep_on( &slm_wait );
> >>+		wait_event_interruptible( slm_wait, SLMState==IDLE );
> >>		if (signal_pending(current))
> >>			return( -ERESTARTSYS );
> >>	}
> >>   
> >>
> >
> >acsi_slm_replace_interruptible_sleep_on_with_wait_event_interruptible.patch
> >from -kj looks more correct.
> >
> >From: Nishanth Aravamudan
> >
> >Use wait_event_interruptible() instead of the deprecated
> >interruptible_sleep_on(). The sleep_on() call later in the same
> >function is replaced with inline wait-queue code which achieves the
> >same. This required adding a local wait-queue, though.
> >
> >--- a/drivers/block/acsi_slm.c
> >+++ b/drivers/block/acsi_slm.c
> >@@ -625,12 +626,10 @@ static ssize_t slm_write( struct file *f
> >	int		device = iminor(node);
> >	int		n, filled, w, h;
> >
> >-	while( SLMState == PRINTING ||
> >-		   (SLMState == FILLING && SLMBufOwner != device) ) {
> >-		interruptible_sleep_on( &slm_wait );
> >-		if (signal_pending(current))
> >-			return( -ERESTARTSYS );
> >-	}
> >+	wait_event_interruptible(slm_wait, (SLMState != PRINTING &&
> >+				(SLMState != FILLING || SLMBufOwner == 
> >device)));
> >+	if (signal_pending(current))
> >+		return -ERESTARTSYS;
> >	if (SLMState == IDLE) {
> >		/* first data of page: get current page size  */
> >		if (slm_get_pagesize( device, &w, &h ))
> >
> > 
> >
> That does look more correct. Please ignore my patch.
> Thanks!

@Irwan:

Have you tested any of the patches you are sending? I stopped replacing
the *sleep_on*() family of functions once I was outside of the domain of
trivial substitution.

You can't simply s/interruptible_sleep_on/wait_event_interruptible/ as
in many places the sleep_on() caller is not a loop, but one-time sleep!
I have noticed at least one case of this in the patches you are sending
out, but will try to make a more complete analysis soon.

@Alexey:

Be very careful pulling in these patches. I don't think any of the
remaining *sleep_on*() replacements are easy or trivial (at least the
ones w/o patches already in -KJ). I'll try to take a look more in depth
soon.

Thanks,
Nish

--===============52391051762754426==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52391051762754426==--
