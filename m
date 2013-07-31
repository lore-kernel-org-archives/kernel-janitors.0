From: Mark Brown <broonie@kernel.org>
Date: Wed, 31 Jul 2013 16:55:17 +0000
Subject: Re: [PATCH 1/3] spi/spi-atmel: Fix format specifier warnings
Message-Id: <20130731165517.GZ9858@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="NT2CJfITL9DNl1KF"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375205737-3468-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1375205737-3468-1-git-send-email-emilgoode@gmail.com>
To: kernel-janitors@vger.kernel.org


--NT2CJfITL9DNl1KF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2013 at 07:35:35PM +0200, Emil Goode wrote:
> This patch fixes the following sparse warnings.
> dma_addr_t can be either u32 or u64 so we should cast to the
> largest type and use the format specifier %llx.

Applied, thanks.

--NT2CJfITL9DNl1KF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR+UFyAAoJELSic+t+oim9SNgP/jxLhbKqwZsDSAERbrbtz2jA
ImUkunv+D9h1vMKsyK5/VEFy6Xy3oi3A6ZJk/Tym0vVouMyxm2iI2OFhkKujr1NE
YhnRea/294en5nPRrIji+mLvDJstJjxCkgN5QVETUuXkJCoRIU1JGtL5st9CXi6E
WlzhM+OEduKGo6EdfeXVgfCbmo0XOHpCys+Rua+/QmDRhG5ycFeyOl646S2KtMjR
wWBTVqvNsvrJv1BaS5eNk2niPgUT1UFJNPSGEXvuRN3zmJmVrU2QFTq1J08fv9fW
1LOQEj/9DqdJGAtjdCnJZUSumwfuH1uHQS5m+VPcfwJLO7O/wE8GQpTqcijslaZq
CrypiQlWa4JHmOEIzd/uB5eXrCKOtQBAGtQDQIBp6BMeRTIpvVE/H3UHLs6DuSCm
L1Gw9RoQzD1CyKizA3JfXv90SzGV3NM+ebMJ4zk/yeSQPNfoTXukGjvmaLsgY+fI
wsG5OhrCkiteV3UWpubPNRm4c/Ke5hkZhUgyk1+EkKQ4G151TPtyutPmbE6d7J5X
boCpsvIY3uSsO3MiZJZBjEf4GL6uHubGnFDvXBzxBN9bDJEEwyiplwoP8MTTju82
IsDUUwMz5rkAoRpLCBNXmnbZahluA48f1sizKdq4nhvmdhBJ1TcYH0sjF6F6Ylqp
FDgHp+0ILp0/FVYWwZuL
=5/ug
-----END PGP SIGNATURE-----

--NT2CJfITL9DNl1KF--
