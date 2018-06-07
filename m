From: Leon Romanovsky <leon@kernel.org>
Date: Thu, 07 Jun 2018 05:56:27 +0000
Subject: Re: [PATCH -next] IB/mlx5: Fix return value check in flow_counters_set_data()
Message-Id: <20180607055627.GA2958@mtr-leonro.mtl.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="3607uds81ZQvwCD0"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1528336061-13069-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1528336061-13069-1-git-send-email-weiyongjun1@huawei.com>
To: kernel-janitors@vger.kernel.org


--3607uds81ZQvwCD0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 07, 2018 at 01:47:41AM +0000, Wei Yongjun wrote:
> In case of error, the function mlx5_fc_create() returns ERR_PTR() and
> never returns NULL. The NULL test in the return value check should be
> replaced with IS_ERR().
>
> Fixes: 3b3233fbf02e ("IB/mlx5: Add flow counters binding support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/infiniband/hw/mlx5/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Thanks a lot, I thought that I fixed it prior submission, anyway.

Acked-by: Leon Romanovsky <leonro@mellanox.com>

--3607uds81ZQvwCD0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJbGMkLAAoJEORje4g2clinU6IP/R6swuXbQ8QcsJfsrdhN+xqZ
cOagWsHRWCr8TZi8AkBRs9ysqsTnMSAMQMRXRvZ62231/jWyoZ3fIkuNITfg4Syu
FxzhCC0GA19stdyTl/kAPZqmnbddbO/FZGn0dIkk2kgPHF7p1qAid4HPEPpxO7T+
ZEij7okxu3XH/d/+6YBtr1GmY2+HhWZsRsOIO3Y3J9zFvaTIkIWApVjFXO4f0QWh
ZcLWR4bwGQfig7ONmWJg/Zg5otecG9i5bDgxUwK2epZ0ZUclIatEEBnYlFhxnSfh
1MKTEGO/XE+XbZv7aKY/lsBfFwDwLkAb5G8/ytIlY8j59UVkGtYEOq82SA+gwGZd
LAfjE7H/qmpaSoaqGgrbQrRtIv9kzOQktF0cKVpbjPBYciPgaCrUbzCETK/9p11P
cvGt0Vu8vLxpoH/8Mvf9cCXFKrCEMpH5A+XkA35VuVGi1nXxHxvm2LZtO8JX+djV
BbmtcdyjRA5IHB71aJ6WkMR2r7lzY/OfN60jw1iyJXU0bZifEd4gdgM8X/q3lFmv
sdiQ8aFMvQdC7x3VVarOhiwFBwjtiEYEN1RmOJHWjMfU+W6gfuk4tj4PL88U8S6j
Li2FTkQhepfj71yYN1s+DxeXDblDCbKpQAIVmk1mu6k5uwt4dTful//xfrapom0s
xc4J5EoU45Z/cQv3ySgw
=6iXr
-----END PGP SIGNATURE-----

--3607uds81ZQvwCD0--
