From: Theodore Ts'o <tytso@mit.edu>
Date: Mon, 24 Oct 2016 13:13:11 +0000
Subject: Re: [PATCH 1/4] MIPS/kernel/r2-to-r6-emul: Use seq_puts() in mipsr2_stats_show()
Message-Id: <20161024131311.ttwr2bblphg6vd2b@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3809e713-2f08-db60-92c1-21d735a4f35b@users.sourceforge.net>
 <4126c272-cdf6-677a-fe98-74e8034078d8@users.sourceforge.net>
In-Reply-To: <4126c272-cdf6-677a-fe98-74e8034078d8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-mips@linux-mips.org, Andrea Gelmini <andrea.gelmini@gelma.net>, Andrew Morton <akpm@linux-foundation.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Ralf =?iso-8859-1?Q?B=E4chle?= <ralf@linux-mips.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Oct 24, 2016 at 02:27:55PM +0200, SF Markus Elfring wrote:
> 
> A string which did not contain a data format specification should be put
> into a sequence.

This is not a correct description of what you are doing.  A better
description would be to say:

"Use seq_put[sc]() instead of seq_printf() since the string does not
contain a data format specifier".  You should fix this in all the
patches.  Please also note this is really pointless patch, since
reading from /proc isn't done in a tight loop, and even if it were,
the use of vsprintf is the tiniest part of the overhead.  It otherwise
reduces the text space or the number of lines of code....

					- Ted
