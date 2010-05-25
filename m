From: Andre Noll <maan@systemlinux.org>
Date: Tue, 25 May 2010 14:56:13 +0000
Subject: Re: [patch] md/raid10: check for ERR_PTR returns from setup_conf()
Message-Id: <20100525145613.GD1211@skl-net.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="KdquIMZPjGJQvRdI"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100525094017.GD22515@bicker>
In-Reply-To: <20100525094017.GD22515@bicker>
To: Dan Carpenter <error27@gmail.com>
Cc: Neil Brown <neilb@suse.de>, Robert Becker <Rob.Becker@riverbed.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <jens.axboe@oracle.com>, linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org


--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11:40, Dan Carpenter wrote:
> setup_conf() can return error values so I added a check for that here.
>=20
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>=20
> diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
> index 0372499..8bd7da2 100644
> --- a/drivers/md/raid10.c
> +++ b/drivers/md/raid10.c
> @@ -2454,6 +2454,8 @@ static void *raid10_takeover_raid0(mddev_t *mddev)
>  	mddev->recovery_cp =3D MaxSector;
> =20
>  	conf =3D setup_conf(mddev);
> +	if (IS_ERR(conf))
> +		return conf;
>  	conf->scale_disks =3D 2;
>  	return conf;
>  }

Looks good. Feel free to add my Acked-By.

BTW: setup_conf() could use some cleanup: The "couldn't allocate
memory" error message at the bottom is misleading, and the function
returns ERR_PTR(-ENOMEM) also if md_register_thread() fails.

Here's a question for Neil: raid10_takeover_raid0() sets
mddev->new_layout, but setup_conf() uses the old values of the
raid0. How is this supposed to work?

Thanks
Andre
--=20
The only person who always got his work done by Friday was Robinson Crusoe

--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFL++UNWto1QDEAkw8RArWLAJ0UzsayPZJS/D3WBP2UQdtFRdqu8wCgp8+J
mbgWr/oXr+TiLuSThMTDQnU=
=JMOm
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--
