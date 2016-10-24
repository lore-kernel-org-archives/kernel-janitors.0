From: Theodore Ts'o <tytso@mit.edu>
Date: Mon, 24 Oct 2016 14:20:38 +0000
Subject: Re: MIPS/kernel/r2-to-r6-emul: Use seq_puts() in mipsr2_stats_show()
Message-Id: <20161024142037.rrslfxtimj44s5t6@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3809e713-2f08-db60-92c1-21d735a4f35b@users.sourceforge.net>
 <4126c272-cdf6-677a-fe98-74e8034078d8@users.sourceforge.net>
 <20161024131311.ttwr2bblphg6vd2b@thunk.org>
 <e7ac4cba-bce1-edf5-a537-4c06a357bfb3@users.sourceforge.net>
In-Reply-To: <e7ac4cba-bce1-edf5-a537-4c06a357bfb3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-mips@linux-mips.org, Andrea Gelmini <andrea.gelmini@gelma.net>, Andrew Morton <akpm@linux-foundation.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Ralf =?iso-8859-1?Q?B=E4chle?= <ralf@linux-mips.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Oct 24, 2016 at 04:02:49PM +0200, SF Markus Elfring wrote:
> > You should fix this in all the patches.
> I am curious if a second approach will become acceptable in the near
> future.

I don't know what you were asking.  I was merely point out that the
> wording was factually incorrect in all of the patches, and I didn't
> feel like replying five times to point out the same mistake.

> > since reading from /proc isn't done in a tight loop, and even if it were,
> > the use of vsprintf is the tiniest part of the overhead.
> 
> Thanks for your software development opinion.

It's a lot more than just an opinion.  I challenge you to demonstrate
how much savings it would take.  Try learning how to use another tool
--- say, perf.  Measure how many clock cycles it takes to read from a
proc file that uses seq_printf().  Then measure how many clock cycles
it takes to read from a proc file that uses seq_puts().  Try doing the
experiment 3-5 times each way, to see if the difference is within
measurement error, and then figure out what percentage of the total
CPU time you have saved.

If this sort of thing appeals to you, you might want to consider a
more productive line of work.  For example, you could do scalability
measurements.  Run various benchmarks with lockdep enabled, and
measure the average and max hold time on various locks.  Now see if
you can reduce the max hold time on those locks.  You may find that
you can improve performance for real work loads by orders of magnitude
more than you can by sending the sorts of patches you've sent up until
now.

You'd also development more marketable kernel skills, if that has been
your goal by spamming the list with hundreds and thousands of mostly
pointless patches.  Note that if a hiring manager were to talk to
developers and get their opinion of the sorts of patches you have been
sending, trust me, it would _not_ be positive.  So trying to send more
useful patches might be more helpful if your goal is to try to get
gainful employment.

Cheers,

						- Ted
