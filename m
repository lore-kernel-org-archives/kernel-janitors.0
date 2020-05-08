From: Mark Brown <broonie@kernel.org>
Date: Fri, 08 May 2020 17:53:50 +0000
Subject: Re: [PATCH -next] spi: spi-amd: Remove spi_master_put in amd_spi_remove()
Message-Id: <20200508175350.GA3011@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="BXVAT5kNtrzKuDFl"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507115550.139457-1-weiyongjun1@huawei.com>
In-Reply-To: <20200507115550.139457-1-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Sanjay R Mehta <sanju.mehta@amd.com>, linux-spi@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2020 at 11:55:50AM +0000, Wei Yongjun wrote:
> The call to spi_master_put() in amd_spi_remove() is redundant and
> may causes user after free since the master have been freed by
> spi_unregister_master(), so remove it.

This doesn't apply against current code, please check and resend (there
were quite a few issues that got fixed).

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl61nK0ACgkQJNaLcl1U
h9APGQgAg5Mu75hZSXDbUWOiVnemr3EA0Rq6XsrwDrZd7UUq9wXkFGqfk70MEeWj
gqcdLS68iTMFeIQ1ph1516b7cuYmMZBGU/lH22bOyYoveTpKto6QNsz3KX6G+2dC
BktSNvldIjJ2VKFtZWziAYv3QDbDCgTSskrUf+u/qNfm/oo114RO1cYbCsr6CLFZ
c0JRUNdM0MIMcjrkKz8lb81jO+bs9t1aizdgbbZvteHVF6bV6mGtLHDvxfXRu/QT
tOQMKjIUj4H3R45mDIfIevFcMEAoo9wB7ZDUkUuNoDiR7h7++ETjUTbWnEojOx+Q
FjR+eFGJMYLBh3m4QAbTssVZC72xjA==
=MHHd
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
