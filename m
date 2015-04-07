From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Apr 2015 07:49:47 +0000
Subject: Re: TODO list
Message-Id: <20150407074947.GA10964@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100714100136.GA3583@albatros>
In-Reply-To: <20100714100136.GA3583@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Apr 03, 2015 at 01:40:35PM -0700, Ravi Kerur wrote:
> Team,
> 
> I am planning to take up following items from TODO list. If it's already picked please let me know. 
> 
> * pci_set_dma_mask() and friends should use DMA_BIT_MASK(nn) instead of
> 
> DMA_nnBIT_MASK or 0xffff... This is not 2.4 compatible, so beware of drivers with same code. [D: http://marc.theaimsgroup.com/?t8001993000001] Don't forget to #include dma-mapping.h
> 
> * check kmallocs for things like GFP_DMA without a memtype. 
> 

The TODO is desperately out of date.  No one cares about 2.4 at all.
These days we don't really allow drivers to have backwards compatability
code so they compile on old kernels.  That stuff has to be stored out of
the main kernel tree.  We also have the compat-wireless and other
similar ways of backporting drivers.

There are still the occasional GFP_DMA without a memtype issue.  I'm not
certain what the fix is for those.  You could probably find them using
Coccinelle.

regards,
dan carpenter

