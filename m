From: Joey Pabalinas <joeypabalinas@gmail.com>
Date: Thu, 29 Nov 2018 02:06:13 +0000
Subject: Re: [PATCH -next] RDMA/uverbs: Use PTR_ERR_OR_ZERO in ib_uverbs_create_cq()
Message-Id: <20181129020613.ghbw7pe6hfpjjdj7@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="t66snjvfkac6crju"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543455402-79511-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543455402-79511-1-git-send-email-yuehaibing@huawei.com>
To: kernel-janitors@vger.kernel.org


--t66snjvfkac6crju
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2018 at 01:36:42AM +0000, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Joey Pabalinas <joeypabalinas@gmail.com>

--=20
Cheers,
Joey Pabalinas

--t66snjvfkac6crju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEENpTlWU2hUK/KMvHp2rGdfm9DtVIFAlv/SZQACgkQ2rGdfm9D
tVKiOBAAto9R8F/iUl0Y+aTRkT8i2HEi6iB296OMR/guQIaRD1ECVmKSGQW9I5nn
pPjHMWHg+/ho7L7d0rRSxAg1dEvxrfG+VAEKVNdBYNwAW9udfhyVv/jmWpwqGmC5
NnZIzCi/yhpv9EKcGhGWs9eB+aRqdDgTDs+Dq31J5kijy7fzZRhfckr7QPh7ImCP
Q4i8q9t+P+Xi1bbXnfAgZ4315nkgAS0ZyoYUmH9WNTYL7GAHW4mcVDspOs9Rf8Bv
jd2NbZ5kKq/bkgsPefJ3yaN+l9Idh1dKpWI+Bmf3q/h4jhUT4faEQo1lD+Vz5hfL
QcQT54cHl1QFPXoJ5KQQ1jBBzisA+RGO5GQKaAG5wEYqibBNoeQ8QoofeTUVc5cQ
FPgFAvkS78Fo/RUr3lgRVS7DEdM/k2wHcGyr32W/swNYYYRC+M2CCQxnuTv01d/L
k30rqI87YZL7EeHVhsoBTqEeQPy2dIzcBvxh/h3GuM4p8mRMlRA0DeMpJ8s0ijRQ
lWjo+gjmE/zl9OC5ADxvFIfGJKW3PyJxeVx+THn3EeHyJLvzqlYxFbu9gzLp46nc
WCxFflGPMs/8CBA0TeVwxxJOa1BJ/xNn9a04KSZo84PnzD2A2AmkRrRfkVYi59xK
5TQAt7hdZpeLM3OEFwZ+JlsQGez43OUxkBD4LB12wuxTqh4mIrY=
=+MRl
-----END PGP SIGNATURE-----

--t66snjvfkac6crju--
