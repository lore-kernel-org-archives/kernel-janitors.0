From: Joe Perches <joe@perches.com>
Date: Sun, 27 Sep 2020 17:45:45 +0000
Subject: Re: [Cocci] coccinelle: Convert comma to semicolons (was Re: [PATCH] checkpatch: Add test for comma 
Message-Id: <983c49ebe4bbe0435a73d25cd8525764a4f8adac.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87r1qqvo2d.fsf@nanos.tec.linutronix.de>
 <a53048f738dacc1c58654eb94e229de79d4f94c2.camel@perches.com>
 <alpine.DEB.2.22.394.2009271907270.2839@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2009271907270.2839@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Giuseppe Scrivano <gscrivan@redhat.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, lkp <lkp@intel.com>, kernelnewbies <kernelnewbies@kernelnewbies.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, cocci <cocci@systeme.lip6.fr>, Andy Whitcroft <apw@shadowen.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel-mentees@lists.linuxfoundation.org, Andrew Morton <akpm@linux-foundation.org>

On Sun, 2020-09-27 at 19:08 +0200, Julia Lawall wrote:
> I end up with 208 patches.  I'm not sure that sending them all at once
> would be a good idea...

Last I looked the diffstat for comma -> semicolon was:

234 files changed, 509 insertions(+), 509 deletions(-)

So it would be nearly 1 patch per individual file,

Greg KH does send hundreds of patches for -stable at a time.

So, maybe or maybe not send them all at once.
Maybe send it in batches of 25 or so.

There's no single right way to do this.

Maybe put up a git tree somewhere and let the
kernel-robot test compilation.

(A nicety might be for the kernel-robot to have some
 option to test pre and post compilation object code
 differences with an optional report)

When I automated 491 patches for /* fallthrough */ to
fallthrough;, the robot caught a couple problems which
was great.

https://repo.or.cz/linux-2.6/trivial-mods.git/shortlog/refs/heads/20200310_fallthrough_2

I only posted the first ~30 patches though with
about 50% acceptance. Gustavo Silva picked up the
effort and did a great job.  Eventually, a single
treewide patch was posted and accepted by Linus for
this though after dozens of individual patches went
through various maintainer trees:

$ git log --shortstat -1 df561f6688fe
commit df561f6688fef775baa341a0f5d960becd248b11
Author: Gustavo A. R. Silva <gustavoars@kernel.org>
Date:   Sun Aug 23 17:36:59 2020 -0500

    treewide: Use fallthrough pseudo-keyword
    
    Replace the existing /* fall through */ comments and its variants with
    the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
    fall-through markings when it is the case.
    
    [1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=>
    
    Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

 1148 files changed, 2667 insertions(+), 2737 deletions(-)
