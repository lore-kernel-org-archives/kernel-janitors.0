From: Mark Brown <broonie@kernel.org>
Date: Mon, 27 Oct 2014 18:18:30 +0000
Subject: Re: [patch v2] regulator: max77802: fix a test in max77802_set_suspend_mode()
Message-Id: <20141027181830.GD18557@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="mu4SaHkdL1Az71rA"
List-Id: <kernel-janitors.vger.kernel.org>
References: <71442C69-B48C-46B8-93A1-068AC26E01C2@collabora.co.uk>
 <20141027104506.GA22704@mwanda>
In-Reply-To: <20141027104506.GA22704@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--mu4SaHkdL1Az71rA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 27, 2014 at 01:45:06PM +0300, Dan Carpenter wrote:
> The original test triggers a static checker warning.  Javier Martinez
> Canillas says that the "!" is a typo and should be removed.

Applied, thanks.

--mu4SaHkdL1Az71rA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUTox2AAoJECTWi3JdVIfQY0IH/jkZbtpqfSvfKXT7EOK0iZT+
KOrcHAcDAbqxQbpJ+EI21Xuw7H6gRb/Hzd8tg8m7lO0ubX7S9GCo+LYpC4MnKPwK
xGa7T3gMKW+hFP9rAm5urCWxBIqzmP5yFjy9JeR9lnt09I2QtVKL/6ZrWl9qQkPe
j9KatlZWTFUk8em5Y8WdDTBjp6NAVMRGxSjYjRySbe1If3BwKxxN1mpA7mkPDYMz
1Fpe2AswT+nRxr5+dk56bMq7+1D4au4wVQz4e0H/Rmo3ryZIDTlm5CSOaiPeUW4A
66jfO5h92crg86t5vuzc7VLkAiChvVTQvGMcEthKHIAMJ/UQQ6GRx7pAsd8Utp8=
=lSWF
-----END PGP SIGNATURE-----

--mu4SaHkdL1Az71rA--
