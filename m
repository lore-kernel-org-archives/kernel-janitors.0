From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Jul 2013 07:25:02 +0000
Subject: Re: Require mentoring for picking up
Message-Id: <20130703072502.GA22937@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CANpOL-w=W47NUg04nHRtL4S+Fpgt7SbigCwigHCsda31woccvQ@mail.gmail.com>
In-Reply-To: <CANpOL-w=W47NUg04nHRtL4S+Fpgt7SbigCwigHCsda31woccvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I have chopped your email up to respond to the easy bits first.

> I looked at the mailing lists and found no one is working on this.
> Please correct my understanding. I am new to kernel newbies, so this
> is what i think before starting:-
> 1. Contact Hans Grobler for starting up ?

Don't do that.  He wasn't offering to teach people he was just
suggesting ideas.

> 2. Find files with ioctl functions already implemented and do the
> required assessment.
> 
> Also, needed some advise on git branching to work on the kernel.

linux-next.

> "...From: Hans Grobler
> - audit ioctl functions to make sure there is no way a user can crash
> the machine or do sensitive stuff. For example, check for the
> necessary capabilities. Check that no userspace pointers are accessed
> directly. be careful with this... it takes a while to figure out which
> ioctls are covered by the parent ioctl function (these can be nested
> to great depths)..."
> 

Looking for these sort of security bugs is fun.

These days userspace pointers are annotated with the __user tag and
Sparse warns if they are used incorrectly.

	"warning: dereference of noderef expression"

We are pretty good about eliminating these kinds of bugs.  You will
find some warnings still, but the majority are false positives.

Really this task is quite hard because people are constantly looking
for security bugs.  I do with Smatch.  But in drivers/staging/ there
are still quite a few left.

Btw, most times when you think you have found a security bug in an
ioctl, you really haven't.  There is always some reason why the bug
is hard to exploit.  If you think you have found one, then let us
know on the list and we can check it for you.  (It's fine to discuss
security bugs from drivers/staging/ in public, no one will get
upset.  I fix these sorts of thing regularly.)

regards,
dan carpenter

