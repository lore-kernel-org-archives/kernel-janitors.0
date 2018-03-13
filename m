From: Mark Brown <broonie@kernel.org>
Date: Tue, 13 Mar 2018 16:21:38 +0000
Subject: Re: [PATCH][next] ASoC: samsung: remove redundant pointer cpu_dai
Message-Id: <20180313162138.GQ2186@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="3wfpuDtTLg8/Vq6g"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180313133626.31286-1-colin.king@canonical.com>
In-Reply-To: <20180313133626.31286-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>


--3wfpuDtTLg8/Vq6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 13, 2018 at 01:36:26PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The pointer cpu_dai is assigned a value but the pointer is never
> read, hence it is redundant and can be removed.

There's some subsequent patches to that driver which I think provide an
alternative fix for this.

--3wfpuDtTLg8/Vq6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlqn+pEACgkQJNaLcl1U
h9AKUgf5AcxCWJ0oHWoN6eTUV0BBsBklpteqtkqoe3+mF23ic+8fKLqHoXXy54Tf
oUBToMtJm86A5vtdpMiWn5bKoIhz00hlOoB6ifEzo8OVCqGVjfboFIm4jDe86U5M
2dOx+oTvjU1GkX4YmnXQT6ydSmDV2WRDJXooj2+oMw1c4oMpuRU8WasV42bd9EDw
G0lllykMwVDwq8K4OdoArGgsCyenkucFzG0FTig/qHn3fWhFsDDZwh58TxbG64Tn
VteJqoMrwc7biNYV1uTHk0lOz1c/u5lHD/LAr5U9keXNar7Qr72p9ILckZuJNmnM
/OJGur4cMcrVhVyHndO9/GOWPLhNNg==
=0SDV
-----END PGP SIGNATURE-----

--3wfpuDtTLg8/Vq6g--
