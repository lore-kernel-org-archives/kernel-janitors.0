From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Oct 2016 14:53:32 +0000
Subject: Re: MIPS/kernel/r2-to-r6-emul: Use seq_puts() in mipsr2_stats_show()
Message-Id: <8592fa0c-e80a-77e2-fc44-4017f0988c8c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3809e713-2f08-db60-92c1-21d735a4f35b@users.sourceforge.net>
 <4126c272-cdf6-677a-fe98-74e8034078d8@users.sourceforge.net>
 <20161024131311.ttwr2bblphg6vd2b@thunk.org>
 <e7ac4cba-bce1-edf5-a537-4c06a357bfb3@users.sourceforge.net>
 <20161024142037.rrslfxtimj44s5t6@thunk.org>
In-Reply-To: <20161024142037.rrslfxtimj44s5t6@thunk.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>, linux-mips@linux-mips.org
Cc: Andrea Gelmini <andrea.gelmini@gelma.net>, Andrew Morton <akpm@linux-foundation.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> I am curious if a second approach will become acceptable in the near future.
> 
> I don't know what you were asking.

I am trying to clarify the suggested software evolution again.


> I was merely point out that the wording was factually incorrect
> in all of the patches,

Thanks for this information.


> and I didn't feel like replying five times to point out the same mistake.

This is fine.


>>> since reading from /proc isn't done in a tight loop, and even if it were,
>>> the use of vsprintf is the tiniest part of the overhead.
>>
>> Thanks for your software development opinion.
> 
> It's a lot more than just an opinion.  I challenge you to demonstrate
> how much savings it would take.  Try learning how to use another tool
> --- say, perf.  Measure how many clock cycles it takes to read from a
> proc file that uses seq_printf().  Then measure how many clock cycles
> it takes to read from a proc file that uses seq_puts().  Try doing the
> experiment 3-5 times each way, to see if the difference is within
> measurement error, and then figure out what percentage of the total
> CPU time you have saved.

Are there any more software developers interested in such system
performance analyses?


> If this sort of thing appeals to you, you might want to consider a
> more productive line of work.  For example, you could do scalability
> measurements.  Run various benchmarks with lockdep enabled, and
> measure the average and max hold time on various locks.  Now see if
> you can reduce the max hold time on those locks.  You may find that
> you can improve performance for real work loads by orders of magnitude
> more than you can by sending the sorts of patches you've sent up until now.

Thanks for your hints around other software development areas.


> You'd also development more marketable kernel skills, if that has been
> your goal by spamming the list with hundreds and thousands of mostly
> pointless patches.

You might categorise my update suggestions with a low value so far.


> Note that if a hiring manager were to talk to developers and get
> their opinion of the sorts of patches you have been sending, trust me,
> it would _not_ be positive.

There are also some constraints around change resistance involved,
aren't there?

* Do my suggestions show small improvements for Linux source files?

* If you find some of them so awful, why should I attempt to improve
  any commit messages in another patch series then?


> So trying to send more useful patches might be more helpful
> if your goal is to try to get gainful employment.

Financial incentives would be also nice as you seem to indicate here.

Regards,
Markus
