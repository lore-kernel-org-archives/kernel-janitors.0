From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 08 Feb 2021 12:21:07 +0000
Subject: Re: [PATCH][next] dmaengine: dw-axi-dmac: remove redundant null check on desc
Message-Id: <20210208120907.GD879029@vkoul-mobl.Dlink>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210203134652.22618-1-colin.king@canonical.com>
 <CO1PR11MB502607E4DB3DD971956D6CF2DAB39@CO1PR11MB5026.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB502607E4DB3DD971956D6CF2DAB39@CO1PR11MB5026.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Sia, Jee Heng" <jee.heng.sia@intel.com>
Cc: Colin King <colin.king@canonical.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 04-02-21, 00:18, Sia, Jee Heng wrote:
> The code looks good to me. I have also verified it on Intel KeemBay platform.
> 
> Reviewed-by: Sia Jee Heng <jee.heng.sia@intel.com>
> Tested-by: Sia Jee Heng <jee.heng.sia@intel.com>

Please *do not* top post!

> 
> Thanks
> Regards
> Jee Heng
> > -----Original Message-----
> > From: Colin King <colin.king@canonical.com>
> > Sent: 03 February 2021 9:47 PM
> > To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>; Vinod Koul
> > <vkoul@kernel.org>; Sia, Jee Heng <jee.heng.sia@intel.com>; Andy
> > Shevchenko <andriy.shevchenko@linux.intel.com>;
> > dmaengine@vger.kernel.org
> > Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: [PATCH][next] dmaengine: dw-axi-dmac: remove redundant
> > null check on desc
> > 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The pointer desc is being null checked twice, the second null check is
> > redundant because desc has not been re-assigned between the checks.
> > Remove the redundant second null check on desc.
> > 
> > Addresses-Coverity: ("Logically dead code")
> > Fixes: ef6fb2d6f1ab ("dmaengine: dw-axi-dmac: simplify descriptor
> > management")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index ac3d81b72a15..d9e4ac3edb4e 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > @@ -919,10 +919,6 @@ dma_chan_prep_dma_memcpy(struct
> > dma_chan *dchan, dma_addr_t dst_adr,
> >  		num++;
> >  	}
> > 
> > -	/* Total len of src/dest sg = 0, so no descriptor were
> > allocated */
> > -	if (unlikely(!desc))
> > -		return NULL;
> > -
> >  	/* Set end-of-link to the last link descriptor of list */
> >  	set_desc_last(&desc->hw_desc[num - 1]);
> >  	/* Managed transfer list */
> > --
> > 2.29.2
> 

-- 
~Vinod
