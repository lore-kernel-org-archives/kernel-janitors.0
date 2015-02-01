From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sun, 01 Feb 2015 10:26:33 +0000
Subject: Re: [patch] dmaengine: s3c24xx: missing unlock on an error path
Message-Id: <20150201102633.GA4827@lukather>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="yrj/dFKFPuw6o+aM"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150130082933.GC21357@mwanda>
In-Reply-To: <20150130082933.GC21357@mwanda>
To: kernel-janitors@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2015 at 11:29:33AM +0300, Dan Carpenter wrote:
> We should unlock here before returning -EINVAL.
>=20
> Fixes: 39ad46009654 ('dmaengine: s3c24xx: Split device_control')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUzf9ZAAoJEBx+YmzsjxAg8P4QAJzCmbEDySYBTyRB96JWYzzk
0AqJPNAe5m9WFfPhdQBwoC/pslBGS8C5kvt7PcsAFCXSVP0uUH2XU3SGVsnKPwvg
kTogYZpXZ9kvRAWmYlQt3AnAVFi06i3AKa3ltyCctY5H2ArvWi0lDmj6hFXizpDO
xwrnGJk6QXaLF7r86XJt6Jlcv8Wlwk2gCvOWzNHPV4j1eaFTIl/9TMINfVrSpqUV
/x6+fFZaWDgCI5gbOLojVz3UPWcXMWuYKkvuHwORw680zMJrFtJ+20WUfiy3xlfk
DJ+pJrzjJ5+PPtD+eYYnMOqp1lJ+szIVQ69BnxlLjBh6xPbg+iyQihv7IntZu137
rnrMwOCi+dBtPZ+PDdTJ2hACn06Ivxw/MmDleto7VOc2JQIYK3qYJBTeJvwqYOX1
X4EV97dnxWN6Ns8tjw7Cl9LcrNd+AiI/o/2FqSUGUxySjoURmJn0JH+nXpNsKW4F
8V7ocfNG9JdKeWNTW+b5tvjZnQTURkLgeHEGI964DaO1tNZrXlEedcvmgf6+KOyD
HQ5949dDxAEkNpRZ5TzyVhr0FPR2RgRm15DQt9n21aqaN3ldlI2ylWLqyztaf4Av
/biYIoAzANnNI+3pDFI/zWPaeoQGcI0tiY8MG4nnGikhNn7weVoqTLYCW/EYvsAH
RVluDg9Kb9DPVCH57hQz
=RvNE
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
