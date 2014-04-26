From: Lionel Debroux <lionel_debroux@yahoo.fr>
Date: Sat, 26 Apr 2014 20:09:49 +0000
Subject: Re: [PATCH] drm: make variable named "refcount" atomic, like most refcounts in the kernel.
Message-Id: <535C128D.3070604@yahoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <248367.21250.bm@smtp144.mail.ir2.yahoo.com> <20140426170305.GA17562@mguzik.redhat.com>
In-Reply-To: <20140426170305.GA17562@mguzik.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mateusz Guzik <mguzik@redhat.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> On Sat, Apr 26, 2014 at 06:06:15PM +0200, Lionel Debroux wrote:
> > Based on PaX.
> >
> > ---
> >
> > From 7c712cadd97d43d03ff3d7ca04fd85bd8c6eb34a Mon Sep 17 00:00:00
> > 2001
> > From: Lionel Debroux <lionel_debroux@yahoo.fr>
> > Date: Sat, 26 Apr 2014 15:53:55 +0200
> > Subject: drm: make variable named "refcount" atomic, like most
> > refcounts in the kernel.
> >
> > Extracted from the PaX patch.
> >
> >
> [snip]
> >  	mutex_lock(&item->mutex);
> > -	BUG_ON(item->refcount = 0);
> > +	BUG_ON(atomic_read(&item->refcount) = 0);
> >  	BUG_ON(ref->object != item->object);
> > -	if (--item->refcount = 0) {
> > +	if (atomic_dec_and_test(&item->refcount)) {
> >  		ref->release(ref);
> >  		item->object = NULL;
> >  	}
> 
> I believe this change is in grsecurity so that overflow detector can
> be used,
That's my understanding as well.
> there is clearly no reason to use mere atomic ops.
Yeah, sorry. At least, you're stating it in a nice way.

> It may be that kernel devs would accept a patch implementing generic
> refcount manipulation primitives without atomicity guarantees, which
> could be used in cases like this.
> 
> Then atomic and non-atomic versions could be used to detect
> overflows and overputs at least in debug kernels.
That's a more constructive suggestion indeed, on a useful feature :)

As a hobbyist, once in a while, I wade through PaX/grsec, I read /
extract / submit hunks which are (or at least could be) relevant to
mainline (occasionally failing at picking the right hunks, as shown here
- my earlier patches were alright).
Getting the change you're mentioning merged (should it be considered
desirable in the first place) is probably above my time budget, sadly...


Regards,
Lionel.
