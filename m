From: "Wan, Kaike" <kaike.wan@intel.com>
Date: Mon, 01 Jun 2020 12:49:33 +0000
Subject: RE: [PATCH v2] IB/hfi1: Fix hfi1_netdev_rx_init() error handling
Message-Id: <MW3PR11MB46650C2EA914990C6549807AF48A0@MW3PR11MB4665.namprd11.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <BY5PR11MB3958CF61BB1F59A6F6B5234D868F0@BY5PR11MB3958.namprd11.prod.outlook.com>
 <20200530140224.GA1330098@mwanda> <20200531100512.GH66309@unreal>
 <20200531173655.GT22511@kadam> <20200601042433.GA34024@unreal>
 <20200601122723.GB4872@ziepe.ca>
In-Reply-To: <20200601122723.GB4872@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "Marciniszyn, Mike" <mike.marciniszyn@intel.com>, "Andrejczuk, Grzegorz" <grzegorz.andrejczuk@intel.com>, "Dalessandro, Dennis" <dennis.dalessandro@intel.com>, Doug Ledford <dledford@redhat.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



> -----Original Message-----
> From: linux-rdma-owner@vger.kernel.org <linux-rdma-
> owner@vger.kernel.org> On Behalf Of Jason Gunthorpe
> Sent: Monday, June 01, 2020 8:27 AM
> To: Leon Romanovsky <leon@kernel.org>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>; Marciniszyn, Mike
> <mike.marciniszyn@intel.com>; Andrejczuk, Grzegorz
> <grzegorz.andrejczuk@intel.com>; Dalessandro, Dennis
> <dennis.dalessandro@intel.com>; Doug Ledford <dledford@redhat.com>;
> linux-rdma@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: Re: [PATCH v2] IB/hfi1: Fix hfi1_netdev_rx_init() error handling
> 
> On Mon, Jun 01, 2020 at 07:24:33AM +0300, Leon Romanovsky wrote:
> > On Sun, May 31, 2020 at 08:36:55PM +0300, Dan Carpenter wrote:
> > > On Sun, May 31, 2020 at 01:05:12PM +0300, Leon Romanovsky wrote:
> > > > On Sat, May 30, 2020 at 05:02:24PM +0300, Dan Carpenter wrote:
> > > > > The hfi1_vnic_up() function doesn't check whether
> > > > > hfi1_netdev_rx_init() returns errors.  In hfi1_vnic_init() we
> > > > > need to change the code to preserve the error code instead of
> returning success.
> > > > >
> > > > > Fixes: 2280740f01ae ("IB/hfi1: Virtual Network Interface
> > > > > Controller (VNIC) HW support")
> > > > > Fixes: 4730f4a6c6b2 ("IB/hfi1: Activate the dummy netdev")
> > > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > > v2: Add error handling in hfi1_vnic_up() and add second fixes
> > > > > tag
> > > > >
> > > > >  drivers/infiniband/hw/hfi1/vnic_main.c | 11 +++++++++--
> > > > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/infiniband/hw/hfi1/vnic_main.c
> > > > > b/drivers/infiniband/hw/hfi1/vnic_main.c
> > > > > index b183c56b7b6a4..03f8be8e9488e 100644
> > > > > +++ b/drivers/infiniband/hw/hfi1/vnic_main.c
> > > > > @@ -457,13 +457,19 @@ static int hfi1_vnic_up(struct
> hfi1_vnic_vport_info *vinfo)
> > > > >  	if (rc < 0)
> > > > >  		return rc;
> > > > >
> > > > > -	hfi1_netdev_rx_init(dd);
> > > > > +	rc = hfi1_netdev_rx_init(dd);
> > > > > +	if (rc < 0)
Please use:  if (rc)

Thanks,

Kaike
> > > > > +		goto err_remove;
> > > >
> > > > Why did you check for the negative value here and didn't check below?
> > > >
> > >
> > > I just copied the pattern in the nearest code.  I didn't realize
> > > until now that it was different in both functions...  The checking
> > > isn't done consistently in this file.
> > >
> > > I can resend on Tuesday though if you want.
> >
> > I imagine that Jason will fix it once he will apply the patch.
> 
> If someone from hfi says which is the right one, sure..
> 
> Jason
