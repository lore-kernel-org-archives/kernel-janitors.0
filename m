From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2013 12:39:53 +0000
Subject: Re: [PATCH 1/2] spi: simplify devm_request_mem_region/devm_ioremap
Message-Id: <20130829123953.GE10783@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="qPhbOctOI3h5o759"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1377364396-27861-1-git-send-email-Julia.Lawall@lip6.fr>
 <1377364396-27861-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1377364396-27861-2-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org


--qPhbOctOI3h5o759
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2013 at 07:13:15PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Convert the composition of devm_request_mem_region and devm_ioremap to a
> single call to devm_ioremap_resource.  The associated call to
> platform_get_resource is also simplified and moved next to the new call to
> devm_ioremap_resource.

Applied, thanks.

--qPhbOctOI3h5o759
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSH0EWAAoJELSic+t+oim9N+4P/AvISWoVBHzyE8GAotu14Omi
Bg0OQdQyL6LVw/CMImx84+Dw2JRiAaLKj0fTAqwonHlV/gaXjwMVmLXYSdxwV7T+
2Lmj6OQS9DVRXHLcwhmAW7sT0vxfZMgikuGxuRsBw8J5+/CGveuCtqeNC5010lkY
kNYFag6yGsWB/AIhrdU+hsh2maX/IC5b6HfMe8pIzVcizFNbWYe12FfIv5/kwT7y
qeMjW6kopw1XblR/U+Fj+iLLSoCFBvMPdawiIynBobRWadwCFWOiuphtBCUsmM5l
Wlw5XxOfhm167cQnMz4/7SypXVyhifamq3t3gEqzJT8bhwlVnEM3M2Gx8hmOb+Fk
r0g8rEZwrEVE60rcAUapgt8/d5uSSygBBfc9Au+Ep1wDDhaFgdaWSBSCxouPTJ7p
qAg4KC7cMuDMFzBt0Q5KSGI4XHr2VXxlM9HMuVtW1Yo1IdjD5Q1oStlIwWcH5b0a
OJapBkMtEdxl6lYfornl+ia7ENshw9e3IvvrB4u6h7vWD9MOJDiDVLKU5ODtubjw
4Ho043YLYUUEqBL2SaRrxWoSsAjT8DiET0l7EkcoVVVUAL7DRe2gMGnQ32KOR3F4
1A9eu0pcuKNkVeffCas7weaHjGZDIypCIH7cwvy4YJIMYGT11dl29sbInJOKG4U5
stPvttqnpnz1Go+bYZ61
=b6ou
-----END PGP SIGNATURE-----

--qPhbOctOI3h5o759--
