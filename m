From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 04 Jun 2018 13:46:08 +0000
Subject: Re: [PATCH] fsl/qe: ucc: copy and paste bug in ucc_get_tdm_sync_shift()
Message-Id: <alpine.DEB.2.20.1806042245360.3542@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180604115842.7c4vzge3igjbnblt@kili.mountain>
 <alpine.DEB.2.20.1806042223580.3542@hadrien>
 <20180604134024.dmd7mn2wggqpmkcq@mwanda>
In-Reply-To: <20180604134024.dmd7mn2wggqpmkcq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Mon, 4 Jun 2018, Dan Carpenter wrote:

> On Mon, Jun 04, 2018 at 10:25:14PM +0900, Julia Lawall wrote:
> >
> >
> > On Mon, 4 Jun 2018, Dan Carpenter wrote:
> >
> > > There is a copy and paste bug so we accidentally use the RX_ shift when
> > > we're in TX_ mode.
> > >
> > > Fixes: bb8b2062aff3 ("fsl/qe: setup clock source for TDM mode")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > > Static analysis work.  Not tested.  This affects the success path, so
> > > we should probably test it.
> >
> > Maybe this is another one?  I don't have time to look into it at the
> > moment...
> >
> > drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
> >
> >  	/* For strict priority entries defines the number of consecutive
> >  	 * slots for the highest priority.
> >  	 */
> > 	REG_WR(bp, (port) ? NIG_REG_P1_TX_ARB_NUM_STRICT_ARB_SLOTS :
> > 		   NIG_REG_P1_TX_ARB_NUM_STRICT_ARB_SLOTS, 0x100);
> >  	/* Mapping between the CREDIT_WEIGHT registers and actual client
> >  	 * numbers
> >  	 */
> >
> > I find some others that choose between constants, such as ... ? 0 : 0.
>
> I feel like it should warn about all of those because people shouldn't
> be submitting unfinished written code to the kernel.  Coccinelle is a
> lot better for this than Smatch is because it's pre-processor stuff.

OK, maybe I can report these in the next few days.

thanks,
julia
