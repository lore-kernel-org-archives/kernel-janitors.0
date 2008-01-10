From: Daniel Phillips <phillips@phunq.net>
Date: Thu, 10 Jan 2008 22:55:32 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <200801101455.32927.phillips@phunq.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <200801100149.16301.phillips@phunq.net> <20080110113954.GL3510@agk.fab.redhat.com>
In-Reply-To: <20080110113954.GL3510@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair G Kergon <agk@redhat.com>
Cc: Matt Mackall <mpm@selenic.com>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gorcunov@gmail.com

On Thursday 10 January 2008 03:39, Alasdair G Kergon wrote:
> On Thu, Jan 10, 2008 at 01:49:15AM -0800, Daniel Phillips wrote:
> > So what stops you from changing to unlocked_ioctl for the main
> > device mapper ctl_ioctl?
>
> Nothing - patches to do this are queued for 2.6.25:

Nice.  This removes a deadlock we hit, where if creating a device mapper 
target blocks indefinitely (say on network IO) then nobody else can 
complete a device mapper operation because BKL is held.  If completing 
the device create depends on some other device mapper operation, then 
it is game over.

Our current workaround is to test for and drop BKL, ugh.  Thanks for the 
cleanup.

Regards,

Daniel
