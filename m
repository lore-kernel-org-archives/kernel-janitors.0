From: Thierry Reding <treding@nvidia.com>
Date: Mon, 04 Nov 2019 13:52:06 +0000
Subject: Re: [PATCH v2 -next] usb: gadget: Add dependency for USB_TEGRA_XUDC
Message-Id: <20191104135206.GC996639@ulmo>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ghzN8eJ9Qlbqn3iT"
List-Id: <kernel-janitors.vger.kernel.org>
References: <51315499-99d0-eca3-a7df-b8dd84628bbd@huawei.com>
 <20191104112104.195329-1-maowenan@huawei.com>
In-Reply-To: <20191104112104.195329-1-maowenan@huawei.com>
To: Mao Wenan <maowenan@huawei.com>
Cc: felipe.balbi@linux.intel.com, gregkh@linuxfoundation.org, nkristam@nvidia.com, arnd@arndb.de, johan@kernel.org, krzk@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2019 at 07:21:04PM +0800, Mao Wenan wrote:
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
> It should select USB_ROLE_SWITCH for UDC driver.
>=20
> Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device m=
ode controller")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  v2: change 'depends on' to 'select'.
>  drivers/usb/gadget/udc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3ALQIACgkQ3SOs138+
s6H4mg/+JHWEkuLTNigJyfp1Fjx7x2mGnheiPjW550oNaDoo3GpF7pINZlHqjtc9
hJxkSAdR65ftvqZTUqK/f/GkvPd2BaRVybDYPqrdTMkhGyRx4miIZSP1TYAlQBZM
57PQOwSvsiVQKViu/VAppUsWE36f+7io6SsaLr0ZHdg5G6Xjk8UOmtRyVDF2mX/e
X4+vY/PDf3wZZEKkS7qdmlaKAPsaeIFBmkkTxeTqc1tTuW54vlxAKjQ3EQBpvqGO
wFKUArJbdV9To+Yda+lN37QRyCJoBwJlnYgTlGemL9HnP0BzHBMCxQjZmBKVC0k8
pas1KFhNsen8mvuW3/MMSOP5ZZtCliBs4jxl3x5wd4g5/B+x68w3j9Mpd8JPB0Cg
uiO0qf5op2XdTKDlaQT1I1pDRvoO73qIvoMUG9ndfSJKXekERTuudQsvXoJsmSvW
L2lLIjPpGvNrVKU0L1GvdbYPL7moMGfVmlHZ+V2JtjukWClvr62j51AcfuPk5ipZ
TKosiVA9exPqVFfVvUCurgd71zi4j28gDskjD+DiZmQGuBh54FMX6iSoh3G+ysoa
suMYYtS29TtZxLywcv4SO7Fp2IPVvozI02V6phPfTiM+jMwQZMSjvptkvIxzkUdH
Wxg2KML8agl7DtsrbENTnSt/cvwUyvK6w1I+uenWB1Ki1VgbnAQ=
=3NDW
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--
