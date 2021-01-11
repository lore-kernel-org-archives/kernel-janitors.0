From: Mark Brown <broonie@kernel.org>
Date: Mon, 11 Jan 2021 17:58:12 +0000
Subject: Re: [PATCH][next] ASoC: soc-pcm: Fix uninitialised return value in variable ret
Message-Id: <20210111175812.GK4728@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="yiup30KVCQiHUZFC"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210108123546.19601-1-colin.king@canonical.com>
 <20210111163551.GA33269@sirena.org.uk>
 <9bef4fe5-0eed-03f8-9505-909b669ba49b@canonical.com>
In-Reply-To: <9bef4fe5-0eed-03f8-9505-909b669ba49b@canonical.com>
To: Colin Ian King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, =?utf-8?B?5pyx54G/54G/?= <zhucancan@vivo.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org


--yiup30KVCQiHUZFC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 11, 2021 at 05:37:36PM +0000, Colin Ian King wrote:
> On 11/01/2021 16:35, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> ..both set ret to non-zero, which I believe will throw a subsequent
> warning messagethat's not strictly related.

> my fix was acked by zhucancan@vivo.com, so I'm now confused what is the
> *correct* fix.

Quite probably yours in which case it'll need rebasing - IIRC I looked
at the various patches at fairly separate times and didn't connect them,
my workflow is based on queueing things for automated processing later
so I won't always remember seeing something similar.

--yiup30KVCQiHUZFC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/8kbQACgkQJNaLcl1U
h9DAkwf+M1VbQOU/Iy6orX+mjHXlUnvmVyBAj7mzFuZiwwbG0+Eh3ZdHM1zNcNO4
oLc75RxJJjJu4LVtwB2yNCi/ecE6wpn4RCQphOUqC0JceV7Fmv1g6DbgQm7FAEg6
c51rug8SVBRaNw3MisdINNE6LOAuO7lRTJYzCINoei2Bc5VvhGva4E2mhnXvr7Ht
o6T03efSI+GFHGtXt5UzmzwSJd55bx/I1hmzPSSkIgqLhgMsCiqEAm/ksQrUD7Hl
cIZBh4puCJwHry9XMaqDK1FX8l4eg1Ey6suXcsBBvbsXUJG/C75zFr5rgLb38y0w
yCqLHIaGdltiVwB+kQAZ/MXBZct/Dw==
=6anD
-----END PGP SIGNATURE-----

--yiup30KVCQiHUZFC--
