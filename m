From: Mark Brown <broonie@kernel.org>
Date: Wed, 31 Jul 2013 16:55:59 +0000
Subject: Re: [PATCH 2/3] spi: spi-ep93xx: Fix format specifier warning
Message-Id: <20130731165559.GA9858@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Fgul90E7reitKI3L"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375205737-3468-2-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1375205737-3468-2-git-send-email-emilgoode@gmail.com>
To: kernel-janitors@vger.kernel.org


--Fgul90E7reitKI3L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2013 at 07:35:36PM +0200, Emil Goode wrote:
> This patch fixes the following sparse warning by changing the
> the format specifier for size_t to %zu.

Applied, thanks.

--Fgul90E7reitKI3L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR+UGcAAoJELSic+t+oim95/IP/1nORFK73iDyvjxY7BNkLMi1
3XsAoo30yA0gJ5T/mtqro08A0NoNnNmYcgS/Jrx50yXfigXOYo1bWBtopSzBlOzm
3oVW3+okhR9UoLAelTFugYFNSafjPLzZDcQ45dOsXCYGWQ8dEl7u+VTqXSmmHARL
fKOeE5ugkD6b3/crNdko5ic5a8p4sOKUMSjPuqeXITkym+TnffHszLOlBR1Qu3eQ
JiIFQlWa3HjMYDwBaMTRdXCCMa5zi3QP1cl2ywAk8DyD92lsm06RKMum6pQJ2VMR
PQ9T7WOIiqhYa5YkJ6eiPdfTXRDjsQBnlZYtLjY2D5Cm6awBOzD3ZD+Zv0NggeZH
qT0c/bzZTwQp1R/lyJMTA0luCevTMWkaqUTw/7DJsDX+uDWGIqZNtHWlKsZvRZDD
mfo3sX1kiT/OohE6HQNoU64rPlKPndlLzHcoqKRzCFm1OXpD1TWJ/W/z0tvqT94E
uBkcz54UEn+23GJkabPLdgwneHwrllC0if4yJ2C/oNV03hYi2rNNKM/t1laPfB5m
htN0vjuRZwT3hzq5XttsH2ewrpuG2E2lDX6WNg9pJuDoGawTkJrPzCjcmM6dOGUS
YH0f+Sf4SqS/x+SdfuD1s4gZuAcmSLyMo+Tti92ECpvDERN+4eZPGza4j8kBvjBR
0DxPp3/Ph3zPQLB6fpxL
=fHV5
-----END PGP SIGNATURE-----

--Fgul90E7reitKI3L--
