From: Leon Romanovsky <leon@kernel.org>
Date: Tue, 06 Mar 2018 10:20:44 +0000
Subject: Re: [PATCH] IB/mlx5: Fix an error code in __mlx5_ib_modify_qp()
Message-Id: <20180306102044.GJ15340@mtr-leonro.local>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="jaoouwwPWoQSJZYp"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180306100031.GB10474@mwanda>
In-Reply-To: <20180306100031.GB10474@mwanda>
To: kernel-janitors@vger.kernel.org


--jaoouwwPWoQSJZYp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 06, 2018 at 01:00:31PM +0300, Dan Carpenter wrote:
> "err" is either zero or possibly uninitialized here.  It should be
> -EINVAL.
>
> Fixes: 427c1e7bcd7e ("{IB, net}/mlx5: Move the modify QP operation table to mlx5_ib")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/infiniband/hw/mlx5/qp.c b/drivers/infiniband/hw/mlx5/qp.c
> index 90bb96292fc4..f9a1174ad7fa 100644
> --- a/drivers/infiniband/hw/mlx5/qp.c
> +++ b/drivers/infiniband/hw/mlx5/qp.c
> @@ -3118,8 +3118,10 @@ static int __mlx5_ib_modify_qp(struct ib_qp *ibqp,
>  	mlx5_new = to_mlx5_state(new_state);
>
>  	if (mlx5_cur >= MLX5_QP_NUM_STATE || mlx5_new >= MLX5_QP_NUM_STATE ||
> -	    !optab[mlx5_cur][mlx5_new])
> +	    !optab[mlx5_cur][mlx5_new]) {
> +		err = -EINVAL;
>  		goto out;
> +	}
>

Thanks Dan,
Acked-by: Leon Romanovsky <leonro@mellanox.com>

--jaoouwwPWoQSJZYp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlqea3wACgkQ5GN7iDZy
WKe6KBAAmHKN+whmu0ItQK0p4gpU55JgC2oU4Y8sDWzR8LogHJwNJ2l6jFAEEJdZ
YQRWnCo4vgrlGcIxryLnSeo+IyI4/M78c3BH7rgntt6pE02jKzqqpLJ9JchL7EVQ
zmCOzJebDd79g+uT3DFemdm41T9DoMeZFoI6ldPqD5jEOFqP5/CToTP86T7XAQp8
kL7BE6BUVgvyXYeqL1fIReh2a/WqecKjbqKFK824gd0MgLWEPQe1OktAP0BVknxj
8ZnNKpHCnHup7ZmDxDjilLWqt0OFyF/GS1cuidwb/GOemArsAY2d65dAfPKwOpaz
NY3EOBJxVQBwlmBuZLoPLvFUiGFHFeK2goblwieJ/CenHCYqjzdrRijuE6hh3wJe
c5cvp5Twsz1CmDZL61FplWgRhg6WbUsfBgPadoMQQWgAdssx5uXYbD9ez9s7F1Uf
movNrfhHZ+3QFvUl5II6VKa/11kuNr3Gzud9smGsBcSm4vs+soxSzYlyB3k26cml
W4CLsJeCYzGw20MnK1meVc3nvo/i/4Dx/1YsfztrUO/ra0TcameVTVj+2vnKTykZ
TPp4COJS6/8wjt+ZQHY3wMSZqfI/1jOdhAdlK9ZzzR5p1k1KqMkp+YrMx42ey6nr
NwO5kAQuz8QVrqDmhJ2c1zrWlKmGBIe5+xxXnQ9uBZgI9GmSVso=
=E9qr
-----END PGP SIGNATURE-----

--jaoouwwPWoQSJZYp--
