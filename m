From: Mark Brown <broonie@kernel.org>
Date: Tue, 30 Oct 2018 16:33:19 +0000
Subject: Re: [alsa-devel] [PATCH] ASoC: stm32: sai: fix invalid use of sizeof in stm32_sai_add_mclk_provider(
Message-Id: <20181030163319.GA6462@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="k+w/mQv8wyuph6w0"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540606799-164510-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1540606799-164510-1-git-send-email-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, kernel-janitors@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 27, 2018 at 02:19:59AM +0000, Wei Yongjun wrote:
> sizeof() when applied to a pointer typed expression gives the
> size of the pointer, not that of the pointed data.

Someone else already sent a fix for this.

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvYh84ACgkQJNaLcl1U
h9D2PAf8CQBR//hQIVawDMD9txVZHFp1FeTXTFRNmYHoG7e7Hukr3a2IEhRCBa4f
eM4kmf1UpVKD8V5kUPDKDllx9SGVxrxEeDPAQmu3detQ8vdWsS1p5+Q8fCvwbTsc
GuBk+IXKzFybzSqiu3tAf3DSPU9p0z+00mo4KmghbrwUAZuKAeu55KC32EEf85Cd
WDPAVGEQ9rUm+YcdNGidf604yjGQy0gB5DuwLpq+t5f41O1NscnLEeusM83if7Qh
fSpFccKSr+CN8yniLocbcRE/B2NUZymGfa7+ZMeqD+eU+G7fCHqQ1yBJH9OhpH/f
Swim64E6tY3M8WOeqe+ZLrLN/De0dw==
=Yi0e
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
