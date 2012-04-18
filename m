From: Felipe Balbi <balbi@ti.com>
Date: Wed, 18 Apr 2012 13:21:31 +0000
Subject: Re: [patch] usb: gadget: add a sparse endian notation
Message-Id: <20120418132130.GV13842@arwen.pp.htv.fi>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Mwz/dta3oUwEdwoz"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120417063022.GC26756@elgon.mountain>
In-Reply-To: <20120417063022.GC26756@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--Mwz/dta3oUwEdwoz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 17, 2012 at 09:30:22AM +0300, Dan Carpenter wrote:
> The original code works fine, but Sparse complains because it isn't
> annotated properly.
>=20
> drivers/usb/gadget/composite.c:793:26: warning: incorrect type in assignm=
ent (different base types)
> drivers/usb/gadget/composite.c:793:26:    expected unsigned short [unsign=
ed] [usertype] language
> devel/drivers/usb/gadget/composite.c:793:26:    got restricted __le16 [us=
ertype] <noident>
> devel/drivers/usb/gadget/composite.c:795:29: warning: restricted __le16 d=
egrades to integer
> drivers/usb/gadget/composite.c:798:24: warning: incorrect type in assignm=
ent (different base types)
> drivers/usb/gadget/composite.c:798:24:    expected restricted __le16 [use=
rtype] <noident>
> devel/drivers/usb/gadget/composite.c:798:24:    got unsigned short [unsig=
ned] [usertype] language
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

applied, thanks.

--=20
balbi

--Mwz/dta3oUwEdwoz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPjr/aAAoJEIaOsuA1yqREGNcQAI3om99p3t1SW9WNdLvHHXBi
tJcKzVj43HOVarq/njVXULzaRKRX9nAc0uULK7yrQyH2Ap7fjFl3QuGJqScAjeOI
DSRwUto2Gm4MoyrK58D8byj79KmBHgXmTv/n4SrBDXwmb2JGQlwXJUExd8EJuwLN
RZpMaQ9e1ucEzpuLUfE6Yyo6iyjIyc5VitYOvomvKLqmSgxrUFH/LBo41N8gOUJz
sUVLMhtgSyJaWFuFTSp2r04/ShW0ty4IFOvfmTqU8U7Mk8h4nH4bf4183mxaBUyi
KZ7bWyhd2y55d0WMf3xT1usAAUp/BhXR2ZoHmjMXsjr5MUuWhomyViN1RL8+Y08P
ZMrmCOUKRcC+C2FAM0Ra1ergo2uiw63DLE2pU2iHcbCS/ORHgB4L9pVjfGrXGnjU
AQ5ZN0MLPHbvtuqpfIukw6QjD1AuQnrRHtPn5S5rCw0UNJ2ZL0UmHzNGPOU5q6M3
MspzjvFQRZGB6UYntNSZG/mau1wtBFR++lmHCzb0hD09FU1Rd717dg1I0Jw0iBj+
cOCIjYQwVEWuz7y/ep7cq8SJFzeRk75GOazc2XUoKa3QJe7V0vXgbfTiP3WkFErj
nHJskU+LvwaLpRk/2hbpJMENwpnGxSu7BcDMgKP91QB6VTpy9YrnEBWhUoETfy1K
TOJKqDY0IBmUgoMrv/4C
=KXt/
-----END PGP SIGNATURE-----

--Mwz/dta3oUwEdwoz--
