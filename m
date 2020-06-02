From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Jun 2020 14:13:06 +0000
Subject: Re: [PATCH] spi: spi-ti-qspi: call pm_runtime_put on pm_runtime_get failure
Message-Id: <20200602141306.GH5684@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ik0NlRzMGhMnxrMX"
List-Id: <kernel-janitors.vger.kernel.org>
References: <26028f50-3fb8-eb08-3c9f-08ada018bf9e@web.de>
 <20200602094947.GA5684@sirena.org.uk>
 <1c13e0ec-e50f-9eea-5704-052d2d682727@web.de>
In-Reply-To: <1c13e0ec-e50f-9eea-5704-052d2d682727@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-spi@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Dinghao Liu <dinghao.liu@zju.edu.cn>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--ik0NlRzMGhMnxrMX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 12:02:11PM +0200, Markus Elfring wrote:

> > The original changelog is perfectly fine, please stop sending these.

> I find this commit message improvable also according to Linux software
> development documentation.

Causing people to send out new versions of things for tweaks to the
commit log consumes time for them and everyone they're sending changes
to.  Pushing people to make trivial rewordings of their commit logs to
match your particular taste is not a good use of people's time.

--ik0NlRzMGhMnxrMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7WXnIACgkQJNaLcl1U
h9BIPAf/Qg3X33LluXMNn6+or5b8wx23/eNT76IKOCDLt2nsBUFeX0RTB14vx2Ij
wQwNT/+zdryOjbNaDuuxsRM0DV4SawkJVlaUJ81/HDGRTzyD7LbZwDy7GMSrkhW/
suZlkonuFDGJ07yuMaYGcGykfALQc8/37nX5+WSOX682mHkqnpzIy1uZL231RcLg
hhccjsA7NflG4vQzHy6cdAnoRTVdXtp9EZ50jXdrQjS6BaAtJniAn9B6j7ifz8s/
f3j0pUuLHqkXXY+yP5B8I0QWoTUkFSd/f+LL8PdwG5qfp17iswdqZoutqVwwzsOw
aQeBit3pr2gLrZOVf6/Ehu7Je1Jnqw==
=e8Ou
-----END PGP SIGNATURE-----

--ik0NlRzMGhMnxrMX--
