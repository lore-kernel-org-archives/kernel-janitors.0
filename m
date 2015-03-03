From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Mar 2015 14:25:24 +0000
Subject: Re: [PATCH] ASoC: simple-card: Add a NULL pointer check in asoc_simple_card_dai_link_of
Message-Id: <20150303142524.GV21293@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="pqrHuw837mIruWQK"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150303132900.GA22246@vishal>
In-Reply-To: <20150303132900.GA22246@vishal>
To: Vishal Thanki <vishalthanki@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, lgirdwood@gmail.com


--pqrHuw837mIruWQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 03, 2015 at 06:59:00PM +0530, Vishal Thanki wrote:
> Make sure devm_kzalloc() succeeds.

Applied, thanks.

--pqrHuw837mIruWQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU9cRUAAoJECTWi3JdVIfQ8DgIAINIxTvlScvsXoh4fBTq+T0K
M1exlFgBuaGfTyCiFsMjPuZMQHRnh5qcQuDZmjPVJHKF5T3Va8xz2NbAsN2utvWN
PuizRrSs3zp/P7BuZruQhgWpcqbnEOd2xG2v8XonXCLKM7/TbsCb+wFQZuvVNMIr
CJV12zT1plQMyzOWDqRGze+ma8LDqbCd0iR6sRszIwpd7k5o+j1XQqdZbx2yTTXX
OJKKEKa8w4SAFMDPEHXMPeXxhAyLcO/Jhr5ZUmWYPx6YhhI5qR9GqVGDGvz0ajOK
cRRL3xec+kIPrhQ3cnUsBrXwW6ePt1cVtq0wliGq5oQEp6Pf41Gl5QTcJmEO1js=
=mIHY
-----END PGP SIGNATURE-----

--pqrHuw837mIruWQK--
