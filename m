From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 16 Jul 2016 10:57:06 +0000
Subject: Re: [patch] staging: wilc1000: NULL dereference on error
Message-Id: <20160716105706.GH32301@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160716100755.GA3346@mwanda>
In-Reply-To: <20160716100755.GA3346@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jul 16, 2016 at 12:19:03PM +0200, walter harms wrote:
> 
> 
> Am 16.07.2016 12:07, schrieb Dan Carpenter:
> > We can't pass NULL pointers to destroy_workqueue().
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
> > index 0b1760c..78f524f 100644
> > --- a/drivers/staging/wilc1000/host_interface.c
> > +++ b/drivers/staging/wilc1000/host_interface.c
> > @@ -3363,7 +3363,7 @@ int wilc_init(struct net_device *dev, struct host_if_drv **hif_drv_handler)
> >  		if (!hif_workqueue) {
> >  			netdev_err(vif->ndev, "Failed to create workqueue\n");
> >  			result = -ENOMEM;
> > -			goto _fail_mq_;
> > +			goto _fail_;
> >  		}
> >  
> 
> 
> maybe this is the point where return -ENOMEM; is the most simple solution ?

Yeah.  This code is staging quality.  There are lots of other cleanups
someone could do.  Later patches...

regards,
dan carpenter

