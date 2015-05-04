From: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Date: Mon, 04 May 2015 21:26:40 +0000
Subject: Re: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <20150504212640.GA12856@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
In-Reply-To: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, May 04, 2015 at 02:07:13PM +0000, Simmons, James A. wrote:
> >> > When is "soon"?  How about, if I don't see some real work happening from
> >> > you all in the next 2 months (i.e. before 4.1-final), I drop lustre from
> >> > the tree in 4.2-rc1.  Given that you all have had over 2 years to get
> >> > your act together, and nothing has happened, I think I've been waiting
> >> > long enough, don't you?
> 
> As you see from a earlier email from Oleg work is being done to change things.

I've heard that before, and again, I don't believe it :)

Please prove me wrong.

> >> I agree we've been much slower in doing a bunch of requested cleanups than initially
> >> hoped for variety of reasons, not all of which are under our direct control.
> >> 
> >> Still, please don't drop Lustre client from the staging tree. People seem to be
> >> actively using that port too (on smaller scale) and we'll improve the cleanups
> >> situation.
> >
> >"much slower"?  Seriously?  It would take one junior developer a month
> >tops to clean up all of the obvious issues with the in-kernel code, so
> >that you could then tackle the real issues.  A "good" developer could do
> >it all in a single week.  As that's obviously not going to ever happen,
> >I have no choice but to delete the code from the kernel tree as no one
> >is working to get it out of staging at all.
> >
> >Also, having it in the tree is wasting core kernel developer's time and
> >energy trying to work around things in your codebase.
> 
> Since I'm just starting to get involved in this work I'm not aware of the
> task you are looking for. What needs to be done from your perspective?

Oh my.  A simple use of checkpatch.pl can show you well over a hundred
different files with obvious basic issues.  If you all don't realize
this doesn't need to be fixed, I might as well just delete the code now.

Then there's the wrappers on wrappers on wrappers issues.  Please remove
them all, they are not needed.

> One of the things I have discussed with other developers is the idea
> of breaking the cleanup into two stages. First is bringing  libcfs/lnet
> up to date and synced to the upstream standards.

"two stages"?  Did you miss the point where I said it would take someone
max one week to do all of this work?  Why make it take longer than it
has to?

> This is due to lustre being a application of LNet. LNet is used by
> various vendors for other purposes. If this is acceptable to you it
> can be started right away.

I only see one in-kernel user of this code, which is all that matters, I
can't know or care, about what happens outside of the kernel tree.

> Please send of list of task that needs to be done for libcfs/lnet
> work.

Again, this isn't my job to tell you what to do, if you don't know what
needs to be done, then we have much bigger issues to work through here.

good luck,

greg k-h
