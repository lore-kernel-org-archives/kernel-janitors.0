From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 Nov 2020 07:48:29 +0000
Subject: Re: [PATCH v2] drm/kmb: Fix possible oops in probe error handling
Message-Id: <20201130074829.GA2767@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201117072103.GA1111239@mwanda> <20201120081113.GL18329@kadam>
 <BY5PR11MB41823E214598EC70A9EAEEA08CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB41823E214598EC70A9EAEEA08CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Cc: David Airlie <airlied@linux.ie>, "Dea, Edmund J" <edmund.j.dea@intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>

On Fri, Nov 20, 2020 at 10:15:57PM +0000, Chrisanthus, Anitha wrote:
> Hi Dan,
> I see the problem now, thanks for the patch.
> 
> > -----Original Message-----
> > From: Dan Carpenter <dan.carpenter@oracle.com>
> > Sent: Friday, November 20, 2020 12:11 AM
> > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> > Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>;
> > Daniel Vetter <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>; dri-
> > devel@lists.freedesktop.org; kernel-janitors@vger.kernel.org
> > Subject: [PATCH v2] drm/kmb: Fix possible oops in probe error handling
> > 
> > If kmb_dsi_init() fails the "kmb->kmb_dsi" variable is an error pointer.
> > The kernel will Oops when we pass it to kmb_dsi_host_unregister().
> > 
> > Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: write a better commit message
> > 
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
> >  		drm_err(&kmb->drm, "failed to initialize DSI\n");
> >  		ret = PTR_ERR(kmb->kmb_dsi);
> > -		goto err_free1;
> > +		goto err_clear_drvdata;
> >  	}
> > 
> >  	kmb->kmb_dsi->dev = &dsi_pdev->dev;
> > @@ -540,8 +540,9 @@ static int kmb_probe(struct platform_device *pdev)
> >  	drm_crtc_cleanup(&kmb->crtc);
> >  	drm_mode_config_cleanup(&kmb->drm);
> >   err_free1:
> > -	dev_set_drvdata(dev, NULL);
> >  	kmb_dsi_host_unregister(kmb->kmb_dsi);
> > + err_clear_drvdata:
> We still need to unregister the dsi_host that was registered in this call kmb_dsi_host_bridge_init.
> This will require more changes in kmb_dsi_host_unregister and/or separate out mipi_dsi_host_unregister.
> FYI - I will be out all of next week, will be back the next Monday.

Hm...  Yes.  Now that you point it out, there are several bugs related
to kmb_dsi_host_bridge_init()...

   182  void kmb_dsi_host_unregister(struct kmb_dsi *kmb_dsi)
   183  {
   184          kmb_dsi_clk_disable(kmb_dsi);
   185          mipi_dsi_host_unregister(kmb_dsi->host);
                                         ^^^^^^^^^^^^^
kmb_dsi->host is dsi_host.

Every user unregisters it, but only the first user registers it.  So
if there are multiple users it will be unregistered prematurely.  Should
there be a kfree to prevent a leak?

		kfree(kmb_dsi->host);
		dsi_host = NULL;

   186  }

[ snip ]

   216  int kmb_dsi_host_bridge_init(struct device *dev)
   217  {
   218          struct device_node *encoder_node, *dsi_out;
   219  
   220          /* Create and register MIPI DSI host */
   221          if (!dsi_host) {
                     ^^^^^^^^
This is only allocated for the first user.

   222                  dsi_host = kzalloc(sizeof(*dsi_host), GFP_KERNEL);
   223                  if (!dsi_host)
   224                          return -ENOMEM;
   225  
   226                  dsi_host->ops = &kmb_dsi_host_ops;
   227  
   228                  if (!dsi_device) {
   229                          dsi_device = kzalloc(sizeof(*dsi_device), GFP_KERNEL);
   230                          if (!dsi_device) {
   231                                  kfree(dsi_host);
                                        ^^^^^^^^^^^^^^^
But now it is non-NULL but it is a freed pointer.  dsi_host = NULL;

   232                                  return -ENOMEM;
   233                          }
   234                  }
   235  
   236                  dsi_host->dev = dev;
   237                  mipi_dsi_host_register(dsi_host);
   238          }
   239  

[ snip ]

   482  
   483          of_node_put(dsi_in);
   484          of_node_put(dsi_node);
   485          ret = kmb_dsi_host_bridge_init(get_device(&dsi_pdev->dev));
                                               ^^^^^^^^^^^^^^^^^^^^^^^^^^
This get_device() needs a matching put_device().  I kind of like to put
the kref_get() calls on their own line so that they're more obvious to
the reader.

	get_device(&dsi_pdev->dev);
	kmb_dsi_host_bridge_init(&dsi_pdev->dev);

   486  
   487          if (ret = -EPROBE_DEFER) {
   488                  return -EPROBE_DEFER;
   489          } else if (ret) {
   490                  DRM_ERROR("probe failed to initialize DSI host bridge\n");
   491                  return ret;
   492          }
   493  
   494          /* Create DRM device */
   495          kmb = devm_drm_dev_alloc(dev, &kmb_driver,
   496                                   struct kmb_drm_private, drm);
   497          if (IS_ERR(kmb))
   498                  return PTR_ERR(kmb);

On these error paths we would want to unwind using a call to
kmb_dsi_host_unregister().

   499  
   500          dev_set_drvdata(dev, &kmb->drm);
   501  
   502          /* Initialize MIPI DSI */
   503          kmb->kmb_dsi = kmb_dsi_init(dsi_pdev);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is the call where the "kmb_dsi->host = dsi_host;" assignment
actually happens.

   504          if (IS_ERR(kmb->kmb_dsi)) {
   505                  drm_err(&kmb->drm, "failed to initialize DSI\n");
   506                  ret = PTR_ERR(kmb->kmb_dsi);
   507                  goto err_free1;
   508          }
   509  
   510          kmb->kmb_dsi->dev = &dsi_pdev->dev;
   511          kmb->kmb_dsi->pdev = dsi_pdev;
   512          ret = kmb_hw_init(&kmb->drm, 0);

It feels like it would be a lot easier if the kmb_dsi_init() and
kmb_dsi_host_bridge_init() functions were combined.  Probably the
dsi_host and dsi_device stuff needs to be refcounted?

Anyway, I can't test this stuff and I'm not really familiar with the
driver.  Could you fix it and CC me on the fix?

regards,
dan carpenter
