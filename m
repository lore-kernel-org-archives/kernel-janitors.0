From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Jan 2018 15:47:33 +0000
Subject: Re: [PATCH 2/3] mfd/sm501: Improve a size determination in two functions
Message-Id: <20180122154733.zpqfqryoyrwo63s2@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f292e2f3-2471-4ea0-3a02-349e6c10ff03@users.sourceforge.net>
 <3b264527-b43f-b6aa-0570-c6d48ed24679@users.sourceforge.net>
In-Reply-To: <3b264527-b43f-b6aa-0570-c6d48ed24679@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 15 Jan 2018, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 15 Jan 2018 15:47:03 +0100
>=20
> Replace the specification of data structures by pointer dereferences
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/sm501.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
> index 7298d6b571a1..d5ab3481794a 100644
> --- a/drivers/mfd/sm501.c
> +++ b/drivers/mfd/sm501.c
> @@ -1380,10 +1380,9 @@ static int sm501_init_dev(struct sm501_devdata *sm)
> =20
>  static int sm501_plat_probe(struct platform_device *dev)
>  {
> -	struct sm501_devdata *sm;
>  	int ret;
> +	struct sm501_devdata *sm =3D kzalloc(sizeof(*sm), GFP_KERNEL);
> =20
> -	sm =3D kzalloc(sizeof(struct sm501_devdata), GFP_KERNEL);

Leave this here please.

Just s/struct sm501_devdata/*sm/

>  	if (sm =3D NULL) {
>  		ret =3D -ENOMEM;
>  		goto err1;
> @@ -1569,10 +1568,9 @@ static struct sm501_platdata sm501_pci_platdata =
=3D {
>  static int sm501_pci_probe(struct pci_dev *dev,
>  				     const struct pci_device_id *id)
>  {
> -	struct sm501_devdata *sm;
>  	int err;
> +	struct sm501_devdata *sm =3D kzalloc(sizeof(*sm), GFP_KERNEL);
> =20
> -	sm =3D kzalloc(sizeof(struct sm501_devdata), GFP_KERNEL);

As above.

>  	if (sm =3D NULL) {
>  		err =3D -ENOMEM;
>  		goto err1;

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
