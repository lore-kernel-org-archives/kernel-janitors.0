From: Mark Brown <broonie@kernel.org>
Date: Tue, 12 Nov 2013 01:26:13 +0000
Subject: Re: [patch] ASoC: rcar: off by one in rsnd_scu_set_route()
Message-Id: <20131112012613.GJ2674@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="cN519qCC4CN1mUcX"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131108094610.GE27977@elgon.mountain>
In-Reply-To: <20131108094610.GE27977@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>


--cN519qCC4CN1mUcX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 08, 2013 at 12:46:10PM +0300, Dan Carpenter wrote:
> If "id == ARRAY_SIZE(routes)" then we read one space beyond the end of
> the routes[] array.

Applied, thanks.

--cN519qCC4CN1mUcX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSgYOyAAoJELSic+t+oim9riIP/3e/M/mBEHTUXuPiERAix4Sw
pmxkuWdRxiZsnakiZHOp5UHxAyBCYM2BwPynNVgl9mQv6+lbmTQZrFsBYy/+8TpT
KN/B9P8BVyYbABq3AcNueoo8++DehjChfFnIQCyA3DfQBSRa4/7PsKQpfyG6jUS9
ZGZxz248sAUT9HnfK4DEL1zM+Frr5WoG6YOTY+1omA8mKDI27T08Ca3SZDOHHj9Z
g0dtGMPIjWHXhFs9+YB72CYtM7SXLVSV4xmxCU94NX5dfUDdObjaaxeMltiOcwNp
JfzHT2npaNIcJ7HfNa0Gw07o4hrayxIdgeNX2YikB7j3AWLgSxqRNc93OuR5FjM+
vlTASxrthLVOaxKb0Rw+5XWaaOp7XbcJNXfzEtn/5lJ5LchDdnVGlaCq+Cdwo+5p
efTcyh9C3gK9gcDZu4KUj+NInO9hl4swBExWrKaJQFgZyQErgdWJ/PQCiKsLpFPi
5BmNegX4XAxB/n28CdWeEMZQOJI1BnQQ/MuH60hMHn08ywx8Ajbx+KjguNXYzJGp
XHgXakmHGXdUw7tQKh9Vc4t4Yv4kzhKOWbj8CU4i39SgZHyqx8AB2UzI7Hrlkri1
3ijLHbrhC6QgLq/SnDFWDi2lHO7fGTdDCKRNlcHyrWGLp+4R+kMAWYhgRtoty0i/
fMk3VeBEwnTFaF+ToMH+
=rxYp
-----END PGP SIGNATURE-----

--cN519qCC4CN1mUcX--
