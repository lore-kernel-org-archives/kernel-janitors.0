From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Aug 2013 09:26:11 +0000
Subject: Re: net: Add TI DaVinci EMAC driver
Message-Id: <20130821092611.GY4713@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130821084024.GK5240@elgon.mountain>
In-Reply-To: <20130821084024.GK5240@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 21, 2013 at 08:11:10PM +0530, Mugunthan V N wrote:
> On Wednesday 21 August 2013 02:14 PM, Gole, Anant wrote:
> > drivers/net/ethernet/ti/davinci_emac.c
> >   1316                   ((EMAC_DEF_ERROR_FRAME_EN) ? (EMAC_RXMBP_CEFEN_MASK) : 0x0) |
> >   1317                   ((EMAC_DEF_PROM_EN) ? (EMAC_RXMBP_CAFEN_MASK) : 0x0) |
> >   1318                   ((EMAC_DEF_PROM_CH & EMAC_RXMBP_CHMASK) << \
> >                            ^^^^^^^^^^^^^^^^ This is bit 0 but it's used as a mask.  It should maybe be:
> >
> > 				EMAC_MBP_PROMISCCH(EMAC_DEF_PROM_CH) & EMAC_RXMBP_CHMASK
> EMAC_DEF_PROM_CH is not denoting bit 0 but denoting which DMA channel to
> be used to transfer promiscuous packet (i.e other MAC packets which
> doesn't belong to us) from EMAC to DDR.
> 
> The existing code is correct but it can be simplified as you have
> mentioned here to make code review simpler. Will prepare a patch and
> submit to mailing list soon.

Let me say this a different way "(0 & x) is always zero".  We can
just delete it because we know:

	((EMAC_DEF_PROM_CH & EMAC_RXMBP_CHMASK) << \
		EMAC_RXMBP_PROMCH_SHIFT)

We know that 0 ANDed and then shifted is still zero.

regards,
dan carpenter

