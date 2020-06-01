From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Jun 2020 18:01:31 +0000
Subject: Re: [PATCH v2] IB/hfi1: Fix hfi1_netdev_rx_init() error handling
Message-Id: <20200601180131.GU22511@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <BY5PR11MB3958CF61BB1F59A6F6B5234D868F0@BY5PR11MB3958.namprd11.prod.outlook.com>
 <20200530140224.GA1330098@mwanda>
 <20200601141450.GA24045@ziepe.ca>
In-Reply-To: <20200601141450.GA24045@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Dennis Dalessandro <dennis.dalessandro@intel.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jun 01, 2020 at 11:14:50AM -0300, Jason Gunthorpe wrote:
> On Sat, May 30, 2020 at 05:02:24PM +0300, Dan Carpenter wrote:
> > The hfi1_vnic_up() function doesn't check whether hfi1_netdev_rx_init()
> > returns errors.  In hfi1_vnic_init() we need to change the code to
> > preserve the error code instead of returning success.
> > 
> > Fixes: 2280740f01ae ("IB/hfi1: Virtual Network Interface Controller (VNIC) HW support")
> > Fixes: 4730f4a6c6b2 ("IB/hfi1: Activate the dummy netdev")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: Add error handling in hfi1_vnic_up() and add second fixes tag
> > 
> >  drivers/infiniband/hw/hfi1/vnic_main.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> Applied to for-next with the 'if (rc)' fixup, thanks

Thanks.  I would have resent it, but it's a three day weekend here...

regards,
dan carpenter
