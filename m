From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 17 Jul 2017 10:28:56 +0000
Subject: Re: [PATCH] serial: st-asc: Potential error pointer dereference
Message-Id: <20170717102856.fjxpo2miyn4vmaid@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170717081238.bjjp5vvzq56yv2q3@mwanda>
In-Reply-To: <20170717081238.bjjp5vvzq56yv2q3@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Patrice Chotard <patrice.chotard@st.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 17 Jul 2017, Dan Carpenter wrote:

> It looks like we intended to return an error code here, because we
> dereference "ascport->pinctrl" on the next lines.
>=20
> Fixes: 6929cb00a501 ("serial: st-asc: Read in all Pinctrl states")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/tty/serial/st-asc.c b/drivers/tty/serial/st-asc.c
> index f5335be344f6..6b0ca65027d0 100644
> --- a/drivers/tty/serial/st-asc.c
> +++ b/drivers/tty/serial/st-asc.c
> @@ -758,6 +758,7 @@ static int asc_init_port(struct asc_port *ascport,
>  	if (IS_ERR(ascport->pinctrl)) {
>  		ret =3D PTR_ERR(ascport->pinctrl);
>  		dev_err(&pdev->dev, "Failed to get Pinctrl: %d\n", ret);
> +		return ret;
>  	}

Good spot.

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
