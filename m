From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Wed, 13 Nov 2013 17:32:33 +0000
Subject: Re: [patch] bus: mvebu-mbus: potential forever loop in mvebu_mbus_init()
Message-Id: <20131113173232.GA2466@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113075024.GH25541@elgon.mountain>
In-Reply-To: <20131113075024.GH25541@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Nov 13, 2013 at 10:50:24AM +0300, Dan Carpenter wrote:
> "of_id->compatible" is an array and not a pointer so it can never be
> NULL.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I'm not able to compile this.
>=20
> diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
> index 2394e97..c646a76 100644
> --- a/drivers/bus/mvebu-mbus.c
> +++ b/drivers/bus/mvebu-mbus.c
> @@ -734,11 +734,11 @@ int __init mvebu_mbus_init(const char *soc, phys_ad=
dr_t mbuswins_phys_base,
>  {
>  	const struct of_device_id *of_id;
> =20
> -	for (of_id =3D of_mvebu_mbus_ids; of_id->compatible; of_id++)
> +	for (of_id =3D of_mvebu_mbus_ids; of_id->compatible[0]; of_id++)
>  		if (!strcmp(of_id->compatible, soc))
>  			break;
> =20
> -	if (!of_id->compatible) {
> +	if (!of_id->compatible[0]) {
>  		pr_err("could not find a matching SoC family\n");
>  		return -ENODEV;
>  	}

Nice catch.

Just for the sake of it, I reproduced the bug, and then tested it's
solved by the patch. The issue only hits the old platforms that aren't
converted to DT.

Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

IMHO, this is a "potential" bug, trigerred only if the code itself is
wrong (which is not) and it's not serious enough to hit stable.
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
