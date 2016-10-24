From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Oct 2016 14:02:49 +0000
Subject: Re: MIPS/kernel/r2-to-r6-emul: Use seq_puts() in mipsr2_stats_show()
Message-Id: <e7ac4cba-bce1-edf5-a537-4c06a357bfb3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3809e713-2f08-db60-92c1-21d735a4f35b@users.sourceforge.net>
 <4126c272-cdf6-677a-fe98-74e8034078d8@users.sourceforge.net>
 <20161024131311.ttwr2bblphg6vd2b@thunk.org>
In-Reply-To: <20161024131311.ttwr2bblphg6vd2b@thunk.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>, linux-mips@linux-mips.org
Cc: Andrea Gelmini <andrea.gelmini@gelma.net>, Andrew Morton <akpm@linux-foundation.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> A string which did not contain a data format specification should be put
>> into a sequence.
> 
> This is not a correct description of what you are doing.  A better
> description would be to say:
> 
> "Use seq_put[sc]() instead of seq_printf() since the string does not
> contain a data format specifier".

Thanks for your suggestion about an other wording.


> You should fix this in all the patches.

I am curious if a second approach will become acceptable in the near future.


> Please also note this is really pointless patch,

If you do not like the proposed changes for some subsystems so far,
I would appreciate another clarification:

* Could you tolerate them for any other software components?

* May I continue to inform involved developers about similar change possibilities?


> since reading from /proc isn't done in a tight loop, and even if it were,
> the use of vsprintf is the tiniest part of the overhead.

Thanks for your software development opinion.


> It otherwise reduces the text space or the number of lines of code....

Do other system testers and Linux users care a bit more for corresponding
chances in improved software efficiency?

Regards,
Markus
