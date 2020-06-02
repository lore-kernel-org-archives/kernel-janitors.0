From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Jun 2020 18:36:44 +0000
Subject: Re: spi: spi-ti-qspi: call pm_runtime_put on pm_runtime_get failure
Message-Id: <20200602183644.GI5684@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="N8NGGaQn1mzfvaPg"
List-Id: <kernel-janitors.vger.kernel.org>
References: <26028f50-3fb8-eb08-3c9f-08ada018bf9e@web.de>
 <20200602094947.GA5684@sirena.org.uk>
 <1c13e0ec-e50f-9eea-5704-052d2d682727@web.de>
 <20200602141306.GH5684@sirena.org.uk>
 <cc8e1397-c605-d73e-363e-9d2ddfb9ae16@web.de>
In-Reply-To: <cc8e1397-c605-d73e-363e-9d2ddfb9ae16@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-spi@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Dinghao Liu <dinghao.liu@zju.edu.cn>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--N8NGGaQn1mzfvaPg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 05:05:18PM +0200, Markus Elfring wrote:
> >> I find this commit message improvable also according to Linux software
> >> development documentation.

> > Causing people to send out new versions of things for tweaks to the
> > commit log consumes time for them and everyone they're sending changes to.

> Improving patches (besides source code adjustments) is an usual software
> development activity, isn't it?

Your updates were not improvements.  The formatting was worse and to my
native speaker eyes the grammar was worse.  With this sort of stylistic
thing it's especially important that any review aligns with the needs
and practices of the subsystem, there is opinion in there and multiple
opinions just makes things harder for submitters.

--N8NGGaQn1mzfvaPg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7WnDsACgkQJNaLcl1U
h9DGkAf+PjSEqHTfl5f2iz9hfmR2SynpiykJ1XkuI/QQI+g5b8po5GEO+Ex48irJ
eZapYj6s73KBN1FcvTkmGNrCqO1sGQwMXvsf0cIQ1gFltQt01hopOWwqGvt1MtDm
nwCi6sU1jOjGzkQ/sgxvvIPIz8YAQ+YD177k4v6XKma565eJGukVTpQZfwWi52Xq
MHT93raV0bDM1nZz2/xe/P1GsKd4iO/+nGbI2qA9ZmueqGzbsqphOlgf1Z/M4em2
qIA7qVs5WkjL01yyBjwoKkZo1Q7XVp20NtZvytXut/iFx0X4XUV2E/ehB/EqAcKt
REEO3WfKi8oLPVWCRSzau202uix/yQ==
=NOcb
-----END PGP SIGNATURE-----

--N8NGGaQn1mzfvaPg--
