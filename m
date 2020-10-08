From: Pavel Machek <pavel@denx.de>
Date: Thu, 08 Oct 2020 18:41:05 +0000
Subject: Re: [PATCH] scsi: qla2xxx: fix return of uninitialized value in rval
Message-Id: <20201008184105.GA25478@duo.ucw.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="pWyiEgJYm5f9v55/"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201008183239.200358-1-colin.king@canonical.com>
In-Reply-To: <20201008183239.200358-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Himanshu Madhani <himanshu.madhani@oracle.com>, Pavel Machek <pavel@denx.de>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-10-08 19:32:39, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> A previous change removed the initialization of rval and there is
> now an error where an uninitialized rval is being returned on an
> error return path. Fix this by returning -ENODEV.
>=20
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: b994718760fa ("scsi: qla2xxx: Use constant when it is known")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Pavel Machek (CIP) <pavel@denx.de>

And sorry, I did patch against mainline, and this got added in -next
in the meantime.

> index ae47e0eb0311..1f9005125313 100644
> --- a/drivers/scsi/qla2xxx/qla_nvme.c
> +++ b/drivers/scsi/qla2xxx/qla_nvme.c
> @@ -561,7 +561,7 @@ static int qla_nvme_post_cmd(struct nvme_fc_local_por=
t *lport,
>  	vha =3D fcport->vha;
> =20
>  	if (!(fcport->nvme_flag & NVME_FLAG_REGISTERED))
> -		return rval;
> +		return -ENODEV;
> =20
>  	if (test_bit(ABORT_ISP_ACTIVE, &vha->dpc_flags) ||
>  	    (qpair && !qpair->fw_started) || fcport->deleted)
> --=20
> 2.27.0
>=20

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX39dQQAKCRAw5/Bqldv6
8ubJAJ9uH8LPqGBKU/7lXMlanF7poxaB7ACfTuzPpcPJVYHRQWYJQsEYlmq+bnY=
=D4l5
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
