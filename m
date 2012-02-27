From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Feb 2012 10:48:29 +0000
Subject: Re: [PATCH 2/2 v2] Staging:android: Initialise buffer and buffer_size before used
Message-Id: <20120227104829.GB2766@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1LKvkjL3sHcu1TtY"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330337871-27830-2-git-send-email-ruan.zhengwang@gmail.com>
In-Reply-To: <1330337871-27830-2-git-send-email-ruan.zhengwang@gmail.com>
To: kernel-janitors@vger.kernel.org


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2012 at 06:17:51PM +0800, Zhengwang Ruan wrote:
> GCC warns 'buffer' and 'buffer_size' are used with being uninitialized, a=
nd
> 'buffer' is used as returned value, and 'buffer_size' is initialized using
> uninitialized_var to clear warning.
>=20
> Signed-off-by: Zhengwang Ruan <ruan.zhengwang@gmail.com>

Looks good.

regards,
dan carpenter


--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPS198AAoJEOnZkXI/YHqRKjUP/R1UuZsMlNM2u6UIlah6SF63
aI+giFpVDrtAgwz/PnbO4AODsStsgNgwyRbCfw9hb+FzqzZKBko3L3iuTB1t3qJU
hDjCukxE/K61jbAAlRW+wWNKhGfsRunmJD7LxTHKl8A1xtCCorgApWAEWK353GZt
N8YMUOqlMkkKqEkmFsUXeDkruVw/NHiBYkJzsZ0M3AQrf6/mdtOLMbp8alU2ZGhJ
1CyDVW4p/d//3GqCfDQCdvspt6jyab/rrnjLEuZMbAQFhIHQf6DOVLdPu/USznxf
78mzXsIiq11AiqxYPA1/sMDbFMmvKHWqL+BuKXX00jnZNBbUpmqqfW/1FfBiG+BF
6eA8igSGnqPp/PMjTwoGZnb8VdrAVgNMe4heyCbjcmnRqxY8SkSNeM2jaqqVZCWJ
pchihUzGs3iZ1vNxtxthJ0RfWduoTuoKYCYjUBqApjeIR4onhAG3lI1hGX827oXO
FGQKMt1jhrRwW3V5JYBjqN6iOnOYQ6zDePQhxCkLBIQcT0CwOnqUPu5qNL2o6Joq
K9aB5gysTz2NMG2TxIKjrv6hx9oOvBSnONAq5MQHxE2wPUJdVLk/41u5rrwpNsvv
TOuNywYG0OpsgMkpdQhLFsJHceqz5N2NMLqVR3gxRnQNcEjpXJRWBioDIGXDMehC
4vm+VsXwtNaxpvH1DbbV
=kEea
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
