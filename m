From: Adrian Hunter <adrian.hunter@nokia.com>
Date: Mon, 20 Jul 2009 08:01:28 +0000
Subject: Re: [PATCH 9/10] drivers/mmc: Move a dereference below a NULL test
Message-Id: <4A642458.6080008@nokia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907191729580.16542@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907191729580.16542@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: "Lavinen Jarkko (Nokia-D/Helsinki)" <jarkko.lavinen@nokia.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>=20
> If the NULL test is necessary, then the dereference should be moved below
> the NULL test.
>=20
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
>=20
> // <smpl>
> @@
> type T;
> expression E,E1;
> identifier i,fld;
> statement S;
> @@
>=20
> - T i =3D E->fld;
> + T i;
>   ... when !=3D E=E1
>       when !=3D i
>   BUG_ON (E =3D NULL||
> -     i
> +     E->fld
>        =3D NULL || ...);
> + i =3D E->fld;
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>
>=20
> ---
>  drivers/mmc/host/omap.c             |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
> index e7a331d..89281ab 100644
> --- a/drivers/mmc/host/omap.c
> +++ b/drivers/mmc/host/omap.c
> @@ -255,11 +255,12 @@ static void mmc_omap_slot_release_work(struct work_=
struct *work)
> =20
>  static void mmc_omap_release_slot(struct mmc_omap_slot *slot, int clk_en=
abled)
>  {
> -	struct mmc_omap_host *host =3D slot->host;
> +	struct mmc_omap_host *host;
>  	unsigned long flags;
>  	int i;
> =20
> -	BUG_ON(slot =3D NULL || host->mmc =3D NULL);
> +	BUG_ON(slot =3D NULL || slot->host->mmc =3D NULL);
> +	host =3D slot->host;
> =20
>  	if (clk_enabled)
>  		/* Keeps clock running for at least 8 cycles on valid freq */
> --

If slot is NULL it will oops anyway, so the following is better IMHO:
=20
static void mmc_omap_release_slot(struct mmc_omap_slot *slot, int clk_enabl=
ed)
{
	struct mmc_omap_host *host =3D slot->host;
	unsigned long flags;
	int i;

> -	BUG_ON(slot =3D NULL || host->mmc =3D NULL);
> +	BUG_ON(host->mmc =3D NULL);

	if (clk_enabled)
		/* Keeps clock running for at least 8 cycles on valid freq */
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
