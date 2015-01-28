From: Mark Brown <broonie@kernel.org>
Date: Wed, 28 Jan 2015 19:43:51 +0000
Subject: Re: [patch] regulator: qcom-rpm: signedness bug in probe()
Message-Id: <20150128194351.GM21293@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="jaKl7zOFrmg1nrKt"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150128191531.GD10259@mwanda>
In-Reply-To: <20150128191531.GD10259@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--jaKl7zOFrmg1nrKt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2015 at 10:15:31PM +0300, Dan Carpenter wrote:
> "force_mode" is a u32 so it is never "< 0", but because of type
> promotion then comparing "== -1" will do what we want.

Applied, thanks.

--jaKl7zOFrmg1nrKt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUyTv3AAoJECTWi3JdVIfQE54H/RbZSD2k43VaX8u003oWAN0r
aL8LZ/3qXCxrRUa5ZSQe77HhDNk3YZSAEcVyOkjjPW3QzNcJxdhYpbfEs2fIf85L
zCoyqv5nAKWhz577EhsxzqQIntWLk4T5ryGe5XaVAr45ZvsqjNeRCHsQsWge9yeu
tyjK8yEm5+xe0swpXkhJeG7Nx/lfzDEmKfjR8iRWlCAe9aosmYAnmx1w5LiAjOMd
RLfetl2LWYKqF70YWZZ5sk85qWD6obJc3u8A8OM9EVhguIvPTqcdT9DU38mj8E2E
M/8DX/rsr6YPsBnO2al/h6RVX13hUortwKNM6ueRfGgKa1urZzwCJ95BdNC3STU=
=fdCS
-----END PGP SIGNATURE-----

--jaKl7zOFrmg1nrKt--
