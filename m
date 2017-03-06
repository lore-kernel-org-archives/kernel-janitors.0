From: Mark Brown <broonie@kernel.org>
Date: Mon, 06 Mar 2017 10:30:14 +0000
Subject: Re: [PATCH 02/10] Updated max98927_reg table with physical defaults. Replaced max98927.h for better 
Message-Id: <20170306103014.c3alwel45g7gn7su@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="pjsgxa3cd2mhwtj2"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1488552768-14901-1-git-send-email-ryans.lee@maximintegrated.com>
 <1488552768-14901-3-git-send-email-ryans.lee@maximintegrated.com>
In-Reply-To: <1488552768-14901-3-git-send-email-ryans.lee@maximintegrated.com>
To: Ryan Lee <ryans.lee@maximintegrated.com>
Cc: mark.rutland@arm.com, oder_chiou@realtek.com, Damien.Horsley@imgtec.com, michael@amarulasolutions.com, kuninori.morimoto.gx@renesas.com, arnd@arndb.de, yesanishhere@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, tiwai@suse.com, nh6z@nh6z.net, lgirdwood@gmail.com, petr@barix.com, alsa-devel@alsa-project.org, jacob@teenage.engineering, robh+dt@kernel.org, bardliao@realtek.com, lars@metafoo.de, devicetree@vger.kernel.org


--pjsgxa3cd2mhwtj2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 03, 2017 at 11:52:40PM +0900, Ryan Lee wrote:
> Signed-off-by: Ryan Lee <ryans.lee@maximintegrated.com>
> ---
> Some register values in 'max98927_reg_map' table was not physical default.
> Random mix of strangely formatted #defines and numbers was fixed.
> Reclassified register definition in 'max98927.h' for better legibility. Unused definition has been removed, too.

Please place the changelog before the ---, as covered in
SubmttingPatches the changelog after the --- is for inter-version
changelogs and other administrative things that shouldn't end up in the
git history.

--pjsgxa3cd2mhwtj2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAli9OjUACgkQJNaLcl1U
h9DVSwf9Ffp1857WRWAnYyqlG1Gjo0sFTifzUTTI0VG91fTF+WbwBEUIvL2p0HSL
WPqWcwOBIPtOG4RtWZ6BwYcY+FAhB2VkZvlfSRGl+ELp8H0UaZCXU4x6PDHoJFWA
oEmTHbkSLqAm7EccHl3LfohnHifSIHuPras2aq16h1RWuEP11UKwREwElyd5JRY4
VUuZve7o+6J+K3UJQIV3kSfmL5qoaAzBkJxJ9llhoyjLBPb2bGDZNRHT8FTAFHWr
98YlotHGVmZArWwtLN4Bp7ScBl6dC68weji3Lgww25taz0fG4TTASwawqyQI0P6i
aYuT0q4ocCehtnghX7St87h5NmaR4A==
=nsY+
-----END PGP SIGNATURE-----

--pjsgxa3cd2mhwtj2--
