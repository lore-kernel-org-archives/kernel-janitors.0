From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 17 May 2014 22:51:53 +0000
Subject: Re: [PATCH v3] ARM: imx: fix error handling in ipu device registration
Message-Id: <20140517225153.GB20413@lianli>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400352033-18262-1-git-send-email-emilgoode@gmail.com>
 <20140517191821.GD16662@pengutronix.de>
 <20140517220836.GI15585@mwanda>
In-Reply-To: <20140517220836.GI15585@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

Hello Dan,

On Sun, May 18, 2014 at 01:08:36AM +0300, Dan Carpenter wrote:
> On Sat, May 17, 2014 at 09:18:21PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > diff --git a/arch/arm/mach-imx/devices/platform-ipu-core.c b/arch/arm/m=
ach-imx/devices/platform-ipu-core.c
> > index fc4dd7cedc11..6bd7c3f37ac0 100644
> > --- a/arch/arm/mach-imx/devices/platform-ipu-core.c
> > +++ b/arch/arm/mach-imx/devices/platform-ipu-core.c
> > @@ -77,7 +77,7 @@ struct platform_device *__init imx_alloc_mx3_camera(
> > =20
> >  	pdev =3D platform_device_alloc("mx3-camera", 0);
> >  	if (!pdev)
> > -		goto err;
> > +		return ERR_PTR(-ENOMEM);
> > =20
> >  	pdev->dev.dma_mask =3D kmalloc(sizeof(*pdev->dev.dma_mask), GFP_KERNE=
L);
> >  	if (!pdev->dev.dma_mask)
>=20
> Emil, do this one, please and not the second suggestion.

Yes, I would pick this one to.

>=20
> Direct returns are more readable.  Otherwise, you wonder what the goto
> is for and where it will take you and be annoyed to discover it is a
> waste of time, no-op goto.  Also you will wonder if platform_device_put()
> accepts NULL pointers.  Thirdly there is a small ugliness that the error
> code is not preserved.  What is the point of setting the error code to
> -ENOMEM only to discard it?
>=20
> Let's look at that error handling again.
>=20
> err:  <-- the name is not descriptive.  the location is bad.
> 		kfree(pdev->dev.dma_mask);  <- null dereference.
> 		platform_device_put(pdev);  <- ok
> 		return ERR_PTR(-ENODEV);    <- should be "return ERR_PTR(ret);"
>=20
> 3 out of 4 of the lines are bad.

I agree that it's not very pretty.

Now that Uwe solved the issue regarding converting the function to
platform_device_register_full(), I will look into sending a second patch
that would remove these lines.

Thank you!

Best regards,

Emil Goode
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
