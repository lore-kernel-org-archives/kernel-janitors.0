From: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 28 Jun 2012 22:03:42 +0000
Subject: Re: [patch] sgi-xp: nested calls to spin_lock_irqsave()
Message-Id: <20120628150342.aaa4ad2d.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627135155.GA3464@sgi.com>
In-Reply-To: <20120627135155.GA3464@sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robin Holt <holt@sgi.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jack Steiner <steiner@sgi.com>

On Wed, 27 Jun 2012 08:51:55 -0500
Robin Holt <holt@sgi.com> wrote:

> The code here has a nested spin_lock_irqsave().  It's not needed since
> IRQs are already disabled and it causes a problem because it means that
> IRQs won't be enabled again at the end.  The second call to
> spin_lock_irqsave() will overwrite the value of irq_flags and we can't
> restore the proper settings.

Please find large crayon and write on forehead "when fixing a bug,
be sure to describe the end-user impact of that bug".

Then others will have a chance of deciding whether the fix should be
backported.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Robin Holt <holt@sgi.com>

I'm wondering if there should have been a Reported-by:dan in there. 
He's like that.

