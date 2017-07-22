From: Doug Ledford <dledford@redhat.com>
Date: Sat, 22 Jul 2017 17:30:15 +0000
Subject: Re: [PATCH v2] IB/mlx5: Fix a warning message
Message-Id: <8fe6b27d-4485-f3d9-2c62-84a5448ad39b@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="CnUN4HQ6U4o7UeEAnGuW9DFchgl9aoaEw"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614102009.GA5171@elgon.mountain>
In-Reply-To: <20170614102009.GA5171-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Matan Barak <matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CnUN4HQ6U4o7UeEAnGuW9DFchgl9aoaEw
Content-Type: multipart/mixed; boundary="38AC76scG3vDgNbIFurLE5j1BtQel6amS";
 protected-headers="v1"
From: Doug Ledford <dledford@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Matan Barak <matanb@mellanox.com>
Cc: Leon Romanovsky <leonro@mellanox.com>, Sean Hefty <sean.hefty@intel.com>,
 Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Message-ID: <8fe6b27d-4485-f3d9-2c62-84a5448ad39b@redhat.com>
Subject: Re: [PATCH v2] IB/mlx5: Fix a warning message
References: <20170614102009.GA5171@elgon.mountain>
In-Reply-To: <20170614102009.GA5171@elgon.mountain>

--38AC76scG3vDgNbIFurLE5j1BtQel6amS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/14/2017 6:20 AM, Dan Carpenter wrote:
> "umem" is a valid pointer.  We intended to print "*umem" or even just
> "err" instead.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This was accepted into 4.13-rc, thanks.

--=20
Doug Ledford <dledford@redhat.com>
    GPG Key ID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FD=
D


--38AC76scG3vDgNbIFurLE5j1BtQel6amS--

--CnUN4HQ6U4o7UeEAnGuW9DFchgl9aoaEw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJZc4uoAAoJELgmozMOVy/dR2AQAJ2WdFvKzS8Tt/epQNh5Odeh
2opvZlDgqUfKdivQ1tbfRF9a4rbkRB5lFPWFDQnkSLUyhpHjCNjXIZa99Bdz6jCS
pfPXRLwPC20+kkmKtGWwbp9i9ZXtVVWadcJ8oDU4AEu+HNwMFig3gnokiXC21jCG
s8konk6n5IN3+gADFx4mySzUT1kwk8jv8i97IKM/pVQnVWzVErb9Yv0QtQRHJlLy
MjobS4NH5HyrnIb/QgTVogV5Jr8KHYS28h+fT14eAApk+bBpNGgE0QhmeAeMH2lj
ILgJkqgVcfeYRkfzei3yTe1C64RMhEDQt/Rlr7rKv3U2rVLf/rIJF3NygzE5TgHl
IjPSKM5qqi6vlIVgpAWBb65eG4ekZsptYD6bPAEMXrtwYgOOArw6bKwX86JG/4zL
TuMS6yfHARbQ6ovFygYoSjbemn/BmUXFVIHnPBJKKo+JQTzz6np4B0dWik1Iuf75
Pf1nmQ6N6T4AaiRPok4kNQG7T9sd/hD4E8ILMeVht2VNJ4rI0GHUGcgFCtn6j+Ne
r6W4wgQa4XCCqkJO9kuQUb5op0S+tvSLyRzGNF6+Vf2RN6Vo+OobcL/Pu/ZmaewS
sDHPakrDG/M+IE/OXMtR78SB5hw4tfjPBr12/T8DH9oOTHicS8/1nmM0bTiMWKbY
aViFHW+EuPIEmrK4N2uR
=HZ8A
-----END PGP SIGNATURE-----

--CnUN4HQ6U4o7UeEAnGuW9DFchgl9aoaEw--
