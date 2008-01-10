From: Daniel Phillips <phillips@phunq.net>
Date: Thu, 10 Jan 2008 09:49:15 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <200801100149.16301.phillips@phunq.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <1199909560.6245.67.camel@cinder.waste.org> <20080109224026.GA4039@agk.fab.redhat.com>
In-Reply-To: <20080109224026.GA4039@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair G Kergon <agk@redhat.com>
Cc: Matt Mackall <mpm@selenic.com>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gorcunov@gmail.com

Hi Alasdair,

On Wednesday 09 January 2008 14:40, Alasdair G Kergon wrote:
> Device-mapper for example in dm_blk_ioctl(), has no need for BKL so
> drops it immediately, but it does need the inode parameter, so it is
> unable to switch as things stand.

So what stops you from changing to unlocked_ioctl for the main device 
mapper ctl_ioctl?  You aren't using the inode parameter, or the file 
parameter:

   http://lxr.linux.no/linux+v2.6.23.12/drivers/md/dm-ioctl.c#L1402

Regards,

Daniel
