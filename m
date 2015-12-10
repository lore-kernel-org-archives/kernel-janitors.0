From: Felipe Balbi <balbi@ti.com>
Date: Thu, 10 Dec 2015 16:52:27 +0000
Subject: Re: [patch] usb: gadget: f_tcm: memory leak on error in tcm_alloc_inst()
Message-Id: <87h9jqjlf8.fsf@saruman.tx.rr.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151209102301.GC3173@mwanda>
In-Reply-To: <20151209102301.GC3173@mwanda>
To: kernel-janitors@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Dan Carpenter <dan.carpenter@oracle.com> writes:
> We need to kfree(opts) on error.  Also it's nicer to allocate opts
> before taking the lock.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

what's the base for this commit ? I don't have f_tcm.c anywhere.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWaa3MAAoJEIaOsuA1yqRE9LEP/Ay4zvMW5E+xYd5gKQOSEdJf
73zaI9L5/mYamULUInpN32Z6A3WdG/6NAbusVWaPgCsDAPjyP6LTOBdl2ec9o3Gr
LWjkASZXF2+CLVL9XbI7pLkIvUFObxyooMfA9JwetEZ+Ezs24PZUqyvDQWlc/bJz
L2Ic6unLeEYpI5mjRP7kFPXq3ILaZ7YaSHnrlLjSMg3mkwR8qc2YQKKYrOdoLUTJ
FDaM+H0eb6rdiQSkrvkKPXrhUodHp3hasTT4ccGb9SLv+LMccOqfcC/VonmiUar7
l/I8hwfwELVlwusFIln5aN8nxowBfIx49imvp4H9vevlKOsXfi7sIzMep7iQOrte
yQHMmzKnrihPmjWKx/eMu9q891uxfGahp0mskx2Jkc94cXv4ENxxYnEK6Soonjiz
4PoDFFTUH9G8aa41ovIOjgYA4bA+jDfnHiWMVTPM2bX/f9opW8vGPSRZf/yDlihI
x3YCfXot8WgpJIVi/a9O4mmHQM/h1FyljzPWJ9ecQRqvypuARNA/M6p9RCUF//kW
zkmy7pJQ0NogqPhZVztnUFIh5Bz7NDsCznLwWQ8nXEO+S562Rvz2q+9Uy3J978fF
G3Xy75+X3k4CiUGfdvsKU9nfEVSOzQbEHh4mhtmlA/pJZGYFnuAyF+XzLBHGFTuh
IR7DapM7huPxeuca0tpf
=nOb+
-----END PGP SIGNATURE-----
--=-=-=--
