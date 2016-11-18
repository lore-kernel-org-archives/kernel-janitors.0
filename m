From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 18 Nov 2016 13:18:13 +0000
Subject: Re: [patch] pinctrl: sunxi: Testing the wrong variable
Message-Id: <20161118131813.ec4yc4azojx5cv72@lukather>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="aukefk5eaag3qyvq"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161118113557.GA3281@mwanda>
In-Reply-To: <20161118113557.GA3281@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Rob Herring <robh@kernel.org>, Krzysztof Adamski <krzysztof.adamski@tieto.com>, Laxman Dewangan <ldewangan@nvidia.com>, Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org


--aukefk5eaag3qyvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2016 at 02:35:57PM +0300, Dan Carpenter wrote:
> Smatch complains that we dereference "map" before testing it for NULL
> which is true.  We should be testing "*map" instead.  Also on the error
> path, we should free *map and set it to NULL.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--aukefk5eaag3qyvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYLv+RAAoJEBx+YmzsjxAgxDYP/1C8t3kTnnSuh4/pDoZ92O6n
QVZfTadRE7M0u2dGpDnPBBEQ39f2jorJ0trEEkkJdUd3bcAiWaEWJWjJktPenmiX
szdwoSLE9u5h2X4oRAKixugsRu45YTeBMYobQPUI6GoxhG5MW/pvSsR18kMhR2q9
0kIwvG0GWLVhya8Guc1MaaRk+Z4Th2G2S0TUPX+SH2AUovdR3NqlzuljsDxfHwGH
wnwzrCvrNr5HQ3vtEFZSHNia9fJOCJM9cNGE6sBPUgiCQ2CE8bUdvxX1JZaDOQUU
0qsWkXIpU5xmOoS3jY9mYGggChArzMlaNFcV7prM9ibzKZ1rPnrAl3iAkt5shHbk
7djORNEvLYFrsG7AcfloI2r0qfSlkOVS0kc6yi6gvz2IJMSdXx25g1rjuCZPwoy1
Qm5TyazcODB4wvX1HzV9E/cFoG1pr2S/80DbHJWmP4daeQHnNQ/PfwiCItiA09Bc
1Si12SV1jG4davln3XRHnG0OcVpTvqkNfP0+lFvZkcCbHKhSTYahCvqxUJYGlJwD
z6vzmsqtSge4dBcVhq4RQ3HgTDio7UljO8QBds3zehtj0XWDLzHrSk7tQmfKPzdE
tGIl5W/MpeoZfsbzGhBnwnKICAI2wkf422708YKVTUovMXO30ilC0Z4ErTg2lRZ2
rapoJqIM9hqzjr5bE4tH
=YhV+
-----END PGP SIGNATURE-----

--aukefk5eaag3qyvq--
