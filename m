From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 26 Jul 2013 11:57:56 +0000
Subject: Re: [PATCH 1/1] staging/comedi/drivers/dt9812.c: Resolves sparse warnings regarding byte ordering.
Message-Id: <20130726115756.GF5585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201307242015.r6OKFcTp1000140@rivendell.pollux.laing>
In-Reply-To: <201307242015.r6OKFcTp1000140@rivendell.pollux.laing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 24, 2013 at 02:15:38PM -0600, Shaun Laing wrote:
> From: Shaun Laing <shaun-lk@xresource.ca>

This is not needed since you are the author.  The email should
match the email address you are using to send patches.

The signed-off-by thing is intended to have a legal meaning, that
you didn't violate copyright or anything.  You are using a different
email to send patches and to sign so it's a bit weird.  Obviously,
we don't actually know that your real name is "Shaun Laing" either,
so it's not like it's a bullet proof system.  But we generally say
that the email should match at least and if we know that it looks
like a fake name we won't accept that either.

> Signed-off-by: Shaun Laing <shaun-lk@xresource.ca>

Put the signed off by at the end of the patch.

> 
> * Resolves sparse warnings of the form "warning: cast to restricted __le??"
> * Renames temp variables to include "le", to remind that the values are little endian

Don't put an "le" in the name.  It looks ugly/doesn't match kernel
naming style and anyway sparse will remind you if you forget about
endianess.

Otherwise, the patch looks good.  Resend it to the people in
./scripts/get_maintainer.pl.  Always CC at least one mailing list.
There is a mailing list for staging code so you don't need to CC
linux-kernel (they will just ignore the patch anyway).

regards,
dan carpenter

