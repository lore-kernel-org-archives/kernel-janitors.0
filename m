From: Mugunthan V N <mugunthanvnm@ti.com>
Date: Wed, 21 Aug 2013 09:11:17 +0000
Subject: Re: net: Add TI DaVinci EMAC driver
Message-Id: <5214D186.9030409@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130821084024.GK5240@elgon.mountain>
In-Reply-To: <20130821084024.GK5240@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday 21 August 2013 02:14 PM, Gole, Anant wrote:
> Dan,
> Sorry for top posting. I am looping in Mugunthan who is currently looking into this driver.
>
> Mugunthan,
> Can you look at the issue pointed out by Dan and submit a patch if this is a bug and clean up if needed?
>
>
> Regards,
> Anant
>
> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com] 
> Sent: Wednesday, August 21, 2013 2:10 PM
> To: Gole, Anant
> Cc: kernel-janitors@vger.kernel.org
> Subject: re: net: Add TI DaVinci EMAC driver
>
> Hello Anant Gole,
>
> The patch a6286ee630f6: "net: Add TI DaVinci EMAC driver" from May 18, 2009, has the following potentially buggy code:
>
> drivers/net/ethernet/ti/davinci_emac.c
>   1316                   ((EMAC_DEF_ERROR_FRAME_EN) ? (EMAC_RXMBP_CEFEN_MASK) : 0x0) |
>   1317                   ((EMAC_DEF_PROM_EN) ? (EMAC_RXMBP_CAFEN_MASK) : 0x0) |
>   1318                   ((EMAC_DEF_PROM_CH & EMAC_RXMBP_CHMASK) << \
>                            ^^^^^^^^^^^^^^^^ This is bit 0 but it's used as a mask.  It should maybe be:
>
> 				EMAC_MBP_PROMISCCH(EMAC_DEF_PROM_CH) & EMAC_RXMBP_CHMASK
EMAC_DEF_PROM_CH is not denoting bit 0 but denoting which DMA channel to
be used to transfer promiscuous packet (i.e other MAC packets which
doesn't belong to us) from EMAC to DDR.

The existing code is correct but it can be simplified as you have
mentioned here to make code review simpler. Will prepare a patch and
submit to mailing list soon.

Regards
Mugunthan V N
