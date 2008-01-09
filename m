From: Andi Kleen <andi@firstfloor.org>
Date: Wed, 09 Jan 2008 00:09:46 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <20080109000946.GG2117@one.firstfloor.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <47840C57.6000304@gmail.com>
In-Reply-To: <47840C57.6000304@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Winchester <kjwinchester@gmail.com>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, paolo.ciarrocchi@gmail.com, gorcunov@gmail.com, jgarzik@pobox.com, linux-ide@vger.kernel.org

On Tue, Jan 08, 2008 at 07:50:47PM -0400, Kevin Winchester wrote:
> Andi Kleen wrote:
> > Here's a proposal for some useful code transformations the kernel janitors
> > could do as opposed to running checkpatch.pl.
> > 
> <snip>
> 
> I notice that every driver in drivers/ata uses a .ioctl that points to
> ata_scsi_ioctl().  I could add the BKL to that function, and then change

This might be a little more complicated. These
are funnelled through the block/SCSI layers which might not have separate
unlocked ioctl callbacks yet. Would be probably not very difficult
to add though.

> all of the drivers to .unlocked_ioctl, but I assume this would be a
> candidate to actually clean up by determining why the lock is needed and
> removing it if necessary.  Does anyone know off-hand the reason for
> needing the lock (I assume someone does or it wouldn't have survived
> this long)?  If the lock is absolutely required, then I can write the
> patch to add lock_kernel() and unlock_kernel().

Just sending the patch to add lock/unlock_kernel() is probably a good idea anyways --
Jeff will then feel bad over it and eventually remove it when he figures out
it is safe ;-)

-Andi
