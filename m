From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Thu, 07 Jun 2012 22:59:38 +0000
Subject: Re: [patch] ASoC: isabelle: using an uninitialized variable
Message-Id: <20120607225937.GH14525@opensource.wolfsonmicro.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ZPDwMsyfds7q4mrK"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120607123837.GA7171@elgon.mountain>
In-Reply-To: <20120607123837.GA7171@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Vishwas A Deshpande <vishwas.a.deshpande@ti.com>, M R Swami Reddy <mr.swami.reddy@ti.com>, Liam Girdwood <lrg@ti.com>


--ZPDwMsyfds7q4mrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 07, 2012 at 03:38:37PM +0300, Dan Carpenter wrote:
> We should set "isabelle_regmap" before using it.  GCC complains.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

--ZPDwMsyfds7q4mrK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP0TJNAAoJEBus8iNuMP3dsqsQAIPs+uMT770+Glu7qhIHmWbb
uCu/vg4XOW8n5hK8RFvQhs2u4EioHswKv8JHP4PyGHgpZ0/NrEARdoytv5fKhIME
B2hcHzPfhv3zX1F6hD48lbdRMKM4aaHd2x5YrvBOnhYWGYp/pmNynuog5tvPP9jz
mCk+BdnkTa4N8hMGmx2LaQMhxPFfHQDUVGWY8rd8z9yeKLhKarMGtJ6j43mzuQD0
/MEG4/DbvqnJTyCf9vudYXMnxBChUCI4SFDtk80/FwmFgR6bpy95ijY1s7UeR8Vx
ni6Dq9iyrV+xOSBnju6u1w7wiko7pdUEXQGNGy0l69pmAPjCkVrrfChGgYEaTpgz
aVcFwB+kEZMUS+PkZigVvFgrAYyeckyikI7z6opAG9hsynB9i5zPwL87ZsXgdcIU
77B4sa0EgBjbto3bE8PeKR2w8OzK6bzGSxrHU1n4FA7uslm869Bh8cDfESYDLJJ5
cMO+8AId1/t/mPJG3J0/Fm4Y0PZYBxlP/yUmf6KKeFuVU/jiFISB9Jy5m2Yu8Ca6
iwQuEPzNMJQpR58aADiPmwychEltAzJZQCH+pnvY6D0ytr9Hf+6TFP33aP6Uqvg0
nOn7l2ray41vmICIVU0R3GRmk0HPI5VwMe11Hp0JE3svWqTIAPcMk/NnFWpF272Q
btvRSMzFA0qUFH3L2wot
=dd5j
-----END PGP SIGNATURE-----

--ZPDwMsyfds7q4mrK--
