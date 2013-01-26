From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Sat, 26 Jan 2013 07:37:44 +0000
Subject: Re: [patch] ASoC: dwc: fix support for more than two channels
Message-Id: <20130126073742.GQ10580@opensource.wolfsonmicro.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="uQ3BaAlxDi9XKvis"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130125064343.GE4882@elgon.mountain>
In-Reply-To: <20130125064343.GE4882@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Rajeev Kumar <rajeev-dlh.kumar@st.com>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>


--uQ3BaAlxDi9XKvis
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 25, 2013 at 09:43:43AM +0300, Dan Carpenter wrote:
> There were missing break statements so everything used
> TWO_CHANNEL_SUPPORT.

Applied, thanks.

--uQ3BaAlxDi9XKvis
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRA4e8AAoJELSic+t+oim9oBsP/jYhh6epLBqtd1klK62Twcee
tvKiYPSUFtCx7OrNP9ceMYvPqrxPSjfVmuc3DzEcMAA3STtNhzJsU11TOEIaD2P/
9BG7DlAGDKsFp0+7uG6nTGsC8Cx+yNd/CjJHtKEPnAV54Aid853N+5r3SxAe7p1u
WVcAE3T0M4Ncla+UU5vz2NIz3sm1lhvmRU6swvNn3fqBGE4bGQtRIFLgSRtOKl4q
t2NNNekUJ9TZTHiDUi0wFnC9Z/UMnCjgnWVb7PaXVsbjCCIp2C2quJtomTe1civL
8sDcdCusYAwgC3DbGeuRIhhjNHskvocOLxhPRlL0IT9w7RaszoxYMs+kQmtAuRzB
nAYQ7dx3hFKzKw2rXBM0pxmqg9G7UC/qIkza0r8ySNmTroKFxeO0UHjQqXnBiALJ
mWC9mf1mIGb4dNG96re4oWhPejVwLaEGon52/uGKcC0KJkHJD67g7ODtqzsONhwR
ky82Vtl/DSwz7z8rbIzNtvBtI4ldLY5Tc5loTQTwjPr3DDAc7iMQL/BZocVTMasL
izmRuYANWStY2dy4Y1WdpLxGGkziKLxwq+wA3pdeasKWCJpZKm4Tm0i8QEzwhgOn
Zmgh4xW11PgNa5AYM7HmnonIiDtJCFYo0n6o+qcoctc4aicorFXKBis5wqlZKXPJ
irElBisBzQ/oJp0hIuJ8
=xKas
-----END PGP SIGNATURE-----

--uQ3BaAlxDi9XKvis--
