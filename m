From: Greg KH <gregkh@suse.de>
Date: Thu, 13 Jan 2011 18:29:35 +0000
Subject: Re: [PATCH] Removes warning related to use of uninitialized
Message-Id: <20110113182935.GA31570@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTi=h20J0XhFp2=iGH0WF-uZmWS0cv4018X=h5YBn@mail.gmail.com>
In-Reply-To: <AANLkTi=h20J0XhFp2=iGH0WF-uZmWS0cv4018X=h5YBn@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 12, 2011 at 08:05:10PM -0800, Sukanto Ghosh wrote:
> > If you just set it to NULL, how could it ever not be NULL, so why add
> > this check?
> >
> Because, there is an assignment to i inside the for-each loop (hlist_for_each)
> if it enters the loop.

Which it always will do, right?  So there isn't a problem.

> > Also, no, this isn't correct, i is used in the hlist traversal.
> >
> Indeed it is being used but what if it doesn't enters the loop i.e. if
> h->first is NULL

Can that ever happen?

> It is a different issue whether (h->first != NULL) is a precondition
> to this function

I think it is as it works fine today :)

> but the compiler is warning because there exists a path to access of i->head
> where it might be left uninitialized.

But again, that can never happen, right?

thanks,

greg k-h
