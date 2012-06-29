From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 Jun 2012 06:44:32 +0000
Subject: Re: [patch] sgi-xp: nested calls to spin_lock_irqsave()
Message-Id: <20120629064432.GM3007@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627135155.GA3464@sgi.com>
 <20120628150342.aaa4ad2d.akpm@linux-foundation.org>
In-Reply-To: <20120628150342.aaa4ad2d.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Robin Holt <holt@sgi.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jack Steiner <steiner@sgi.com>

This is actually my patch, so the patch description is my fault.
It's a static checker patch and I don't have the hardware, but the
changelog could have been written more clearly as well.

Robin, the trick to resending patches is to put a:

From:  Dan Carpenter <dan.carpenter@oracle.com>

before the patch description and then it shows up as mine.

Also, btw, Robin, I'm looking through my mailbox again and you did
respond to the patch the first time I sent it.  Sorry, that I didn't
see that before, and thanks for your help on this.

regards,
dan carpenter

