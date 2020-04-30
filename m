From: Wolfram Sang <wsa@the-dreams.de>
Date: Thu, 30 Apr 2020 20:06:59 +0000
Subject: Re: [PATCH v2] i2c: i2c-amd-mp2-pci: Fix Oops in amd_mp2_pci_init() error handling
Message-Id: <20200430200659.GA19155@ninjato>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="2fHTh5uZTiUOsy+g"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAC_JBqofuyRiSmK0mFqVLaY=5k9MYmjGaVmggx2dn_YjN8VOmw@mail.gmail.com>
 <20190910134242.GA6620@mwanda>
 <20200430141050.GB3355@ninjato>
 <CAC_JBqo4x0KBdb3j3VFrZu5sG2Mfx3xpbDzFk68h3TU99ZVj3Q@mail.gmail.com>
In-Reply-To: <CAC_JBqo4x0KBdb3j3VFrZu5sG2Mfx3xpbDzFk68h3TU99ZVj3Q@mail.gmail.com>
To: Elie Morisse <syniurge@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Nehal Shah <nehal-bakulchandra.shah@amd.com>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Yes I'm still here to review patches.

Glad to hear that :)


--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6rL98ACgkQFA3kzBSg
KbZhCg//QeNHhV9f1rXCvKq5Q0ePNMrFWiSk3HTktz1ULK5o8oRvjberyUM7azzd
estLO7Wy8q4pFrxmXFs2K3sY3xIB/JyjMKIHMcfvV0gdEb8QHVo5S7BVsbga7qKB
YRV6Pwk8Z0vbjGfxHjSUomY2x7NRbNJdOS0uMyBMPdG4yRUHo3KJ/ZA7iAeIVB87
/w7l9mWd6UcQNCdANxMGOhnd5WqdfDCuCAVqpKJ5qWe+G8yNo09VcgGSwKCOfait
nIuiiY2pDo9MxsvYRBlP3VqQiEQCcQEKZpLzbvC4hP7/GAqa1Jl4Uzwd5GsLCjPw
IjuX88WWb3Ls2s0G4WBUMCHAfhXw6PL6+aZ6JewGlR3jxOlsRKzpU2eTRlcYm45c
7MYmHW2V/cmYgqm67WvkP/P8EeqK5dEl3QZNF0k2g2cvjlFidImDKEOBIk8eFofw
RQhh7dEWYKds2E8kdF7gdZYt/OeMhgQiwGwINHZs91yHXn4tOtrGW2+rvQPoRQry
Iw0736Kz8Fhp0jxYAXaqAdsSkPnsZJib2ReE0Dd8hMwCFF4iTF2p1jRw6WR7YTrf
bocsIj5OAIkkQLIOliiPdp6JWLEDsoNNjyt5jCjkq+VD2XfVW5lUSOS/niYX/EX6
6ooQfkAHWTD+X5IlBLaweUV6q2smwT31j+xetgueb8pYCVnQXdw=
=g4f+
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
