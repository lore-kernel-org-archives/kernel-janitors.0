From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 Jan 2012 13:44:14 +0000
Subject: Re: [patch] exofs: add a cap on the memcpy() size
Message-Id: <20120130134414.GV3294@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="TG7lY2/6mW/akb80"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120130075949.GA22364@elgon.mountain>
In-Reply-To: <20120130075949.GA22364@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--TG7lY2/6mW/akb80
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 03:37:29PM +0200, Boaz Harrosh wrote:
> I think I'd like something like:
> -  	memcpy(odi->systemid, dt_dev->systemid, odi->systemid_len);
> +	if (likely(odi->systemid_len))
> + 		memcpy(odi->systemid, dt_dev->systemid, OSD_SYSTEMID_LEN);
>=20
> Which should also make the static checkers happy. What do you think?
>=20

Sounds good to me.

regards,
dan carpenter


--TG7lY2/6mW/akb80
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPJp6uAAoJEOnZkXI/YHqRYLkP/0TKM2AH2PpInx4YqujCsZat
FUoaY0UA9tREW1Yid2GnFHnN/nz2RxYyizCMA1EyExfA/JGdOpiu341sudf5lews
Bi+4kAKi3S/5KlAqzpkYFyOjUpLVD9w9SALi1p1vRqa+xHjd0Iv2ulVSD/kyzpoz
/eW+MxHYN0+b4xs+ewIX5U702jTIgOdXMOsB4OLEgoVI9wYO0g3uPRck7BgbZaVZ
q2QBM5GFQhRg4Ac4z8O7UH3x36wHfHWzUESYYzdD7m8QDlwRkbZzhoyvZtDhItK0
hHsp4W/hQ/q+0qLiu6Nw4PYfKMVqUeWWzjLX4RnsBGZFpKTyTPxMX2tghEjQY62E
s2av73x2Rm44LLrkEtlFbOymxoysh186LOI5sdDOLA94w1L2IHsf43NT9xMU5CaZ
0ZU5UGnRhH1vspid7P2pa/CgjRiomG6Trdt+T3C/S3J/S8MEWT7v8eQ4QjH+a9di
U9gIj4VzJIuoT4uHN+ENsU+cQFySK4mTi1bfSXvA6/UNgfoePZUOconGwNRI9Ach
SDzxiN99b9Wo+dTSPzU3zneGpa7GwBVlfPQqe4BjZ10CipEFo20Ukh2mcvM+MK6H
GV7E6UmRwX/Xd7Y0n3Kt+gvP4NqVORhid51WHbbskGPEpAYhDZD33N518Y1N4vGB
3eDlEDadssxaAOnXEFql
=sYba
-----END PGP SIGNATURE-----

--TG7lY2/6mW/akb80--
