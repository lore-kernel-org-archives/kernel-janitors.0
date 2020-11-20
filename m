From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Nov 2020 08:09:14 +0000
Subject: Re: [PATCH] drm/kmb: Fix possible oops in probe error handling
Message-Id: <20201120080914.GK18329@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201117072103.GA1111239@mwanda>
 <BY5PR11MB41823C768894561BEE8567888CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB41823C768894561BEE8567888CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Cc: David Airlie <airlied@linux.ie>, "Dea, Edmund J" <edmund.j.dea@intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>

On Fri, Nov 20, 2020 at 01:29:45AM +0000, Chrisanthus, Anitha wrote:
> Hi Dan,
> 
> > -----Original Message-----
> > From: Dan Carpenter <dan.carpenter@oracle.com>
> > Sent: Monday, November 16, 2020 11:21 PM
> > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> > Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>;
> > Daniel Vetter <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>; dri-
> > devel@lists.freedesktop.org; kernel-janitors@vger.kernel.org
> > Subject: [PATCH] drm/kmb: Fix possible oops in probe error handling
> > 
> > If kmb_dsi_init() fails the error handling will dereference an error
> > pointer which will cause an Oops.
> > 
> > Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/kmb/kmb_drv.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> > b/drivers/gpu/drm/kmb/kmb_drv.c
> > index a31a840ce634..8c43b136765c 100644
> > --- a/drivers/gpu/drm/kmb/kmb_drv.c
> > +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> > @@ -504,7 +504,7 @@ static int kmb_probe(struct platform_device *pdev)
> >  	if (IS_ERR(kmb->kmb_dsi)) {
                   ^^^^^^^^^^^^
We check that this is an error pointer.

> >  		drm_err(&kmb->drm, "failed to initialize DSI\n");
> >  		ret = PTR_ERR(kmb->kmb_dsi);
> > -		goto err_free1;
                ^^^^^^^^^^^^^^^
We go to err_free1.

> > +		goto err_clear_drvdata;
> >  	}
>  dsi host is registered earlier, it needs to be unregistered, original code is correct.
> 
> Anitha
> > 
> >  	kmb->kmb_dsi->dev = &dsi_pdev->dev;
> > @@ -540,8 +540,9 @@ static int kmb_probe(struct platform_device *pdev)
> >  	drm_crtc_cleanup(&kmb->crtc);
> >  	drm_mode_config_cleanup(&kmb->drm);
> >   err_free1:
      ^^^^^^^^^
Which is here.

> > -	dev_set_drvdata(dev, NULL);
> >  	kmb_dsi_host_unregister(kmb->kmb_dsi);
                                ^^^^^^^^^^^^
And then we crash.

Probably my commit message was not clear enough.  I will change the
commit message and resend.

regards,
dan carpenter

> > + err_clear_drvdata:
> > +	dev_set_drvdata(dev, NULL);
> > 
> >  	return ret;
> >  }
> > --
> > 2.28.0
