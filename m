From: Joey Pabalinas <joeypabalinas@gmail.com>
Date: Sat, 01 Dec 2018 01:55:46 +0000
Subject: Re: [PATCH -next] mmc: jz4740: Use PTR_ERR_OR_ZERO in jz4740_mmc_request_gpios()
Message-Id: <20181201015546.iyt23vckp6soc6uz@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="qkbibrxljbdznq7e"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543628746-101825-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543628746-101825-1-git-send-email-yuehaibing@huawei.com>
To: kernel-janitors@vger.kernel.org


--qkbibrxljbdznq7e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 01, 2018 at 01:45:46AM +0000, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Joey Pabalinas <joeypabalinas@gmail.com>

On Sat, Dec 01, 2018 at 01:45:46AM +0000, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/mmc/host/jz4740_mmc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
> index 6f7a99e..8eca423 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -975,10 +975,7 @@ static int jz4740_mmc_request_gpios(struct jz4740_mm=
c_host *host,
> =20
>  	host->power =3D devm_gpiod_get_optional(&pdev->dev, "power",
>  					      GPIOD_OUT_HIGH);
> -	if (IS_ERR(host->power))
> -		return PTR_ERR(host->power);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(host->power);
>  }
> =20
>  static const struct of_device_id jz4740_mmc_of_match[] =3D {

--=20
Cheers,
Joey Pabalinas

--qkbibrxljbdznq7e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEENpTlWU2hUK/KMvHp2rGdfm9DtVIFAlwB6iEACgkQ2rGdfm9D
tVIVihAAoDoMrH9IldnS2L4UwiyddeauEwH9TodKZsM4OGsC0Zk1bo0PSJP1feca
6KEFipRp/WKf8QITyLr3SmM4Nwnc0vvoZx0KNdByfLDKGLkYjE/hqytevNo+Fo6n
QjCbrTUGR6ZvhrkdOQ1Ba5QKU27NwaxjlDFmQWhpYB9J1hOLoDChNcr8UptJ5UST
+mb2c/du620So2N/sYZMdsvkqzN570L0KuvzyR9iOZdWdCZRVKOSyWDb/yKFo67i
ZiJvDx3qyMxx+QU+aITDzcQT93bphbUTYjPtA2E/R9N7MyhnpuI/HMLUMzu+Kedx
sdPwS56DJ4qaldzhBTDqY0TIkQGP3JJXeDShLr7ZmeOQ6qAEbyWko8lb+fVuSDyv
XIv8whFRMSqomWSQcDtppFdmId9If7tmURUmJVmmmrfdFfv3fMr+5JbvY5NHloJ2
8z2FlkmtA8xtBn0foQaDd3UCmM5/3h46KkXRUQwQ2mGyPcWjGrLh8+EAUY0vIUix
/+HnnqDClHah+ABoDOv23vfQEz7FJ3mz2kw5uVJpWUNzFYXfmSmiuZJWde1Fpkiu
rAsuwhpLwCvugGZj4uZZoeMddE7zan6Mk5PRAW7x2KXNvGiEWpCKPAqz0pQtCldJ
7SHtKryen9gwkNUJ+p0OJ+bHJrJg8IOYcmzU4PrOoE4/8tlipcg=
=G/jB
-----END PGP SIGNATURE-----

--qkbibrxljbdznq7e--
