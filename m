From: Mark Brown <broonie@kernel.org>
Date: Tue, 30 Jul 2013 20:48:02 +0000
Subject: Re: [PATCH 3/3] spi: spi-txx9: Fix warning by including linux/gpio.h
Message-Id: <20130730204802.GY9858@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="cPy7SRi4qQV1n2US"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375205737-3468-3-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1375205737-3468-3-git-send-email-emilgoode@gmail.com>
To: kernel-janitors@vger.kernel.org


--cPy7SRi4qQV1n2US
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2013 at 07:35:37PM +0200, Emil Goode wrote:
> According to the following commit direct inclusion of asm/gpio.h
> is deprecated.
> 7563bbf89d065a2c3f05059ecbcc805645edcc62
> ("gpiolib/arches: Centralise bolierplate asm/gpio.h")

This is already fixed.

--cPy7SRi4qQV1n2US
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR+CZ/AAoJELSic+t+oim9+kAP/jEc6yeuDkSxaPcBleQqVb4+
W23CfHGoyrzXedyNqgV+qy7px6IkE7OX0+jVlyNL2D/diVwy3rhCrF9AX/k7qvlr
8FgFiGjep6rF/O/ihfxvIFfkLrpJNvUZI/2LVz8eFtAWJ4RO70QoWlIEKxeAfZQr
UxWsAYil/v71vt+BrbF8a4cTCi0HG2dOVk9wHAhBqkoki3auF7zUhXuqiuCRIJ5H
nSa34KucxRw/4SZm/1/Q7ZSBliJW+ArAG03zZJhi/qmODyx5q0s2ikeujSdfrTLK
K6nfhWunZdwMoxy29ZIkF31hFiFI5egzhnIUyqe0QOU7tqWHiPNaluJIbZ/ShOHt
5Ikw5oFgmnuuccVeuqtVXK3HGuWLHINS2lqmHGWO/QDwme5CAv2kK+a4hPRqwK3U
wa0tF0mtk4KoCMaJz6oV9Q0vZxYDNvtxZtIJWqO0XErXBCWYnt6eiMVpghVGh+p3
9NJHnTdjA4IXFWtgxTwXxUAEyQuY6Af2RaZQ47e03DUcfsCLi9BQQ6IHbPXvmmzY
Ynof6/OCcD1nFSo1yHzvTBIuCbv9A2hCcFx9BWhus8ZU28WhbnKt23ZZLCKSmCwV
UhZY3oen1lMlR5OqijZVn9jYh8ZEb2e4x0jud0xt5vhrTsilyqle9akF9pKlk/bS
6A6sS7W36Fogd9iifu3c
=Fwfr
-----END PGP SIGNATURE-----

--cPy7SRi4qQV1n2US--
