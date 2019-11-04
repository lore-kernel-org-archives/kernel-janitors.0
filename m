From: Thierry Reding <treding@nvidia.com>
Date: Mon, 04 Nov 2019 10:04:10 +0000
Subject: Re: [PATCH -next] usb: gadget: Add dependency for USB_TEGRA_XUDC
Message-Id: <20191104100410.GB996639@ulmo>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="oC1+HKm2/end4ao3"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191104025945.172620-1-maowenan@huawei.com>
In-Reply-To: <20191104025945.172620-1-maowenan@huawei.com>
To: Mao Wenan <maowenan@huawei.com>
Cc: felipe.balbi@linux.intel.com, gregkh@linuxfoundation.org, nkristam@nvidia.com, arnd@arndb.de, johan@kernel.org, krzk@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2019 at 10:59:45AM +0800, Mao Wenan wrote:
> If CONFIG_USB_TEGRA_XUDC=3Dy and CONFIG_USB_ROLE_SWITCH=3Dm,
> below erros can be seen:
> drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_remove':
> tegra-xudc.c:(.text+0x6b0): undefined reference to `usb_role_switch_unreg=
ister'
> drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_probe':
> tegra-xudc.c:(.text+0x1b88): undefined reference to `usb_role_switch_regi=
ster'
> drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_usb_role_sw_=
work':
> tegra-xudc.c:(.text+0x5ecc): undefined reference to `usb_role_switch_get_=
role'
>=20
> This patch add dependency USB_ROLE_SWITCH for UDC driver.
>=20
> Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device m=
ode controller")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/usb/gadget/udc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kcon=
fig
> index acaec3a..d103154 100644
> --- a/drivers/usb/gadget/udc/Kconfig
> +++ b/drivers/usb/gadget/udc/Kconfig
> @@ -445,6 +445,7 @@ config USB_TEGRA_XUDC
>  	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
>  	depends on ARCH_TEGRA || COMPILE_TEST
>  	depends on PHY_TEGRA_XUSB
> +	depends on USB_ROLE_SWITCH

It looks like most other drivers that use the USB role switch class do
"select" here. Now, that's suboptimal because USB_ROLE_SWITCH is a user-
visible symbol, which can lead to conflicts, so it should be avoided. I
think that in this case it might make sense to hide USB_ROLE_SWITCH and
then convert all "depends on USB_ROLE_SWITCH" occurrences to "select
USB_ROLE_SWITCH". The USB role switch class is, after all, not useful by
itself. It always needs a host and/or gadget driver to make use of it.

Thierry

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2/95oACgkQ3SOs138+
s6G6Hw/+MwXbPl4Nl23tpV771SIh5i78tZMTS7HWFmkz2bqKh2QCt+zZErVhAOFy
Uzp/fshw7u2de/UTR8K6tVXTLCBcAaTVkhJavegV1JrP6kIRRlxY1eZFbm+xZNl2
yggSDJ306dOO5MWft0+D7G0n44bQ9b8Lp8sqkmOzBdkWkMfXJ1AhZb8qmr4wHa+R
oUImWgRQrR6l3hel8VPclnMA8iiNATOtO9MTpV4zpzfPYAVPr2KCg0eAjpy5WGrq
KYoyBXJ6+TnpjXP1yw9LfyJe9cNrOK1Y1D7OHb6UEGEh4WPVtuoeaZZcmesJ4mAx
e6/ihG69puadQ0GDeJl2G6BJQDlfv4cLyWHHjWgqaVxu6Ey+wFYJ/V/bBMJOoIoE
sH8CUK3XmvtQ3o0sXdRZQnkn4c++VsLmNesQStUKpwBXHVASi6CJns+6TxkFbmeG
JDYiPQ1Ehk5QmCFPUf3rsb3bUxxgKgmV84ZsRer+gecz+1zaYZu06XJWxVdhxNVK
BmE2yZr6GFAXJfB5EJpN3xV1uhDW++3EQrFaM4GsGscZyEsO2v59YE3S9/9oWf/2
rkpAPzMTIHbWX/reXoFIgMoN3G8kaO7JN8Pam+0xMmzKovTKrY1mvSow1NuUof9p
LGVJjBVRG+cFPcDCpewSO99+cl7MENXYMnF08rE/G5gc53/62P8=
=WqfB
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
