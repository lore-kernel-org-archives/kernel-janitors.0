From: Thierry Reding <treding@nvidia.com>
Date: Mon, 04 Nov 2019 13:53:12 +0000
Subject: Re: [PATCH -next] usb: gadget: Add dependency for USB_TEGRA_XUDC
Message-Id: <20191104135312.GD996639@ulmo>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="AkbCVLjbJ9qUtAXD"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191104025945.172620-1-maowenan@huawei.com>
 <20191104100410.GB996639@ulmo>
 <51315499-99d0-eca3-a7df-b8dd84628bbd@huawei.com>
In-Reply-To: <51315499-99d0-eca3-a7df-b8dd84628bbd@huawei.com>
To: maowenan <maowenan@huawei.com>
Cc: felipe.balbi@linux.intel.com, gregkh@linuxfoundation.org, nkristam@nvidia.com, arnd@arndb.de, johan@kernel.org, krzk@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2019 at 06:50:01PM +0800, maowenan wrote:
>=20
>=20
> On 2019/11/4 18:04, Thierry Reding wrote:
> > On Mon, Nov 04, 2019 at 10:59:45AM +0800, Mao Wenan wrote:
> >> If CONFIG_USB_TEGRA_XUDC=3Dy and CONFIG_USB_ROLE_SWITCH=3Dm,
> >> below erros can be seen:
> >> drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_remove':
> >> tegra-xudc.c:(.text+0x6b0): undefined reference to `usb_role_switch_un=
register'
> >> drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_probe':
> >> tegra-xudc.c:(.text+0x1b88): undefined reference to `usb_role_switch_r=
egister'
> >> drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_usb_role_=
sw_work':
> >> tegra-xudc.c:(.text+0x5ecc): undefined reference to `usb_role_switch_g=
et_role'
> >>
> >> This patch add dependency USB_ROLE_SWITCH for UDC driver.
> >>
> >> Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB devic=
e mode controller")
> >> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> >> ---
> >>  drivers/usb/gadget/udc/Kconfig | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/K=
config
> >> index acaec3a..d103154 100644
> >> --- a/drivers/usb/gadget/udc/Kconfig
> >> +++ b/drivers/usb/gadget/udc/Kconfig
> >> @@ -445,6 +445,7 @@ config USB_TEGRA_XUDC
> >>  	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
> >>  	depends on ARCH_TEGRA || COMPILE_TEST
> >>  	depends on PHY_TEGRA_XUSB
> >> +	depends on USB_ROLE_SWITCH
> >=20
> > It looks like most other drivers that use the USB role switch class do
> > "select" here. Now, that's suboptimal because USB_ROLE_SWITCH is a user-
> > visible symbol, which can lead to conflicts, so it should be avoided. I
> > think that in this case it might make sense to hide USB_ROLE_SWITCH and
> > then convert all "depends on USB_ROLE_SWITCH" occurrences to "select
> > USB_ROLE_SWITCH". The USB role switch class is, after all, not useful by
> > itself. It always needs a host and/or gadget driver to make use of it.
> >=20
>=20
> Thanks, I send v2 and change 'depends on' to 'select' for this patch.

Great, can you also follow up with a patch to hide the USB_ROLE_SWITCH
option so that we can avoid any of the pitfalls associated with user-
visible symbols and "select"?

Thierry

--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3ALUgACgkQ3SOs138+
s6FPmxAAiLkvZmH6WxxECfBraeXgrnYbOZ57nQ8la5FefdC72v96CbsGbHZkiEwU
HWT4vwaX6QEXHypUWQ86McqO4UNaGtohXcNlhn9X867z/aH1LzYhhLMYAgQpmhVs
a8HZ4q36s6BIIgrrvF2cvM5ax78SlNxVheWWDj+cyXdKa25ykwUGAdRvDcCzz7VL
rk/iJhyoNIZLIKtwP+QrEIjVYCfqN7od2nBIP6WewhPKzQA/DtRu1mC0bmr90Fgk
ApzrC8+iXabXh+RIiyG2+8XTHdQo0Sui5V35KClrWelhokF8AKPejuyTdGOd3O/J
m7cFSJhPWed9el5rWyY1UcURL9jzCSQ3Cv9ZVUQdhMSXKAf24wirP2OXgMjrq1Sg
VD6v2BuZer4wY92iPhQ3zRXy/YLxclv94Kn7t4L8aXH6fc0QE09njcGFq/kazmS/
2HoGlBeRIQRNtwWVlEI+U1fbi4HIbhhgLxfcU/OIfQuVFqWB1hzBY38aXLDvF/2w
RKZE1CdrxfbM/xGzhhx75LuPfPKnyUUu/MdcNBqwpNpJ9TpTnymqIth9BYSmTGIb
0rFc14nxRD+KVrinSOWLvPjs5acQXGUEQ8YmcVEqK1i1Q121aQNqWdAK++ls84UU
z5S5G58ui0C2jyBdvY0utpnaILNB4f9gg7z6wehixGdqUUHReks=
=vxGA
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--
