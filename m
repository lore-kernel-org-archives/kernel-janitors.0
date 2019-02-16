From: Eric Anholt <eric@anholt.net>
Date: Sat, 16 Feb 2019 00:53:18 +0000
Subject: Re: [PATCH -next] drm: Remove set but not used variable 'gem'
Message-Id: <87sgwowo3l.fsf@anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190215033507.103232-1-yuehaibing@huawei.com>
In-Reply-To: <20190215033507.103232-1-yuehaibing@huawei.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

--=-=-=
Content-Type: text/plain

YueHaibing <yuehaibing@huawei.com> writes:

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/vc4/vc4_txp.c: In function 'vc4_txp_connector_atomic_check':
> drivers/gpu/drm/vc4/vc4_txp.c:252:29: warning:
>  variable 'gem' set but not used [-Wunused-but-set-variable]
>   struct drm_gem_cma_object *gem;
>                              ^
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Pushed to drm-misc-next. Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlxnXv4ACgkQtdYpNtH8
nugKehAAjTju4cJ6fEKTf7p7P9vo0gKzTV8/A69CykEWmN3N8vBf6wGefP3BmlZw
vFafNsFqv3Wrpa6EHfwxGiCOhpVaioNWhW/oTpzUvZvuAV6K59MwMxU+faAfOWXl
0+n8HLmfrLlzdbcCPDl9JpFtUJA/mpLn4sDyTCvTCpLzk3G9yrqA0hArGrZ7lvHe
s6/C9ViytSHpiGoGielkiC/r6WEqV3GO2RcK1ozOngCMrXiKdIYSySCYwXEYNUwz
tnTIGURkQuw5DnN+N7qj0HvMDvku/3qS7LTXHaBOr6Bqd7qwCD3zlxRn+sFnbnZZ
EfM6mdB9JyhEgMzpyRzECAH1bDyVSvD2oKgoOIcRQhEayB+zgK41SsOgYYOwRR65
7obqVZcR1h3YME6GW1HVeoQiviSO9DT/5sfLAVz4sZF+b+uIy5AKd27c2KvxcniB
oWYr6NCfvETyxt0FpefeNQiabRMEbhtu+Mk6uSfhN1z7hvUuSIRPnHxquIYT2pbW
fwHu94qcH6Q/UmAmT+rLvI01/ChyXCijS1xEcq6IVKqDpavzIlhQYCUY/ImsA/rc
Q2q6yH58d7x4wVndMv0iwmMWXSjLs16RGqO4W19eOr6RCH/PfOZFgVmaaFDVDPm1
t8fMHaegXMUBb6Jrou33PxvAvdliSZDJWK4oCZochUGbLidfnMw=
=Ydk4
-----END PGP SIGNATURE-----
--=-=-=--
