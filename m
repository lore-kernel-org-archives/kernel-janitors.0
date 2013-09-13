From: Mark Brown <broonie@kernel.org>
Date: Fri, 13 Sep 2013 17:33:49 +0000
Subject: Re: [patch] ASoC: max98095: a couple array underflows
Message-Id: <20130913173349.GR29403@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="cmVmsgMleI6OTR11"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130913075214.GB19211@elgon.mountain>
In-Reply-To: <20130913075214.GB19211@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Bill Pemberton <wfp5p@virginia.edu>


--cmVmsgMleI6OTR11
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 13, 2013 at 10:52:14AM +0300, Dan Carpenter wrote:
> The ->put() function are called from snd_ctl_elem_write() with user
> supplied data.  The limit checks here could underflow leading to a
> crash.

Applied, thanks.

--cmVmsgMleI6OTR11
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSM0x6AAoJELSic+t+oim9mcMP/0ZplkenCFSVAlld0A0FRryZ
996U/nuBK3Z2PsGg9hb5PVctptcgpu9lgP69pOXx/nnb4Pdzew5IBa6GU4Ru/JS8
S5gEMn3XiJrBI8HKTrNZh6wFUFE3JuOrG6JAQGlayp6iYOZA6e3iKtOCEHWVu+9y
Ry1A7aPgX/D2PD7VzhEl3SNSkTZr+Y0/XfiARmfSxwpdGdapRTVCZzcJMztU1KZZ
nb8Q3eAgkoZpS5vvFk8+0rKSbwqeGShZAQ83bLPxIy/hNdq5j9j4SxhBPXhYBZrX
MK3c+2DNOIqYXXo9DZzeLk8DQOHL6yvPn+Io8zOgkatBT/jzpqzZyTwKz1qpKpoT
AMrac8sTcu4YsZ6eIuSCm4LiTPAlXq+tchb0hFXchUkbdrspZrkmOnCX20u2IceH
kIJS2JYt3XBcQ4LIY6WhtEUUxKoWW988YYpdiNEKBx8JsgXGNPkLbPgIMNCBHyTj
Tp4yAp4OIDGRCrNGbLlGFZV2AoBvOQoXKDU1Byby3brzaR2s+GMJi4O/6h1ityES
+en/0L3s9AicTZGSuQBRJDT6wA3S1kMQo+UjJqD6LwDFudyiE7R8kQD2aOEYq7d7
9pakNlz1xHPpf70yLSMDbi3UYurh5fJD2Z+MsbL5/7pBnCo95VVOryVWWKH102g8
W/Lqs79mDoIyWmHjWEjH
=RA+t
-----END PGP SIGNATURE-----

--cmVmsgMleI6OTR11--
