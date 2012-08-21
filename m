From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Tue, 21 Aug 2012 14:49:23 +0000
Subject: Re: [PATCH] ASoC: Remove unused variable
Message-Id: <20120821144923.GQ7995@opensource.wolfsonmicro.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="i13qRg9tmWEwo36p"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345560719-2704-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1345560719-2704-1-git-send-email-emilgoode@gmail.com>
To: Emil Goode <emilgoode@gmail.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, lrg@ti.com


--i13qRg9tmWEwo36p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2012 at 04:51:59PM +0200, Emil Goode wrote:
> This patch removes a unused struct snd_soc_dai.
>=20
> Sparse is warning:
> sound/soc/soc-compress.c:156:22: warning:
> 	unused variable =E2=80=98codec_dai=E2=80=99 [-Wunused-variable]

Already fixed by someone else.

--i13qRg9tmWEwo36p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQM5/gAAoJEFJkBDiqVpZ47/wP/1IKjmm6OwzgKKBMa0autnkR
9fvM3YpDvjCe8/7aChpCv1DLciCrZSuLV38/D4za27br9sXT+J/RW/i9Heq8XfY7
tjF3Yfe+RBI+MmOOUkT4EYrewJ5iRlRNPRz84BcUMTklWaG3KRjrykhf2Vd28l+k
RZL5bGxD4y9j2Yzfr8JqShTGMWpClMjYBgQoO+Nu9+v+uWyQk5qf+4nlbc6etmRO
H0Ri9xELwWkXQFflNQFVAxeZrdwf2CEwA7nlhtqLprO+a0KlsEIq7wKaqHu8WJCB
FD2y5r4/OmDSmnVmoIc7p3V2hiRbrY0HGl/rCFFWkIadGbxwr639STqT2FXJ5bMH
4jGC183ZpMVzRnOQFJ17dsL3r0c6Hm9WOXg+XfZAovrARgH0i5ETZJKf7bv3YRp1
k4kMsRU/pMgPHYfvx3o/X+9Uw/jn+ZBo5aV6fg+/TKCiHK7gWaNu9Z5VEWjK1tA3
BE6jNpnuDbdpli+FL+shpM57FTXSTWToK4ZcxBt7ZBBAJ1gnfv+MFG5hhzTAtRIP
dy4b/dW+sldn6bTUn77wUWxlHy5PGeFSf6SPMJCeDcgrCJK9zQ2eXWRbVUbGaOfe
+s5UACoAEJRzp9oTCn7dCMrMcvUo3P/r4paQUFskrgumnLWvzNz1YGtBOWYJbIB2
p4YW7EUxlHQBIpXz7okC
=YkTp
-----END PGP SIGNATURE-----

--i13qRg9tmWEwo36p--
