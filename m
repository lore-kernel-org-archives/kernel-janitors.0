From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 12 Apr 2017 10:27:10 +0000
Subject: Re: [PATCH] staging: ks7010: Adjust dev_err() calls in ks7010_sdio_probe()
Message-Id: <20170412102710.GA11657@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <901acc3c-ff1b-6f0c-b744-2bfb36de18d8@users.sourceforge.net>
 <1468787163.1900.1.camel@perches.com>
 <20160720155500.GG1688@katana>
 <12095569-1d23-7676-adef-b89ebc3a229b@users.sourceforge.net>
 <20170411223915.GD8814@eros>
In-Reply-To: <20170411223915.GD8814@eros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Tobin C. Harding" <me@tobin.cc>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, devel@driverdev.osuosl.org, Wolfram Sang <wsa@the-dreams.de>, sayli karnik <karniksayli1995@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>

On Wed, Apr 12, 2017 at 08:39:15AM +1000, Tobin C. Harding wrote:
> On Tue, Apr 11, 2017 at 03:15:32PM +0200, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 11 Apr 2017 14:54:35 +0200
> > 
> > The use of the logging function "dev_err" was introduced here on 2016-09-26.
> > 
> > I find the following implementation details worth for another look.
> > * Reduce expressions for the first input parameter "dev".
> > 
> > * Omit an extra module prefix in passed error messages because the device name
> >   will be displayed by the function "__dev_printk".
> > 
> > Fixes: 9887b5e51fafaf919601ccb8bdae1e0ad749032f ("staging: ks7010: Fix warnings on printk() usage")
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/staging/ks7010/ks7010_sdio.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
> > index b16618b41253..85feb170869b 100644
> > --- a/drivers/staging/ks7010/ks7010_sdio.c
> > +++ b/drivers/staging/ks7010/ks7010_sdio.c
> > @@ -955,12 +955,11 @@ static int ks7010_sdio_probe(struct sdio_func *func,
> >  	/* private memory allocate */
> >  	netdev = alloc_etherdev(sizeof(*priv));
> >  	if (!netdev) {
> > -		dev_err(&card->func->dev, "ks7010 : Unable to alloc new net device\n");
> > +		dev_err(&func->dev, "Unable to alloc new net device\n");
> >  		goto err_release_irq;
> >  	}
> >  	if (dev_alloc_name(netdev, "wlan%d") < 0) {
> > -		dev_err(&card->func->dev,
> > -			"ks7010 :  Couldn't get name!\n");
> > +		dev_err(&func->dev, "Couldn't get name!\n");
> >  		goto err_free_netdev;
> >  	}
> >  
> > @@ -1000,9 +999,9 @@ static int ks7010_sdio_probe(struct sdio_func *func,
> >  	/* Upload firmware */
> >  	ret = ks7010_upload_firmware(priv, card);	/* firmware load */
> >  	if (ret) {
> > -		dev_err(&card->func->dev,
> > -			"ks7010: firmware load failed !! return code = %d\n",
> > -			 ret);
> > +		dev_err(&func->dev,
> > +			"firmware load failed! return code = %d\n",
> > +			ret);
> >  		goto err_free_read_buf;
> >  	}
> 
> This patch does not apply to Greg's staging-testing branch. Sorry
> Markus a patch was merged the same day you submitted this one that
> refactored this code.

Note, Markus is in almost all maintainers kill-file, so we don't even
see their emails, and I'd recommend you not even worry about them
either.

thanks,

greg k-h
