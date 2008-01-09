From: Alasdair G Kergon <agk@redhat.com>
Date: Wed, 09 Jan 2008 22:40:26 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <20080109224026.GA4039@agk.fab.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <4d8e3fd30801081158j3e7292d0i939776342015b12d@mail.gmail.com> <1199909560.6245.67.camel@cinder.waste.org>
In-Reply-To: <1199909560.6245.67.camel@cinder.waste.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Mackall <mpm@selenic.com>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gorcunov@gmail.com

On Wed, Jan 09, 2008 at 02:12:40PM -0600, Matt Mackall wrote:
> You'll need to change the prototype, the unlocked version doesn't take
> an inode. And you'll need to make sure that nothing in the function uses
> the inode, which I think Andi forgot to mention.
 
This old chestnut again.  Perhaps we could have inode passed to unlocked_ioctl?
I never understood why it wasn't there in the first place if the plan was for
.unlocked_ioctl to supercede .ioctl whenever possible.

Device-mapper for example in dm_blk_ioctl(), has no need for BKL so drops it
immediately, but it does need the inode parameter, so it is unable to switch as
things stand.

Alasdair
-- 
agk@redhat.com
