From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 17 May 2014 15:35:40 +0000
Subject: Re: [PATCH v2] ARM: imx: fix error handling
Message-Id: <20140517153540.GA4309@lianli>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400234045-6022-1-git-send-email-emilgoode@gmail.com>
 <5375EB13.8000200@bfs.de> <20140516111646.GC4366@lianli>
 <5375FB36.8020004@bfs.de> <20140516193139.GQ16662@pengutronix.de>
In-Reply-To: <20140516193139.GQ16662@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

Hello Uwe,

On Fri, May 16, 2014 at 09:31:39PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello Walter,
>=20
> On Fri, May 16, 2014 at 01:49:10PM +0200, walter harms wrote:
> > Am 16.05.2014 13:16, schrieb Emil Goode:
> > > Hello Walter,
> > >=20
> > > On Fri, May 16, 2014 at 12:40:19PM +0200, walter harms wrote:
> > >>
> > >>
> > >> Am 16.05.2014 11:54, schrieb Emil Goode:
> > >>> If we fail to allocate struct platform_device pdev we
> > >>> dereference it after the goto label err.
> > >>>
> > >>> I have rearranged the error handling a bit to fix the issue
> > >>> and also make it more clear.
> > >>>
> > >>> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> > >>> ---
> > >>> v2: Changed to return -ENOMEM instead of ret where possible and
> > >>>     updated the subject line.
> > >>>
> > >>>  arch/arm/mach-imx/devices/platform-ipu-core.c |   22 +++++++++++++=
---------
> > >>>  1 file changed, 13 insertions(+), 9 deletions(-)
> > >>>
> > >>> diff --git a/arch/arm/mach-imx/devices/platform-ipu-core.c b/arch/a=
rm/mach-imx/devices/platform-ipu-core.c
> > >>> index fc4dd7c..68f2a4a 100644
> > >>> --- a/arch/arm/mach-imx/devices/platform-ipu-core.c
> > >>> +++ b/arch/arm/mach-imx/devices/platform-ipu-core.c
> > >>> @@ -77,34 +77,38 @@ struct platform_device *__init imx_alloc_mx3_ca=
mera(
> > >>> =20
> > >>>  	pdev =3D platform_device_alloc("mx3-camera", 0);
> > >>>  	if (!pdev)
> > >>> -		goto err;
> > >>> +		return ERR_PTR(-ENOMEM);
> > >>> =20
> > >>>  	pdev->dev.dma_mask =3D kmalloc(sizeof(*pdev->dev.dma_mask), GFP_K=
ERNEL);
> > >>>  	if (!pdev->dev.dma_mask)
> > >>> -		goto err;
> > >>> +		goto put_pdev;
> > >>> =20
> > >>>  	*pdev->dev.dma_mask =3D DMA_BIT_MASK(32);
> > >>>  	pdev->dev.coherent_dma_mask =3D DMA_BIT_MASK(32);
> > >>> =20
> > >>>  	ret =3D platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
> > >>>  	if (ret)
> > >>> -		goto err;
> > >>> +		goto free_dma_mask;
> > >>> =20
> > >>>  	if (pdata) {
> > >>>  		struct mx3_camera_pdata *copied_pdata;
> > >>> =20
> > >>>  		ret =3D platform_device_add_data(pdev, pdata, sizeof(*pdata));
> > >>> -		if (ret) {
> > >>> -err:
> > >>> -			kfree(pdev->dev.dma_mask);
> > >>> -			platform_device_put(pdev);
> > >>> -			return ERR_PTR(-ENODEV);
> > >>> -		}
> > >>> +		if (ret)
> > >>> +			goto free_dma_mask;
> > >>> +
> > >>>  		copied_pdata =3D dev_get_platdata(&pdev->dev);
> > >>>  		copied_pdata->dma_dev =3D &imx_ipu_coredev->dev;
> > >>
> > >>
> > >> the patch is fine, but what use is this copied_pdata ?
> > >> It scope ends next line ?
> > >>
> > >> re,
> > >>  wh
> > >=20
> > > I also thought that looked a bit odd, but copied_pdata is a temporary
> > > pointer to platform_data of the dev struct.
> > >=20
> > > dev_get_platdata looks like this:
> > >=20
> > > static inline void *dev_get_platdata(const struct device *dev)
> > > {
> > >         return dev->platform_data;
> > > }
> > >=20
> > > So I believe it's a more compact way of writing:
> > >=20
> > > pdev->dev->platform_data->dma_dev =3D &imx_ipu_coredev->dev;
> It's not about compactness. The dev_get_platdata accessor exists to be
> used instead of directly accessing dev->platform_data. I admit a comment
> would be nice ...
>=20
> Anyhow this is all ugly, actually you'd want to have the dma_dev member
> already fixed when calling platform_device_add_data. But you cannot
> simply do
>=20
> 	pdata->dma_dev =3D &imx_ipu_coredev->dev;
> 	ret =3D platform_device_add_data(pdev, pdata, sizeof(*pdata));
>=20
> because *pdata is const.

Thank you for the explanation. Regarding the possibility of using
platform_device_register_full() to simplify this function. It seem to
be possible, the following inline function is available to help with this.

imx_add_platform_device_dmamask()

Available here:

arch/arm/mach-imx/devices/devices-common.h

But as you mentioned above we need to allocate a new platform_device
struct before we can assign &imx_ipu_coredev->dev to dma_dev, since
pdata is const. I guess this assignment could be done after calling
imx_add_platform_device_dmamask() but I don't think that makes the
code easier to read.

I think it's best to resend the current patch. (with updated subject line)

Best regards,

Emil Goode



--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
