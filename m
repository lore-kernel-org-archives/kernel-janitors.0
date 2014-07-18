From: Joe Perches <joe@perches.com>
Date: Fri, 18 Jul 2014 22:47:44 +0000
Subject: Re: How to automate checkpatch && get_maintainers && git send-email of commits range?
Message-Id: <1405723664.14358.98.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CANZNk81LiTM9vY0dRV=T0BCT9k-BxU45Ojw_PyOcpdmtXHKM2Q@mail.gmail.com>
	<20140718222215.GF18775@thunk.org>
In-Reply-To: <20140718222215.GF18775@thunk.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Fri, 2014-07-18 at 18:22 -0400, Theodore Ts'o wrote:
> On Fri, Jul 18, 2014 at 05:38:30PM +0300, Andrey Utkin wrote:
> > Is there script for automated checkpatch.pl && get_maintainers.pl &&
> > git send-email for range of commits? I see none. Would it be welcome
> > to submit such one to kernel tree?
> 
> Too much automation can be a really bad thing.  You **really** want to
> sanity check the output of checkpatch.pl

True.

checkpatch should not be used on existing commits.
checkpatch should be used prior to committing.

>  and get_maintainers.pl.

I think checkpatch is pretty good about cc'ing mostly the
right folk by default.

Where it's not adequate is when some particular bit of code
was written by someone not the maintainer and that writer
should also be copied on a patch.

Many different command-line options exist for get_maintainer.
Perhaps too many.  --git-blame can be used with patches to
also list the author of any modified commit.  Using that
option can take a fairly long while to run though.

> Their output is not always correct, and some amount of human common
> sense is required.

True.  Experience is more of a benefit than common sense here.

> And then think very hard about which patches people need to see in
> order to be able to evaluate a patch.  For example, if you have patch
> 1 out of a series which adds a new function, and then patches 2
> through 1000 modify a thousand different drivers to use that new
> function, if you use an automated get_maintainers.pl script to send
> each patch to just the maintainer, then the device driver maintainer
> might not see patch #1 which is critical context to understanding the
> patch that you want to make to his driver.  And then you will have
> several hundred very angry and annoyed developers wondering why you
> sent them patch 345/1000, with no other context, and wondering what
> the heck they are supposed to do with the email that you have just
> launched into their inbox.

There is no good solution to this problem.

You can't cc the world on patch 1/n (vger rejects emails
with too many recipients) and cc just the maintainers on x/n.

One solution is to send the 0/n and 1/n patches to all the
email lists that are cc'd on any single patch of large patch
series.

A better solution might be to send _only_ the 1/n patch to
lkml and to someone like Andrew Morton with an explanation
as to why it's useful, wait for it to be applied, then send
the large patch series during the next release cycle.

> There's a reason why many developers cordially hate these scripts;
> it's too easy to misuse them,

Yup, though cordial can be a misdescription for some of
those developers...

I hope everyone enjoys their weekends...

