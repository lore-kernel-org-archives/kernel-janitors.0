From: Leon Romanovsky <leonro@mellanox.com>
Date: Wed, 10 Jan 2018 07:40:03 +0000
Subject: Re: [PATCH][next] IB/mlx5: remove redundant assignment of mdev
Message-Id: <20180110074003.GG7368@mtr-leonro.local>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vKFfOv5t3oGVpiF+"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180109155543.15027-1-colin.king@canonical.com>
In-Reply-To: <20180109155543.15027-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Matan Barak <matanb@mellanox.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--vKFfOv5t3oGVpiF+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 09, 2018 at 03:55:43PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The initial assignment to mdev is redundant as mdev is re-assigned
> later and the first assigned value is never read. Remove this
> redundant assignment.
>
> Cleans up clang warning:
> drivers/infiniband/hw/mlx5/main.c:359:24: warning: Value stored
> to 'mdev' during its initialization is never read
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/mlx5/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Thanks,
Acked-by: Leon Romanovsky <leonro@mellanox.com>

--vKFfOv5t3oGVpiF+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlpVw1MACgkQ5GN7iDZy
WKfS8w/+NxORkbTeJkscltbJSDP4eqyxti8nZcylzbPW2xkZpHW3siJzyiOJY692
kYccLEsTGXy3CqvUg/s4IqySQlepJSXhN+OBIC7OOcEQ67ovnF3iLbD6+R+cCczu
lf/wg9xczz73H1LrWhWuIBHuch99NRf9JbrBz3I96hwXnZPQ9TaiJJvjHRFKcsVa
z66/VT3wShL0xPpwpyz1BOEpGXBcsQiJhbISfm7/kbnZ4sgUJQEli58GCcvhHCEi
14MJetyGAg7fCI3vPs2y1rN7cY2LVZ+Mtt3IR9EPlJG0rDyrIgQdJlh7SMOxw8R4
en4TwTl3h5qk3B1X1AjH2iqeMY6zWoYnJKRa89EZFt7eNN7G28D3oO8nqKBBSL5T
1Hv3Zf0NfCIQi9YbIXu6BFCnCaIXwmIpYaoFy+bIgLb3+1KN3CeSjzJkzxunUNWf
p5scM2oiPjC9vDnTKw34dZOje45ugiq8llPNzFLhVOk3Mr0ijNqK1T4Tn188jhCl
OHmwhwR9lTnBNLxdhtjIwl7vBTXZQYCXBlbZXvp6Ce1DXjYdMkqvx8pQcWssT24S
MDmwxL+CtKjIp3RE+9TeMqQKBFBfPyid8RjCkFsS/WiYC5fUXdisaxbVOfBJ98hi
co55jnPQgaGAoFRiE7E5tWeEMGhkbUMTNP+VA4uvyoTq5yVFLoU=
=YBBx
-----END PGP SIGNATURE-----

--vKFfOv5t3oGVpiF+--
