From: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Date: Sat, 02 May 2015 08:26:55 +0000
Subject: Re: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <20150502082655.GA6897@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
In-Reply-To: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, May 02, 2015 at 01:18:48AM +0000, Simmons, James A. wrote:
>       Second and far more importantly the upstream lustre code
> currently does not have the same level of QA with what the Intel
> branch gets.  The bar is very very high to get any patch merged for
> the Intel branch. Each patch has to first pass a regression test suite
> besides the normal review process.

Pointers to this regression test suite?  Why can't we run it ourselves?
Why not add it to the kernel test scripts?

> Besides that sites like ORNL have to evaluated all the changes at all
> the scales present on site.

I don't understand what this sentence means.

> This means doing testing on Titan because unique problems only show up
> at that scale.

What is "Titan"?

> Because of this the work that will soon come your way has to be first
> evaluated on the Intel branch since this is the current path for QA.
> You can think of the intel branch as a lustre-next branch that needs
> to be feed back too your branch. Eventually your branch will have to
> under go this level of QA but we are not quite their yet.

No, the intel branch is not lustre-next because I get changes into my
branch that never show up in yours first.  The feedback loop should be
the other way around, you need to do development in the in-kernel tree,
as soon as possible, which isn't happening.  You also have bugfixes that
have been sent to you that you are sitting on for a long time that are
not merged in either your tree, or mine, why is that?

Your user/kernel apis are very "odd" and is what is going to be the
toughest thing to fix up here in the long run.  The sooner you get the
more basic issues fixed up (api wrappers, obvious coding style fixes,
sparse fixes, etc.) the sooner you can get to the real work that needs
to happen.  So far, I have seen no goal of anyone here to do this work,
which makes me want to just drop the whole thing, as the goal of staging
is not to get it merged and run away, but to actually work on cleaning
things up, in the tree, in the correct way.  And that isn't happening
at all here.

And again, this is the _easy_ work to do.  No hard work has even started
to happen.  You all are ignoring this easy stuff, and have been for
years, which is troubling.

> Now I like to see the current situation change and Greg you have know
> me for a while so you can expect a lot of changes are coming.  In fact
> I already have rallied people from vendors outside Intel as well as
> universities which have done some excellent work which you will soon
> see. Now I hope this is the last email I do like this. Instead I just
> want to send you patches. Greg I think the changes you will see soon
> will remove your frustration.

When is "soon"?  How about, if I don't see some real work happening from
you all in the next 2 months (i.e. before 4.1-final), I drop lustre from
the tree in 4.2-rc1.  Given that you all have had over 2 years to get
your act together, and nothing has happened, I think I've been waiting
long enough, don't you?

thanks,

greg k-h
