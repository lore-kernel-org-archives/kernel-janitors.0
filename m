From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Sat, 17 May 2014 19:18:21 +0000
Subject: Re: [PATCH v3] ARM: imx: fix error handling in ipu device registration
Message-Id: <20140517191821.GD16662@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400352033-18262-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1400352033-18262-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

Hello Emil,

On Sat, May 17, 2014 at 08:40:33PM +0200, Emil Goode wrote:
> If we fail to allocate struct platform_device pdev we
> dereference it after the goto label err.
>=20
> I have rearranged the error handling a bit to fix the issue
> and also make it more clear.
>=20
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
> v3: Made subject line more specific.
> v2: Changed to return -ENOMEM instead of ret where possible and
>     updated the subject line.
>=20
>  arch/arm/mach-imx/devices/platform-ipu-core.c |   22 +++++++++++++------=
---
>  1 file changed, 13 insertions(+), 9 deletions(-)
Considering that you can fix the issue also by just doing:

diff --git a/arch/arm/mach-imx/devices/platform-ipu-core.c b/arch/arm/mach-=
imx/devices/platform-ipu-core.c
index fc4dd7cedc11..6bd7c3f37ac0 100644
--- a/arch/arm/mach-imx/devices/platform-ipu-core.c
+++ b/arch/arm/mach-imx/devices/platform-ipu-core.c
@@ -77,7 +77,7 @@ struct platform_device *__init imx_alloc_mx3_camera(
=20
 	pdev =3D platform_device_alloc("mx3-camera", 0);
 	if (!pdev)
-		goto err;
+		return ERR_PTR(-ENOMEM);
=20
 	pdev->dev.dma_mask =3D kmalloc(sizeof(*pdev->dev.dma_mask), GFP_KERNEL);
 	if (!pdev->dev.dma_mask)

or

diff --git a/arch/arm/mach-imx/devices/platform-ipu-core.c b/arch/arm/mach-=
imx/devices/platform-ipu-core.c
index fc4dd7cedc11..c609f3667200 100644
--- a/arch/arm/mach-imx/devices/platform-ipu-core.c
+++ b/arch/arm/mach-imx/devices/platform-ipu-core.c
@@ -96,7 +96,8 @@ struct platform_device *__init imx_alloc_mx3_camera(
 		ret =3D platform_device_add_data(pdev, pdata, sizeof(*pdata));
 		if (ret) {
 err:
-			kfree(pdev->dev.dma_mask);
+			if (pdev)
+				kfree(pdev->dev.dma_mask);
 			platform_device_put(pdev);
 			return ERR_PTR(-ENODEV);
 		}

I would prefer one of them as it is easier to justify and for the next
cycle convert the function to platform_device_register_full.

Also you should point out in the commit log that the issue was found by
coccinelle.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
