From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Fri, 24 Aug 2018 18:21:53 +0000
Subject: Re: [PATCH] ixgb: replace dma_alloc_coherent + memset with dma_zalloc_coherent
Message-Id: <9f9cff98f1f7f0b9c9250a3a14f1ba0ea7268ed8.camel@intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-uT4qeAtkdph1xQY1SHL7"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180824165232.21585-1-colin.king@canonical.com>
In-Reply-To: <20180824165232.21585-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--=-uT4qeAtkdph1xQY1SHL7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-08-24 at 17:52 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Use dma_zalloc_coherent rather than dam_alloc_coherent and memset.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/intel/ixgb/ixgb_main.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Thanks Colin, I already have this change queued up from another community
member and I am just about to send a pull request to Dave for this change,
as well as several other fixes.

--=-uT4qeAtkdph1xQY1SHL7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiTyZWz+nnTrOJ1LZ5W/vlVpL7c4FAluATMEACgkQ5W/vlVpL
7c5rEQ/5AczVpaGY6KZ9MKBk+tU3G9ELyUmEFM+t27tQvTfHlPMbixO27NgvEXKC
wHEgHMR1t6WcW0N6N66oMcMLgyRo/holxn2qbSGwhLB7Pwb6iUSe/lnXjfqKuFzv
q/EtLuJH3y/VWyRQAziS4aqhScOD37th0LYEtSRKv/tph5a4aJsMw5RImwPbLIZs
H4+YS9Xm0LjnlIjyLC4/5LYOCjlO03eZF0fq0jZSYXG5AM+AZtR0/1AZjSwlQ2YW
8lyvVJ7XO+F1Q/RoCNFK9cYVB3FrlRRO4jkae0UoLp7Ld5nNTLG+Czp94es53Mz+
ch293uHs59/nQzhMcr6S8dpZxF9MBgkiDJlU7HTKa5BDw6U+9lvrQ4/w2ak5ytxb
I4Qv3FIOULP5GwzVbq5zfowSpzZTKxOb9wDl1fyDzTIeGhZG6A3ir+1jVqavbaKP
pFjmR7UqgE1hroAuJseyu6WjNUNPhzw9XMGmCAAnT42EeC4CNJoltze/l9ckUu7y
ZNycXUqQMKHT2KDrRJarQoK3xBzC1gsJ4ryJzW3Suqzo9OoGE5ZrhIkB5oPh2zIV
5+WQUgog5HNCJnvGoAM1HNpMoPX72PJIk4DAuHeui6+O6x0T+wdiXR3DabwyCBVj
XoUvGkdQNkKqpPIJ81B+K5CKHRFvgZniHlh5p6OCuDOkKPkwtvE=
=IGf/
-----END PGP SIGNATURE-----

--=-uT4qeAtkdph1xQY1SHL7--
