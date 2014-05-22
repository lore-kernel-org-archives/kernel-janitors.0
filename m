From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Thu, 22 May 2014 18:10:24 +0000
Subject: Re: [PATCH] ARM: imx: introduce function imx_free_mx3_camera
Message-Id: <20140522181024.GA20155@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400781080-6117-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1400781080-6117-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

Hello Emil,

On Thu, May 22, 2014 at 07:51:19PM +0200, Emil Goode wrote:
> We forgot to free pdev->dev.dma_mask on error after
> having called the imx_alloc_mx3_camera function.
> This patch introduces the imx_free_mx3_camera function
> that adds the missing kfree call and is practical for
> future usage with imx_alloc_mx3_camera().
>=20
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
>  arch/arm/mach-imx/devices-imx31.h             |    2 ++
>  arch/arm/mach-imx/devices-imx35.h             |    2 ++
>  arch/arm/mach-imx/devices/devices-common.h    |    1 +
>  arch/arm/mach-imx/devices/platform-ipu-core.c |   11 +++++++++--
>  arch/arm/mach-imx/mach-mx31_3ds.c             |    2 +-
>  arch/arm/mach-imx/mach-mx31moboard.c          |    3 +--
>  arch/arm/mach-imx/mach-mx35_3ds.c             |    2 +-
>  arch/arm/mach-imx/mach-pcm037.c               |    2 +-
>  8 files changed, 18 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/arm/mach-imx/devices-imx31.h b/arch/arm/mach-imx/device=
s-imx31.h
> index e8d1611..900d3b0 100644
> --- a/arch/arm/mach-imx/devices-imx31.h
> +++ b/arch/arm/mach-imx/devices-imx31.h
> @@ -45,6 +45,8 @@ extern const struct imx_ipu_core_data imx31_ipu_core_da=
ta;
>  	imx_add_ipu_core(&imx31_ipu_core_data)
>  #define imx31_alloc_mx3_camera(pdata)	\
>  	imx_alloc_mx3_camera(&imx31_ipu_core_data, pdata)
> +#define imx31_free_mx3_camera(pdev)	\
> +	imx_free_mx3_camera(pdev)
I wouldn't make this a globally visible function. Today all imx machines
should get their devices from an oftree, so the various functions to add
devices started to bitrot. Moreover there is no reason to remove a
device once it was successfully added.

Note that platform_device_register_full has the same problem (i.e.
pdev->dev.dma_mask isn't freed when the last reference to a device is
dropped.) You'd do a better deed if you picked up
http://thread.gmane.org/gmane.linux.kernel/1613364/focus=1635995
instead of fixing dead code. But feel free to choose yourself where you
want to patch.

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
