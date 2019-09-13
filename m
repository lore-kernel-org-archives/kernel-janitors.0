From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 13 Sep 2019 14:24:37 +0000
Subject: Re: Queries of an aspiring kernel developer
Message-Id: <alpine.DEB.2.21.1909131623300.2767@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190912142517.GA22751@SARKAR> <20190913132310.GQ20699@kadam>
 <20190913141935.GA309@SARKAR>
In-Reply-To: <20190913141935.GA309@SARKAR>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rohit Sarkar <rohitsarkar5398@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, kernelnewbies@kernelnewbies.org



On Fri, 13 Sep 2019, Rohit Sarkar wrote:

> On Fri, Sep 13, 2019 at 04:23:10PM +0300, Dan Carpenter wrote:
> > On Thu, Sep 12, 2019 at 07:55:17PM +0530, Rohit Sarkar wrote:
> > > Hi Dan,
> > > First things first, I know that sending private emails is frowned upon
> > > but I was unsure if this would belong in the list.
> >
> > This does belong on the list.  Especially the kernel-janitor list.
>
> Added kernel-janitors and kernel-newbies to the thread.
> > > Secondly I will keep
> > > this as short as possible. (I know you are lazy :) )
> > >
> > > I have been interested in kernel development for a long time and want to
> > > contribute to the community while learning and having fun.
> > > Till now I have sent some minor patches:
> > > [1]: Fixes typo
> > > [2]: Checkpatch fix
> > > [3]: Replaces snprintf with scnprintf
> > >
> > > I now would like to work on something that is not too trivial (like a
> > > typo/checkpatch fix) and not too complex. I am finding it difficult to
> > > come up with something substantial to work on.
> >
> > The various intern project probably have ideas.  Julia Lawall may know.
> >
> Sure, will get in touch with her.
>
> > > It would really help me if you could point me in a direction where I could
> > > focus my efforts on.
> >
> > What I always tell people is to pick a small driver from staging.  The
> > iio drivers are pretty small.  Just try to fix it as much as possible.
> > Read it and re-read it and patch it and patch it.  As you go you will
> > learn more until you are the expert of that driver.  Try to get it
> > moved out of staging.
>
> This sounds nice. Would this require any external hardware for testing?
> > regards,
> > dan carpenter
> Thanks a lot for taking the time to reply.

Dan's suggestions are fine.  You may want to take a fairly recent driver
from staging (to check using git log) to be sure that the work has not
already been done by others.

julia
