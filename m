From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 02 May 2015 17:33:29 +0000
Subject: Re: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <20150502173329.GA15060@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
In-Reply-To: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, May 02, 2015 at 05:17:14PM +0000, Drokin, Oleg wrote:
> >> Now I like to see the current situation change and Greg you have know
> >> me for a while so you can expect a lot of changes are coming.  In fact
> >> I already have rallied people from vendors outside Intel as well as
> >> universities which have done some excellent work which you will soon
> >> see. Now I hope this is the last email I do like this. Instead I just
> >> want to send you patches. Greg I think the changes you will see soon
> >> will remove your frustration.
> > 
> > When is "soon"?  How about, if I don't see some real work happening from
> > you all in the next 2 months (i.e. before 4.1-final), I drop lustre from
> > the tree in 4.2-rc1.  Given that you all have had over 2 years to get
> > your act together, and nothing has happened, I think I've been waiting
> > long enough, don't you?
> 
> I agree we've been much slower in doing a bunch of requested cleanups than initially
> hoped for variety of reasons, not all of which are under our direct control.
> 
> Still, please don't drop Lustre client from the staging tree. People seem to be
> actively using that port too (on smaller scale) and we'll improve the cleanups
> situation.

"much slower"?  Seriously?  It would take one junior developer a month
tops to clean up all of the obvious issues with the in-kernel code, so
that you could then tackle the real issues.  A "good" developer could do
it all in a single week.  As that's obviously not going to ever happen,
I have no choice but to delete the code from the kernel tree as no one
is working to get it out of staging at all.

Also, having it in the tree is wasting core kernel developer's time and
energy trying to work around things in your codebase.

You all have this development cycle to change this behavior.

greg k-h
