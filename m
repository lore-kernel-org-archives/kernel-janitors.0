From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Jan 2018 15:50:09 +0000
Subject: Re: [PATCH 2/3] mfd/omap-usb-tll: Improve a size determination in usbtll_omap_probe()
Message-Id: <20180122155009.je377sf325rva7y4@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c048a681-70e4-ecdd-e0f8-48c8f1bb0ac4@users.sourceforge.net>
 <49a9d036-ab90-4342-90a8-db63e027017e@users.sourceforge.net>
In-Reply-To: <49a9d036-ab90-4342-90a8-db63e027017e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, 15 Jan 2018, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 15 Jan 2018 13:43:53 +0100
>=20
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/omap-usb-tll.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
> index 7945efa0152e..c8b4ad40910a 100644
> --- a/drivers/mfd/omap-usb-tll.c
> +++ b/drivers/mfd/omap-usb-tll.c
> @@ -220,8 +220,7 @@ static int usbtll_omap_probe(struct platform_device *=
pdev)
>  	int					i, ver;
> =20
>  	dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
> -

Keep the space between.

> -	tll =3D devm_kzalloc(dev, sizeof(struct usbtll_omap), GFP_KERNEL);
> +	tll =3D devm_kzalloc(dev, sizeof(*tll), GFP_KERNEL);
>  	if (!tll)
>  		return -ENOMEM;
> =20

--=20
Lee Jones
Linaro Services Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
