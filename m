From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 12 Jan 2019 05:44:26 +0000
Subject: Re: [PATCH] powerpc/powernv/npu: Allocate enough memory in pnv_try_setup_npu_table_group()
Message-Id: <20190112054426.GF1743@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190109102328.GB5476@kadam>
 <20190112003035.GA10427@350D>
In-Reply-To: <20190112003035.GA10427@350D>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Balbir Singh <bsingharora@gmail.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Mark Hairgrove <mhairgrove@nvidia.com>, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org

On Sat, Jan 12, 2019 at 11:30:35AM +1100, Balbir Singh wrote:
> On Wed, Jan 09, 2019 at 01:23:29PM +0300, Dan Carpenter wrote:
> > There is a typo so we accidentally allocate enough memory for a pointer
> > when we wanted to allocate enough for a struct.
> > 
> > Fixes: 0bd971676e68 ("powerpc/powernv/npu: Add compound IOMMU groups")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  arch/powerpc/platforms/powernv/npu-dma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
> > index d7f742ed48ba..3f58c7dbd581 100644
> > --- a/arch/powerpc/platforms/powernv/npu-dma.c
> > +++ b/arch/powerpc/platforms/powernv/npu-dma.c
> > @@ -564,7 +564,7 @@ struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
> >  		}
> >  	} else {
> >  		/* Create a group for 1 GPU and attached NPUs for POWER8 */
> > -		pe->npucomp = kzalloc(sizeof(pe->npucomp), GFP_KERNEL);
> > +		pe->npucomp = kzalloc(sizeof(*pe->npucomp), GFP_KERNEL);
> 
> To avoid these in the future, I wonder if instead of sizeof(pe->npucomp), we insist on
> sizeof structure
> 
> pe->npucomp = kzalloc(sizeof(struct npucomp), GFP_KERNEL);
> 

The latest kernel fashion is sizeof(*ptr).  It can go wrong either way.
I don't have strong feelings about it.  These sorts of bugs don't last
long because they're caught in testing or with static analysis.

regards,
dan carpenter
