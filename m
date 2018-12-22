From: Leon Romanovsky <leon@kernel.org>
Date: Sat, 22 Dec 2018 08:37:31 +0000
Subject: Re: [PATCH] IB/uverbs: Signedness bug in UVERBS_HANDLER()
Message-Id: <20181222083731.GH3940@mtr-leonro.mtl.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="y0Ed1hDcWxc3B7cn"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181222074259.GA6338@kadam>
In-Reply-To: <20181222074259.GA6338@kadam>
To: kernel-janitors@vger.kernel.org


--y0Ed1hDcWxc3B7cn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 22, 2018 at 10:42:59AM +0300, Dan Carpenter wrote:
> The "num_sge" variable needs to be signed for the error handling to
> work.  The uverbs_attr_ptr_get_array_size() returns int so this change
> is safe.
>
> Fixes: ad8a4496757f ("IB/uverbs: Add support to advise_mr")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/core/uverbs_std_types_mr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Thanks,
Reviewed-by: Leon Romanovsky <leonro@mellanox.com>

--y0Ed1hDcWxc3B7cn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJcHffKAAoJEORje4g2clinMRgQAJhqfcjZVzsxHZ3cT5O7fdYW
xu7aCucHJJrZz52v4CxH0PORM/X1mmVx1r3jHqSfgVx+pTneGUxcrQDuZRlz4XGz
WlZcBsWsvj1SaqonVVBf/O0+8Y3PXrnDSDgIW3jYooI0B+lXNaIwGJDUihFi9swE
Qjj1wZj8qGtM0cyyJgB2O0mgd+SaJmuxc4YOv65o5Q/hV3A7+FXjr+U4XwuVMSL9
zANfV8JhtFvbHObyer6cRExAHVAX1HTurCKGvrlQTSM+gMxuhIy+q68CcRXhnNS3
3c+gPNY/9jIZjVtEw6OrMPgkR/RESY3QIVM1Qq14w2USK0CIX3ZSsdW8kzcDQD8w
81tW3cwIrnyij0bYGf9nIE6BNYTzVnvmyZkdS735ImEHM9N+E7i0HtgKJHYVnoT8
wmLwjIJEQqGvVET/G0C2VQbEbtkIUutDxyEgP1SY65AqFZT5TCbIqugSl9Q1gRcg
vhgPLLnlGVXJ70fB0O2v9XmYQZb/FJREbQAhk2wbITalqT/zxJfbEGvIfGgWjsfp
si5HuR9Cs0S4GIeGOeCpzfN5/ny7KWXZ2A7HLDp0PXtNq6WTEvhpKHzSqLfhNeQH
bnBv/yECuc46tjiJTs3yUjYTkqDAcDsqOSbV+Kc3WuZf/6LjsVIVs6ooGA9tHZt3
C1+gFMEPG2G9F8OOMzJI
=/42w
-----END PGP SIGNATURE-----

--y0Ed1hDcWxc3B7cn--
