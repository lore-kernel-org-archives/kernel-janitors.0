From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Jan 2014 06:06:17 +0000
Subject: Re: [patch] usb: gadget: gr_udc: debugfs functions return NULL on error
Message-Id: <20140109060617.GW5443@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140109053936.GG1265@elgon.mountain>
In-Reply-To: <20140109053936.GG1265@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 08, 2014 at 10:01:21PM -0800, Greg Kroah-Hartman wrote:
> On Thu, Jan 09, 2014 at 08:39:37AM +0300, Dan Carpenter wrote:
> > Debugfs functions return NULL on error.  They return an ERR_PTR if you
> > don't have debugfs configured.
> > 
> > The way it's designed is that normally you are only supposed to test for
> > NULL.  In this code, if "dev->dfs_root" is an ERR_PTR then passing it to
> > debugfs_create_file() will not cause a problem because
> > debugfs_create_file() would also just a stub.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/usb/gadget/gr_udc.c b/drivers/usb/gadget/gr_udc.c
> > index 5f9c65959dd2..b34a52171568 100644
> > --- a/drivers/usb/gadget/gr_udc.c
> > +++ b/drivers/usb/gadget/gr_udc.c
> > @@ -226,13 +226,13 @@ static void gr_dfs_create(struct gr_udc *dev)
> >  	const char *name = "gr_udc_state";
> >  
> >  	dev->dfs_root = debugfs_create_dir(dev_name(dev->dev), NULL);
> > -	if (IS_ERR(dev->dfs_root)) {
> > +	if (!dev->dfs_root) {
> >  		dev_err(dev->dev, "Failed to create debugfs directory\n");
> >  		return;
> >  	}
> >  	dev->dfs_state = debugfs_create_file(name, 0444, dev->dfs_root,
> >  					     dev, &gr_dfs_fops);
> > -	if (IS_ERR(dev->dfs_state))
> > +	if (!dev->dfs_state)
> >  		dev_err(dev->dev, "Failed to create debugfs file %s\n", name);
> >  }
> 
> Don't even check the return value of the calls, I don't think it
> matters, right?
> 

I assume your question is rhetorical since you wrote debugfs...  :P
Yes, I looked and if we don't create the initial directory then the
files get put in parent directory instead.

I'll resend this.

regards,
dan carpenter

