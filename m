From: Johan Hovold <jhovold@gmail.com>
Date: Tue, 26 Jan 2010 09:46:13 +0000
Subject: Re: [patch] usb: io_edgeport: eliminate get_string()
Message-Id: <20100126094613.GA13217@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100125115333.GD3061@bicker>
In-Reply-To: <20100125115333.GD3061@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jan 26, 2010 at 12:21:12PM +0300, Dan Carpenter wrote:
> On Tue, Jan 26, 2010 at 07:50:22AM +0100, Oliver Neukum wrote:
> > Am Dienstag, 26. Januar 2010 05:27:31 schrieb Greg KH:
> > > > Good point. But if that is considered critical enough then Dan's
> > > > original patch should go to stable instead of this one. And so should
> > > > the other 10+ DMA-to-stack patches in Greg's tree?
> > > 
> > > Given the age of this bug (1999) and the fact that the devices are no
> > > longer made, I don't think this is -stable worthy.
> > 
> > That's an odd form of reasoning. As the patch touches just this driver
> > it makes no difference if you don't have the hardware. If you have
> > the hardware on an architecture where it matters, this is no longer
> > true.
> > 
> There are 89 files that do dma on the stack in the -rc5 kernel.  No one
> ever complains about it, so it can't be that serious.

DMA on stack can actually cause memory corruption on cache-incoherent
architectures as Oliver implies. However unlikely it may be, perhaps
this should be given higher priority to fix?

Thanks,
Johan

