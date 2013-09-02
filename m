From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Sep 2013 22:37:37 +0000
Subject: Re: [PATCH 1/2] spi: delete premature free_irq
Message-Id: <20130902223737.GA14209@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="sdtB3X0nJg68CQEu"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1378115661-5371-1-git-send-email-Julia.Lawall@lip6.fr>
 <1378115661-5371-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1378115661-5371-2-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2013 at 11:54:20AM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Free_irq is not needed if there has been no request_irq.  Free_irq is
> removed from both the probe and remove functions.  The correct request_irq
> and free_irq appear to be in the add_host and remove_host functions in
> spi-dw.c.

Applied, thanks.

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSJRMuAAoJELSic+t+oim9GxsP/A1zIlV32D5Zc0jVpwki24G4
JXTJV7fNMkJUj+SgMBuiRZmgK4KU1MrnwfR82/PmCir6gEJKZmb9z4EffPmt7rUF
V9jr4wIBeC17/tQIS19hzlm4GlGAqtN95mdWxsiYlHLAAtl1oS/51EZdvuazNTG0
MyTHq4RwlCvHdCz3tvDRLwaXBHtwaVIQKO/pv1tjOCVthNfFhzxO+b0P7rIgb5nQ
oz4TrGOFupCF8TSwx8Z0G3406H3qSIVIMsaOPn985qHxzTgIKbArCvdFEzBwLGTc
RMCTIBbQNkL3AcIEJ50myp92YFFlHH0ahw7XHUlV0uYAmqKllmaIM+6fxfX/xVsX
DV3NP7FYcpBh5v2SgtnaZuLjyBJlU3jHP27UhcGd2ZGETThZ1xLAm4wa/pMxCZDn
/vli/wEwKFpiK/ruKTQSNf6tkEC3pFesKOlxy0VNjNgZWpWGF3bKEt2tWQkltmld
wBzwWI8PPjpwSDbw2qD63Erl/CDfH+a9epRMS06dX1rG5IbXpubCYi3P9tCGwtsX
HvvwFyJZY07Vu7Y5zyUKyWDTBOpp8+V//tvV0xtyJ1J16v2Vn9GZXduSTusRglKj
a+4ijpnb1IXiLhDQCN0W9l4SY511QtlJEw+Fw4WHCjp0FggGwgybohm6/H1iEzmB
dOTKr94YhHkPJVUDndmx
=ETsu
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
