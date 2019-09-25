From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 25 Sep 2019 18:49:39 +0000
Subject: Re: [PATCH] bnvdimm/namsepace: Don't set claim_class on error
Message-Id: <20190925184939.GA11669@iweiny-DESK2.sc.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925181056.11097-1-ira.weiny@intel.com>
 <ff7ff4f5b4289d189a7c347591a5c35876ea804f.camel@intel.com>
In-Reply-To: <ff7ff4f5b4289d189a7c347591a5c35876ea804f.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Verma, Vishal L" <vishal.l.verma@intel.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>

> > 
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >  drivers/nvdimm/namespace_devs.c | 19 +++++++++----------
> >  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> One minor nit below, but otherwise it looks good to me:
> Reviewed-by: Vishal Verma <vishal.l.verma@intel.com>

Thanks...

> 
> > 
> > diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
> > index 5b22cecefc99..a020c166e1e7 100644
> > --- a/drivers/nvdimm/namespace_devs.c
> > +++ b/drivers/nvdimm/namespace_devs.c
> > @@ -1510,16 +1510,19 @@ static ssize_t holder_show(struct device *dev,
> >  }
> >  static DEVICE_ATTR_RO(holder);
> >  
> > -static ssize_t __holder_class_store(struct device *dev, const char *buf)
> > +static int __holder_class_store(struct device *dev, const char *buf)
> >  {
> >  	struct nd_namespace_common *ndns = to_ndns(dev);
> >  
> >  	if (dev->driver || ndns->claim)
> >  		return -EBUSY;
> >  
> > -	if (sysfs_streq(buf, "btt"))
> > -		ndns->claim_class = btt_claim_class(dev);
> > -	else if (sysfs_streq(buf, "pfn"))
> > +	if (sysfs_streq(buf, "btt")) {
> > +		int rc = btt_claim_class(dev);
> 
> Need a blank line here separating variable declarations and code.

<sigh> yea I know better...  ;-)

V2 sent...

Thanks,
Ira
