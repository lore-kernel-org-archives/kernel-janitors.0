From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 24 Mar 2018 09:36:15 +0000
Subject: Re: [B.A.T.M.A.N.] [PATCH][next] batman-adv: don't pass a NULL hard_iface to batadv_hardif_put
Message-Id: <1552330.yTaGxcYA6e@sven-edge>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart1524434.qlbeyyzbMd"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323225350.7350-1-colin.king@canonical.com>
In-Reply-To: <20180323225350.7350-1-colin.king@canonical.com>
To: b.a.t.m.a.n@lists.open-mesh.org
Cc: Colin King <colin.king@canonical.com>, Marek Lindner <mareklindner@neomailbox.ch>, Simon Wunderlich <sw@simonwunderlich.de>, Antonio Quartulli <a@unstable.cc>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart1524434.qlbeyyzbMd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Freitag, 23. M=E4rz 2018 23:53:50 CET Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> In the case where hard_iface is NULL, the error path may pass a null
> pointer to batadv_hardif_put causing a null pointer dereference error.
> Avoid this by only calling the function if  hard_iface not null.
>=20
> Detected by CoverityScan, CID#1466456 ("Explicit null dereferenced")
>=20
> Fixes: 53dd9a68ba68 ("batman-adv: add multicast flags netlink support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/batman-adv/multicast.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Queued up for David in batadv/net-next as d5863c47d725 [1]

Now I only have to find out why I didn't receive the mail about this=20
from coverity.

Thanks,
	Sven

[1] https://git.open-mesh.org/linux-merge.git/commit/d5863c47d7255448ec0171=
3cbdb4f94b370d86ad
--nextPart1524434.qlbeyyzbMd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlq2HA8ACgkQXYcKB8Em
e0a3UhAA1jf+py/wrYYigdPHLlWb8Sbh6grH14VWxKIvqbAoTegxIp6i97/HuoJ/
CHZoOzFzzGm7zpuNDTLIMhn9ltRKiYLdG4gOWqc/zQnwQvegaA9GGxUN6rn2qCo9
B49zyESlAS7AReauoGJVycydYvp7RspbMRamYOd2g6HE0J1N8BquHdyJqIhYUs8c
lXSZ90GCrguSjWIOzJfm2YOqKKDNRLxqOLEuO+UsqjEN9T/ZA6wn8pdWcH32aRPt
sG2RuP4p1mEPpsRksxPr4XbNvqfWnQfybuqLf3WCq/4yMbkA9s4O2hRiqKc/wj5o
fcQXd3fobm+5dHHd9uhBqz0Pop30lmrULhwv3zrzysu+yVHekGMlHf9696wsuXAD
ibOhgFOCkFELgDVAkrDZWVM9r2igFYMbc5igmNZx7gzRPWk04IBWAEyi28K/ptrN
AsieFJ13vbfSGcvCK972MUTKrUJSuYhyd67GToMvN3fx/l2gaiwFllh1jMeTIU5B
Xc0zhtOWocBqJaw4UKPJ5OodxBKINmfJ0JJYyrb7LejIWksxBygcxHeGUnJPmrYu
MsOnQDmq5fgeeQz6KUZRxC1dNu3CTetXFWOC2cep7Isl1P3qBmnxwUIVSoXXVNEw
OdIPtMwX1NLwVSz+wVAWRQE0JriUbSR/R/5J8/AdzsdpSjQ9WS4=
=IINO
-----END PGP SIGNATURE-----

--nextPart1524434.qlbeyyzbMd--

