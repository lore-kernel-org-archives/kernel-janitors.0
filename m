From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 Aug 2013 09:43:17 +0000
Subject: Re: [patch] staging: comedi: gsc_hpdi plx9080: Resolve sparse "different base types" warnings.
Message-Id: <20130802094317.GA5051@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201308011744.r71HiFtV077932@rivendell.pollux.laing>
In-Reply-To: <201308011744.r71HiFtV077932@rivendell.pollux.laing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Aug 01, 2013 at 11:44:15AM -0600, Shaun Laing wrote:
> Hi all,
> 
> Do you see anything wrong with submitting this patch?  My primary concern is
> mixing the functional changes with the aesthetic changes.
> 
> Thanks.
> 
> * Resolves sparse warnings of the form 
> 	"warning: incorrect type in assignment (different base types)".

It feels like the ->dma_desc buffer is supposed to go to be used
by the hardware but I don't see where that happens.  This driver
looks like complete garbage.  We should re-write it completely.
It's better to leave the static checker warnings there to mark that
the driver needs to be re-written instead of silencing the warnings
but not fixing the code.  Fixing the code proably means re-writing
it to be CPU endian.

> * Adds byte swapping to DEBUG_PRINT statements.

These debug statments are just noise.  Delete them instead of
modifying them.

> * Removes some spaces to elimite "checkpatch" warnings.

I don't see any checkpatch warnings.  I assume you are talking about
the indent changes here.

>  		DEBUG_PRINT(" start addr virt 0x%p, phys 0x%lx\n",
> -			    devpriv->desc_dio_buffer[i],
> -			    (unsigned long)devpriv->dma_desc[i].
> -			    pci_start_addr);
> +			devpriv->desc_dio_buffer[i],
> +			(unsigned long)le32_to_cpu(devpriv->dma_desc[i].
> +			pci_start_addr));

The indenting was correct in the original and the patch is wrong.

regards,
dan carpenter
