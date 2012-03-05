From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 05 Mar 2012 09:52:44 +0000
Subject: Re: [patch v2] edac i5000, i5400: fix pointer math in i5000_get_mc_regs()
Message-Id: <20120305095244.GG1003@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="mXWEJCq0x1D2MX0F"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120302065441.GB24508@elgon.mountain>
 <4F508C16.30900@bfs.de>
 <20120305090109.GM22598@mwanda>
 <4F548B43.6010802@bfs.de>
In-Reply-To: <4F548B43.6010802@bfs.de>
To: walter harms <wharms@bfs.de>
Cc: Eric Wollesen <ericw@xmtp.net>, Doug Thompson <dougthompson@xmission.com>, list-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--mXWEJCq0x1D2MX0F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 05, 2012 at 10:45:39AM +0100, walter harms wrote:
>=20
>=20
> Am 05.03.2012 10:01, schrieb Dan Carpenter:
> > "pvt->ambase" is a u64 datatype.  The intent here is to fill the first
> > half in the first call to pci_read_config_dword() and the other half in
> > the second.  Unfortunately the pointer math is wrong so we set the wrong
> > data.
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: Redid it as with a union as Walter Harms suggested.
> >     Fixed the same bug in i5400_edac.c as well.
> >=20
> > I don't have this hardware, so please review carefully.
> >=20
> > diff --git a/drivers/edac/i5400_edac.c b/drivers/edac/i5400_edac.c
> > index 74d6ec34..083e80a 100644
> > --- a/drivers/edac/i5400_edac.c
> > +++ b/drivers/edac/i5400_edac.c
> > @@ -343,7 +343,13 @@ struct i5400_pvt {
> >  	struct pci_dev *branch_1;		/* 22.0 */
> > =20
> >  	u16 tolm;				/* top of low memory */
> > -	u64 ambase;				/* AMB BAR */
> > +	union {
> > +		u64 ambase;				/* AMB BAR */
> > +		struct {
> > +			u32 ambase_bottom;
> > +			u32 ambase_top;
> > +		} u;
> > +	};
> > =20
>=20
> would this work with alignment=3D8 ?

Are you asking or telling?

I guess I'll add a __packed and resend in case it's an issue.

regards,
dan carpenter


--mXWEJCq0x1D2MX0F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPVIzrAAoJEOnZkXI/YHqRarwQAIRwMzHZ1YOgQUGUhRqktgJT
hXeyL3lDCSioYJIfJf3YSO98th7KfXxPuZBKPRbROgP5I2KbrJjKM+4JkI8kfMaT
XsRYDzVDh+icx7IkNub6mFBvUAo4yy2BwgNROQn2jzJ2bMhdXqO0XGBpePmlGf89
gtaGowAGYRyDrZJcsbNCi9vsi8awHB/adrEgsy50xPjXWhTYk3Lyg3bG7lRdRUux
LKMDeQKiaQXhhRD42raFDaPRrF/Lb5/Ktbo51vP2ZnwxLsaKYcoFO0Apbk8VIMT6
66YxzW8xBXxEK7KuLSW6d5NzpepogvBwreUpTOBAU8boFv9o6fJb7MWFa37JvlyE
DPAS3OhZmnKLxopqj8hnZtwE5vFc0pcsfjqAyziYvd5cBRQw1jhftE4J+623FtsN
mGxxtlXH1pAJwAG5tUaVjl8AszIEQYOhpw7KOcXEBgeGMauyoe+cwyGIZJcOscrP
bx+8RDCJA9MOcGMFJFVcsFi1qcQJcsmUQ8mZ2q8WGk04mmzkm12XKQQEwrPu49ck
t6Sh/Oh/URdKRxtxkpaRrXPitMwnTdecI0Xw3JE/MQy9SDD+Aygf0h6dMnZsRjd3
wBPVJhCVgLyQGcwxnAPhcRvFtwGd0ICVf0F8Xou84rhBEs7dlgw3IrN9O4SzVP1n
X4XGLGSbIq1JcNaDWnPw
=1Odh
-----END PGP SIGNATURE-----

--mXWEJCq0x1D2MX0F--
