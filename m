From: Leon Romanovsky <leon@kernel.org>
Date: Sat, 09 Sep 2017 12:56:07 +0000
Subject: Re: [PATCH] IB/rxe: check for allocation failure on elem
Message-Id: <20170909125607.GA22465@mtr-leonro.local>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="xHFwDpU9dbj6ez1V"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170908143745.2445-1-colin.king@canonical.com>
In-Reply-To: <20170908143745.2445-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Moni Shoua <monis-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 08, 2017 at 03:37:45PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The allocation for elem may fail (especially because we're using
> GFP_ATOMIC) so best to check for a null return.  This fixes a potential
> null pointer dereference when assigning elem->pool.
>
> Detected by CoverityScan CID#1357507 ("Dereference null return value")
>
> Fixes: 8700e3e7c485 ("Soft RoCE driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/sw/rxe/rxe_pool.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/infiniband/sw/rxe/rxe_pool.c b/drivers/infiniband/sw/rxe/rxe_pool.c
> index c1b5f38f31a5..3b4916680018 100644
> --- a/drivers/infiniband/sw/rxe/rxe_pool.c
> +++ b/drivers/infiniband/sw/rxe/rxe_pool.c
> @@ -404,6 +404,8 @@ void *rxe_alloc(struct rxe_pool *pool)
>  	elem = kmem_cache_zalloc(pool_cache(pool),
>  				 (pool->flags & RXE_POOL_ATOMIC) ?
>  				 GFP_ATOMIC : GFP_KERNEL);
> +	if (!elem)
> +		return NULL;
>

It is not enough to simply return NULL, you also should release "pool" too.

Thanks

>  	elem->pool = pool;
>  	kref_init(&elem->ref_cnt);
> --
> 2.14.1
>

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlmz5NUACgkQ5GN7iDZy
WKfQ9g//RbKAt/VlzmDpdDA46WRhV5QB2nLUtaSYqzf6OkaHjuG6iJbuACZknLkn
xpxQVaHa/iUFEy8pyK0uZa6JYeWpVDUqNe5Cxr/W2IFKT/TzfdaOEgOckF9ibO2f
lE1K34YmOcAgEi3oRJ/87/S5IB8NHrrhbbGBY1RPtDqaBBQoqRbPTK86z4a6xheQ
8PqnUJjHuVKghPpb0lT9TfcXYePqRUVF/mewr1BiLbVAU9WM0Fc3E36BvI345kl6
g281iWtebj+zSyi6G48+57hWpFEi3BZp0Hsk9IPSWHUkfJbWgrZDJMr1MNWn8Xje
KHa/2P4QgML/FWP5B1BZlzvKXjbwOHlgPHSmuGhmY0uBA85b0HVE/TLLTFWdIS3e
iVm/2jkK1lI0+SlEcTHzaIRSkkH1t+/DZkh1kcfEIh20VQ6ePCbX5r0jSy1cTkWW
e/PosCtT7ShvYRBqmlw1JJAmN7cCG99cv3LIxZiWJmMWKNUniqOl5snVwHWpp2rV
v8MSbRjOxqHU9rTOhNXgGUE33VnVIaB1C8oMRQdnKf4UR2yOI5yZpm+qvLmUAw4J
P4GQw9VBcXiAjdOPtJuU85Qd4ddod1ni3CYxVHVxVBACv2zCi9SVNYHBnBF9UXWV
7bI2sZIr5FzSuuj2mEfjXSJgholhXw21NSti6NDfXQyegT0Ww2s=
=OiAt
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
