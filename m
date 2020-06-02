From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Jun 2020 18:38:56 +0000
Subject: Re: [PATCH -next] IB/hfi1: Use free_netdev() in hfi1_netdev_free()
Message-Id: <20200602183856.GY22511@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200601135644.GD4872@ziepe.ca>
 <20200602061635.31224-1-yuehaibing@huawei.com>
 <75257c20-3cf2-7ecc-0d66-e1f4155ba105@intel.com>
In-Reply-To: <75257c20-3cf2-7ecc-0d66-e1f4155ba105@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dennis Dalessandro <dennis.dalessandro@intel.com>
Cc: YueHaibing <yuehaibing@huawei.com>, mike.marciniszyn@intel.com, dledford@redhat.com, jgg@ziepe.ca, sadanand.warrier@intel.com, grzegorz.andrejczuk@intel.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jun 02, 2020 at 11:30:13AM -0400, Dennis Dalessandro wrote:
> On 6/2/2020 2:16 AM, YueHaibing wrote:
> > dummy_netdev shold be freed by free_netdev() instead of
> > kfree(). Also remove unneeded variable 'priv'
> > 
> > Fixes: 4730f4a6c6b2 ("IB/hfi1: Activate the dummy netdev")
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
> >   drivers/infiniband/hw/hfi1/netdev_rx.c | 5 +----
> >   1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/infiniband/hw/hfi1/netdev_rx.c b/drivers/infiniband/hw/hfi1/netdev_rx.c
> > index 58af6a454761..63688e85e8da 100644
> > --- a/drivers/infiniband/hw/hfi1/netdev_rx.c
> > +++ b/drivers/infiniband/hw/hfi1/netdev_rx.c
> > @@ -371,12 +371,9 @@ int hfi1_netdev_alloc(struct hfi1_devdata *dd)
> >   void hfi1_netdev_free(struct hfi1_devdata *dd)
> >   {
> > -	struct hfi1_netdev_priv *priv;
> > -
> >   	if (dd->dummy_netdev) {
> > -		priv = hfi1_netdev_priv(dd->dummy_netdev);
> >   		dd_dev_info(dd, "hfi1 netdev freed\n");
> > -		kfree(dd->dummy_netdev);
> > +		free_netdev(dd->dummy_netdev);
> >   		dd->dummy_netdev = NULL;
> >   	}
> >   }
> > 
> 
> For the kfree->free_netdev, you probably want to add:
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

YueHaibing wasn't on the CC list when I sent forwarded that kbuild bot
email.  Forget about it.  Let's just apply this.

regards,
dan carpenter
