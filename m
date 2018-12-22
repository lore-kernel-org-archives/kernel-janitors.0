From: Leon Romanovsky <leon@kernel.org>
Date: Sat, 22 Dec 2018 08:37:56 +0000
Subject: Re: [PATCH] RDMA/mlx5: Signedness bug in UVERBS_HANDLER()
Message-Id: <20181222083756.GI3940@mtr-leonro.mtl.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="dMdWWqg3F2Dv/qfw"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181222074332.GA7662@kadam>
In-Reply-To: <20181222074332.GA7662@kadam>
To: kernel-janitors@vger.kernel.org


--dMdWWqg3F2Dv/qfw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 22, 2018 at 10:43:32AM +0300, Dan Carpenter wrote:
> The "num_actions" variable needs to be signed for the error handling to
> work.  The maximum number of actions is less than 256 so int type is
> large enough for that.
>
> Fixes: cbfdd442c43e ("IB/uverbs: Add helper to get array size from ptr attribute")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/hw/mlx5/flow.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Thanks,
Acked-by: Leon Romanovsky <leonro@mellanox.com>

--dMdWWqg3F2Dv/qfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJcHffkAAoJEORje4g2clinOkgP/RXYU4u6H5JyCG9wtwq0MQew
sfncGcjA+tg3VFCTSdChJgUwygRdHruO73zmnuaxdMfi03kEVMNTDmu6GGkI7BCP
6m7ny/6SjLIxGvOmL4/CklNkmtEUJl6bme41R5XGZ5XyjzEbKGrO0kLxkXmw+nSS
x+G8m4WpXQS4RELtBVy9h5ncyujJO47hVEZbAiY80ixKtsikqnXKVcl5TgE6OiNh
20nirq3ZMmyIOIpuJ7Sf7tTXKnbYfnSFnmtyKY6u+lATss7Pfmbl0qhJMcdY8V9E
0xGMMvfuXULv4ifOo1GKXJ8GShd5mtsUzWKcYggQuEOWtNjsqZlwrEO0qvNwDei1
k61XGuDwVc1Fq3CX+rwd1xScyDz54q/EcLvAU60nGXBVAa67KG/tE1cdtKqhY4fT
Nkr3bimx+eBjqYi7aj0CKtlPux4yhNigI5/W8nEfA4adKorqaRjrORrEnZM6TYDV
44C2ktqN+P7qrzAWZfBPHpRnJdX7YbsuSZ8Je095zTM506K2YnRpzu26IR8fPgnT
wsFzijk+wnbNTs7p9pkcO7uTbfNdWxtWLsa0DeADUqYd2rTmkwy8UR8MgA0P+wSD
YTxcvVbLaxgO577cWhFNzrUcsl8iCfzHUMC+JeQynyIC7fsmrSP/693nttU14V0F
0v/ueFKRQxeUJ7ORYARH
=KTz2
-----END PGP SIGNATURE-----

--dMdWWqg3F2Dv/qfw--
