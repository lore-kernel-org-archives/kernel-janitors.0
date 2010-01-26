From: Dan Carpenter <error27@gmail.com>
Date: Tue, 26 Jan 2010 09:21:12 +0000
Subject: Re: [patch] usb: io_edgeport: eliminate get_string()
Message-Id: <20100126092112.GF3061@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100125115333.GD3061@bicker>
In-Reply-To: <20100125115333.GD3061@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jan 26, 2010 at 07:50:22AM +0100, Oliver Neukum wrote:
> Am Dienstag, 26. Januar 2010 05:27:31 schrieb Greg KH:
> > > Good point. But if that is considered critical enough then Dan's
> > > original patch should go to stable instead of this one. And so should
> > > the other 10+ DMA-to-stack patches in Greg's tree?
> > 
> > Given the age of this bug (1999) and the fact that the devices are no
> > longer made, I don't think this is -stable worthy.
> 
> That's an odd form of reasoning. As the patch touches just this driver
> it makes no difference if you don't have the hardware. If you have
> the hardware on an architecture where it matters, this is no longer
> true.
> 
> 	Regards
> 		Oliver

There are 89 files that do dma on the stack in the -rc5 kernel.  No one
ever complains about it, so it can't be that serious.

regards,
dan carpenter

