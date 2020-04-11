From: Paul Cercueil <paul@crapouillou.net>
Date: Sat, 11 Apr 2020 13:13:47 +0000
Subject: Re: [PATCH] usb: phy: jz4770: Add a missing '\n' in a log message
Message-Id: <ZQKM8Q.561QQF8CXZTU3@crapouillou.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200411063811.6767-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200411063811.6767-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

Le sam. 11 avril 2020 =E0 8:38, Christophe JAILLET=20
<christophe.jaillet@wanadoo.fr> a =E9crit :
> Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

Is that so?

 From what I could see these macros add the \n themselves if needed. So=20
the \n were omitted on purpose.

-Paul

> Fixes: 541368b46b82 ("usb: phy: Add driver for the Ingenic JZ4770 USB=20
> transceiver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/usb/phy/phy-jz4770.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-jz4770.c=20
> b/drivers/usb/phy/phy-jz4770.c
> index 3ea1f5b9bcf8..8f62dc2a90ff 100644
> --- a/drivers/usb/phy/phy-jz4770.c
> +++ b/drivers/usb/phy/phy-jz4770.c
> @@ -125,13 +125,13 @@ static int jz4770_phy_init(struct usb_phy *phy)
>=20
>  	err =3D regulator_enable(priv->vcc_supply);
>  	if (err) {
> -		dev_err(priv->dev, "Unable to enable VCC: %d", err);
> +		dev_err(priv->dev, "Unable to enable VCC: %d\n", err);
>  		return err;
>  	}
>=20
>  	err =3D clk_prepare_enable(priv->clk);
>  	if (err) {
> -		dev_err(priv->dev, "Unable to start clock: %d", err);
> +		dev_err(priv->dev, "Unable to start clock: %d\n", err);
>  		return err;
>  	}
>=20
> @@ -191,7 +191,7 @@ static int jz4770_phy_probe(struct=20
> platform_device *pdev)
>=20
>  	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->base)) {
> -		dev_err(dev, "Failed to map registers");
> +		dev_err(dev, "Failed to map registers\n");
>  		return PTR_ERR(priv->base);
>  	}
>=20
> @@ -199,7 +199,7 @@ static int jz4770_phy_probe(struct=20
> platform_device *pdev)
>  	if (IS_ERR(priv->clk)) {
>  		err =3D PTR_ERR(priv->clk);
>  		if (err !=3D -EPROBE_DEFER)
> -			dev_err(dev, "Failed to get clock");
> +			dev_err(dev, "Failed to get clock\n");
>  		return err;
>  	}
>=20
> @@ -207,14 +207,14 @@ static int jz4770_phy_probe(struct=20
> platform_device *pdev)
>  	if (IS_ERR(priv->vcc_supply)) {
>  		err =3D PTR_ERR(priv->vcc_supply);
>  		if (err !=3D -EPROBE_DEFER)
> -			dev_err(dev, "failed to get regulator");
> +			dev_err(dev, "Failed to get regulator\n");
>  		return err;
>  	}
>=20
>  	err =3D usb_add_phy(&priv->phy, USB_PHY_TYPE_USB2);
>  	if (err) {
>  		if (err !=3D -EPROBE_DEFER)
> -			dev_err(dev, "Unable to register PHY");
> +			dev_err(dev, "Unable to register PHY\n");
>  		return err;
>  	}
>=20
> --
> 2.20.1
>=20
