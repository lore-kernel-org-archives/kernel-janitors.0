From: Alasdair G Kergon <agk@redhat.com>
Date: Thu, 10 Jan 2008 11:39:54 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <20080110113954.GL3510@agk.fab.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <1199909560.6245.67.camel@cinder.waste.org> <20080109224026.GA4039@agk.fab.redhat.com> <200801100149.16301.phillips@phunq.net>
In-Reply-To: <200801100149.16301.phillips@phunq.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Phillips <phillips@phunq.net>
Cc: Matt Mackall <mpm@selenic.com>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gorcunov@gmail.com

On Thu, Jan 10, 2008 at 01:49:15AM -0800, Daniel Phillips wrote:
> So what stops you from changing to unlocked_ioctl for the main device 
> mapper ctl_ioctl?  

Nothing - patches to do this are queued for 2.6.25:

  http://www.kernel.org/pub/linux/kernel/people/agk/patches/2.6/editing/dm-ioctl-remove-lock_kernel.patch
  http://www.kernel.org/pub/linux/kernel/people/agk/patches/2.6/editing/dm-ioctl-move-compat-code.patch

Alasdair
-- 
agk@redhat.com
