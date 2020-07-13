From: Benjamin Poirier <benjamin.poirier@gmail.com>
Date: Mon, 13 Jul 2020 04:59:59 +0000
Subject: Re: [PATCH] staging: qlge: Remove pci-dma-compat wrapper APIs.
Message-Id: <20200713045959.GA7563@f3>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="9jxsPFA5p3P2qPhR"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711124633.GA16459@blackclown>
In-Reply-To: <20200711124633.GA16459@blackclown>
To: Suraj Upadhyay <usuraj35@gmail.com>
Cc: devel@driverdev.osuosl.org, GR-Linux-NIC-Dev@marvell.com, gregkh@linuxfoundation.org, manishrc@marvell.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020-07-11 18:16 +0530, Suraj Upadhyay wrote:
> The legacy API wrappers in include/linux/pci-dma-compat.h
> should go away as it creates unnecessary midlayering
> for include/linux/dma-mapping.h APIs, instead use dma-mapping.h
> APIs directly.
>=20
> The patch has been generated with the coccinelle script below
> and compile-tested.
>=20
[...]
>=20
> @@ expression E1, E2, E3, E4; @@
> - pci_dma_sync_single_for_device(E1, E2, E3, E4)
> + dma_sync_single_for_device(&E1->dev, E2, E3, (enum dma_data_direction)E=
4)

The qlge driver contains more usages of the deprecated pci_dma_* api
than what this diff addresses. In particular, there are some calls to
pci_dma_sync_single_for_cpu() which were not changed despite this
expression being in the semantic patch.

Dunno what happened but it should be reviewed. After converting away
=66rom all of the old api, the TODO file should also be updated.

[...]

>=20
> diff --git a/drivers/staging/qlge/qlge_mpi.c b/drivers/staging/qlge/qlge_=
mpi.c
> index fa178fc642a6..16a9bf818346 100644
> --- a/drivers/staging/qlge/qlge_mpi.c
> +++ b/drivers/staging/qlge/qlge_mpi.c
> @@ -788,8 +788,9 @@ int ql_dump_risc_ram_area(struct ql_adapter *qdev, vo=
id *buf,
>  	char *my_buf;
>  	dma_addr_t buf_dma;
> =20
> -	my_buf =3D pci_alloc_consistent(qdev->pdev, word_count * sizeof(u32),
> -				      &buf_dma);
> +	my_buf =3D dma_alloc_coherent(&qdev->pdev->dev,
> +				    word_count * sizeof(u32), &buf_dma,
> +				    GFP_ATOMIC);
>  	if (!my_buf)
>  		return -EIO;
> =20
> @@ -797,8 +798,8 @@ int ql_dump_risc_ram_area(struct ql_adapter *qdev, vo=
id *buf,
>  	if (!status)
>  		memcpy(buf, my_buf, word_count * sizeof(u32));
> =20
> -	pci_free_consistent(qdev->pdev, word_count * sizeof(u32), my_buf,
> -			    buf_dma);
> +	dma_free_coherent(&qdev->pdev->dev, word_count * sizeof(u32), my_buf,
> +			  buf_dma);
>  	return status;
>  }
> =20
> --=20
> 2.17.1
>=20



--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEkvpDtefvZykbqQVOaJBbS33YWS0FAl8L6koACgkQaJBbS33Y
WS1JBA/+J9cy/Iz2PMdfWkQxIYA+Et7kUXCQ21Vc1Iaz+TslGD0tYqvp8jcZe8wg
gzVTHeosvCxsTn9BuTjeXnHHPEIsFl6EMRlW7xoXOkvpV0iZ/ZJ1/nK2UT/C8haf
yJo096ohW877MbE227k9wqrZZroC168padc6XGEepMoBhQ0W5Hs+soybKQj3od4J
8WnOC/oF06Feu/KdvkUeqwAHVj0w2Vwlhw+lUyNlsrxY5ZPx6BkjZLm9rNTgplu7
UuLgyhXzeq8RUtN6If06T15+tl4e0lDPFPmBQVM60J3aq+4wzGQg2lvXOzL27urL
DUWywJ79h2diXPjDEfyJow5661c6ubIBRagvvgYd5fHFLmqcevo0Dtw/k3C0cNg+
NmdyoMlU0/Db2Op3btgSjKdidlfMM0ImkuOiUYKR6FHf+rk2rxLQTt2z0/FK8QQi
LdTGR5zHSofGsuWpCvkKVgTXuLMtCCseY9kvOkaIyBl7uv2BW6RbnjGoHpO+G+PF
S20mH3WQojjD8+YwP7Dw0One+Lr+5aiM8tzqIXz7IMk4Q10XFWpKZpCYJCdPDiSg
3H3jTDcBvH4ngEDIHP/6SmNpB8WLSBRpaoC13hUQcpEJKBtzkvpPisElsWgRwkRw
J4IRtz70uN/bW/m4zRxpKDP28NDMZCfzHGbMtdJk10n4w8oFvxc=
=TkyJ
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
