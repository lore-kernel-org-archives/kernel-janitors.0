From: Alban <albeu@free.fr>
Date: Mon, 07 Nov 2016 08:53:35 +0000
Subject: Re: [PATCH] MIPS: ath79: Fix error handling
Message-Id: <20161107095335.276c5c7f@avionic-0020>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/z60iR6RP2Mu=WzIQF=jQuj6"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030082546.15019-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161030082546.15019-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Alban <albeu@free.fr>, ralf@linux-mips.org, antonynpavlov@gmail.com, hackpascal@gmail.com, amitoj1606@gmail.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--Sig_/z60iR6RP2Mu=WzIQF=jQuj6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sun, 30 Oct 2016 09:25:46 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> 'clk_register_fixed_rate()' returns an error pointer in case of error, not
> NULL. So test it with IS_ERR.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Aban Bedel <albeu@free.fr>

Alban

--Sig_/z60iR6RP2Mu=WzIQF=jQuj6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYIEEPAAoJEHSUmkuduC28ZX4P+gPm9fsHq0QW+oEokIPnRd6N
LUX1qwhH1g0TI5ekXQUw0e/tKTVA/P8bUqC2miFnIa8gBTPWpJxzoOoHE+Oylion
p90ym79Yo2Y19BSMRUbg06VKTCpYGS7jpxfCLI822oIYBJxMa0OZmxWT2QaXSRwg
xeI17CYsQoDIcqgilJKSCV4j/YB/LpIln4SWuVJzDuWcWCFgKP/vincCkgQHZLud
gT1LTQSKJJWNpdsyKyLOQIUkxYxCV5NhK1RpTLfWxDzww1cPqhJOWqa8kHjUoBvd
PcvQxz4GAHc0n9bRTLh+BcY0N/eIqXrXjSfb2sNLJuKy4F5KET4M5b5JNhmZHF8U
wtCutGY6O8xei7UXTiODas6s/CoYiH0J4K50SRvEnjgs9hoEVx7rPuxoFLJY4Dxv
3v8MqCGzHgFdjChT7GwocjOJe7vDS567viU+wNW14bLG75m8qL+/FbgwnfnxS4a7
wH03v2BinLT2abQHrLRLKRuozTW8d5C+58uhC5XkJtunZ+pRurkjfC54msLcSCqL
8xZZFQY3hLhuKni+C1VqBCTSqPU/1/MkqqgES9fSoiiLzr+TUnyzptJvV4FQfGlm
gtkTJ3QGUXojY/qBI3D9/l98feMwNQ/tXxqsWY+EoGh9hWbMNP6wJZX7Y1dp7Zfd
WrSECPUmNicgDpORFRTn
=u1mB
-----END PGP SIGNATURE-----

--Sig_/z60iR6RP2Mu=WzIQF=jQuj6--
