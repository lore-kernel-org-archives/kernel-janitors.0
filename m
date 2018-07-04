From: Leon Romanovsky <leon@kernel.org>
Date: Wed, 04 Jul 2018 16:27:43 +0000
Subject: Re: [PATCH] IB/core: type promotion bug in rdma_rw_init_one_mr()
Message-Id: <20180704162743.GP3014@mtr-leonro.mtl.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="THYEXwetZJOK3OLY"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704093211.o62tr44m3ugxxhjh@kili.mountain>
In-Reply-To: <20180704093211.o62tr44m3ugxxhjh@kili.mountain>
To: kernel-janitors@vger.kernel.org


--THYEXwetZJOK3OLY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 04, 2018 at 08:49:47AM -0600, Jason Gunthorpe wrote:
> On Wed, Jul 04, 2018 at 12:55:41PM +0200, H=E5kon Bugge wrote:
> >    Is:
> >
> >    if (ret < (int)nents) {
> >
> >    a more intuitive fix?
>
> That could lead to truncation/force negativeness of nents :(

IS_ERROR_VALUE() from include/linux/err.h?

>
> I wonder how many bugs like this we have.

Judging by the number of similar patches in netdev, I don't think
that we will have many "bugs", but maybe I'm wrong about it.

>
> Jason
> --
> To unsubscribe from this list: send the line "unsubscribe linux-rdma" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--THYEXwetZJOK3OLY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJbPPV/AAoJEORje4g2clin1JQQAIHnKQuciXnQgK1LZvQ/qSRK
NfwgLVs5vhXrKSMwCri/zJLnH8CozQf87+FyxFuSrwiRCWF7GIdmUSj8sF31pBuo
+UGHVE8gSLMO2oTaI1sHuyIMe7lWXySmt1jhLD0JFwlmIrjuQEXHj+CFkkTfq4ay
/NVDUs/LMuLqVoUnXkGYxbm6MGCfMJT9Zyo9b0hmAsVCSo8mO1C2FjKtMcj41xhc
qouy6p/5LpSF0V5OM2NmWy+muYJPYAJ+RMoBHyl76F6367HxxkKvhUjbfIDlKgUM
mCQTEdKDbcBNyHMEGfTO2L1NyZTQpcHxbnUUAEO/p1gmAo+Vca9hRA9s9NRBGkfI
rLZzy8R/vAW6B4DQ72m8WjFXLTmpfymNcx2sLlNsJ0cloSqpj9fZgaDPfq3D6i08
sqVEjDnsv1yMS8IEm50XEYB6C1FgVOPhM7de4XVS9hU0zH/JMfZBCbW6Ul2aDF3X
mYiRMziqmd2bW8B59bodDV9pCxirKyqJeMX5+Oq8ChTR6A6NO30v0gZTPWc93wq4
FVKZPMqQZKpTmr7r5V1eog5cSAJ2qX1H2jbZ60pm6FAh4iN0V5jGgFQ4kGG86id/
Xqn3fDjm/LeKLx5B0R1PiDbNopm1NrI/ukvImI3IpVoMuliNenqsxoed+HcI4bLc
eChh72cdfzOVQNuPaVqg
=I28g
-----END PGP SIGNATURE-----

--THYEXwetZJOK3OLY--
