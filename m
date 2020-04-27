From: "Saleem, Shiraz" <shiraz.saleem@intel.com>
Date: Mon, 27 Apr 2020 17:54:43 +0000
Subject: RE: [PATCH] i40iw: Fix error handling in i40iw_manage_arp_cache()
Message-Id: <9DD61F30A802C4429A01CA4200E302A7DCD54B89@fmsmsx124.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200422092211.GA195357@mwanda>
 <20200425230004.GA23991@ziepe.ca>
In-Reply-To: <20200425230004.GA23991@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Gunthorpe <jgg@ziepe.ca>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Latif, Faisal" <faisal.latif@intel.com>, Doug Ledford <dledford@redhat.com>, Shannon Nelson <shannon.nelson@intel.com>, "Singhai, Anjali" <anjali.singhai@intel.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> Subject: Re: [PATCH] i40iw: Fix error handling in i40iw_manage_arp_cache()
> 
> On Wed, Apr 22, 2020 at 12:22:11PM +0300, Dan Carpenter wrote:
> > The i40iw_arp_table() function can return -EOVERFLOW if
> > i40iw_alloc_resource() fails so we can't just test for "= -1".
> >
> > Fixes: 4e9042e647ff ("i40iw: add hw and utils files")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > drivers/infiniband/hw/i40iw/i40iw_hw.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/infiniband/hw/i40iw/i40iw_hw.c
> > b/drivers/infiniband/hw/i40iw/i40iw_hw.c
> > index 55a1fbf0e670..ae8b97c30665 100644
> > +++ b/drivers/infiniband/hw/i40iw/i40iw_hw.c
> > @@ -534,7 +534,7 @@ void i40iw_manage_arp_cache(struct i40iw_device
> *iwdev,
> >  	int arp_index;
> >
> >  	arp_index = i40iw_arp_table(iwdev, ip_addr, ipv4, mac_addr, action);
> > -	if (arp_index = -1)
> > +	if (arp_index < 0)
> >  		return;
> >  	cqp_request = i40iw_get_cqp_request(&iwdev->cqp, false);
> >  	if (!cqp_request)
> 
> It is right Shiraz?
> 
Yes. Not convinced i40iw_manage_arp_cache being a void is ok
but that's a separate problem which I ll review internally.

Acked-by: Shiraz Saleem <shiraz.saleem@intel.com>
