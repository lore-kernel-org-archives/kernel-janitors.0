From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 Aug 2013 14:39:59 +0000
Subject: Re: [patch] staging: comedi: gsc_hpdi plx9080: Resolve sparse "different base types" warnings.
Message-Id: <20130802143959.GG5102@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201308011744.r71HiFtV077932@rivendell.pollux.laing>
In-Reply-To: <201308011744.r71HiFtV077932@rivendell.pollux.laing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 02, 2013 at 07:11:17AM -0600, Shaun Laing wrote:
> Thank you, Dan.
> 
> > It feels like the ->dma_desc buffer is supposed to go to be used
> > by the hardware but I don't see where that happens.  This driver
> > looks like complete garbage.  We should re-write it completely.
> > It's better to leave the static checker warnings there to mark that
> > the driver needs to be re-written instead of silencing the warnings
> > but not fixing the code.  Fixing the code proably means re-writing
> > it to be CPU endian.
> 
> Ok -- I'll ditch this patch.
> 
> >> * Removes some spaces to elimite "checkpatch" warnings.
> >
> > I don't see any checkpatch warnings.  I assume you are talking about
> > the indent changes here.
> >
> > The indenting was correct in the original and the patch is wrong.
> 
> So that I know for the future:  if I remove the indentation changes
> 'checkpatch' returns these warnings.  Should I ignore these in the
> future?
> 

Ah, I get it.  Adding a call to le32_to_cpu() made the line too long
so you pulled it in.

The "right way" to fix this in this case is to delete the debug
message.  Another right way would be to add a temporary variable.
Also the casting is bogus and removing it saves space.

	desc = &devpriv->dma_desc[i];
	DEBUG("blah blah %x", le32_to_cpu(desc->next));

regards,
dan carpenter


