From: Doug Ledford <dledford@redhat.com>
Date: Mon, 12 Aug 2019 14:53:36 +0000
Subject: Re: [PATCH v2] RDMA/siw: Fix a memory leak in siw_init_cpulist()
Message-Id: <35d646ab61f2b81b382c8638c0d43ab2188d8c2b.camel@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-SpeExsd2MzbZ9zFIrpNk"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190809140904.GB3552@mwanda>
         <OFD09B6B8D.A208B8E7-ON00258451.004F8BA4-00258451.004F8BAA@notes.na.collabserv.com>
In-Reply-To: <OFD09B6B8D.A208B8E7-ON00258451.004F8BA4-00258451.004F8BAA@notes.na.collabserv.com>
To: Bernard Metzler <BMT@zurich.ibm.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org


--=-SpeExsd2MzbZ9zFIrpNk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-09 at 14:28 +0000, Bernard Metzler wrote:
> -----"Dan Carpenter" <dan.carpenter@oracle.com> wrote: -----
>=20
> > To: "Bernard Metzler" <bmt@zurich.ibm.com>
> > From: "Dan Carpenter" <dan.carpenter@oracle.com>
> > Date: 08/09/2019 04:09PM
> > Cc: "Doug Ledford" <dledford@redhat.com>, "Jason Gunthorpe"
> > <jgg@ziepe.ca>, linux-rdma@vger.kernel.org,
> > kernel-janitors@vger.kernel.org
> > Subject: [EXTERNAL] [PATCH v2] RDMA/siw: Fix a memory leak in
> > siw_init_cpulist()
> >=20
> > The error handling code doesn't free siw_cpu_info.tx_valid_cpus[0].
> > The
> > first iteration through the loop is a no-op so this is sort of an
> > off
> > by one bug.  Also Bernard pointed out that we can remove the NULL
> > assignment and simplify the code a bit.
> >=20
> > Fixes: bdcf26bf9b3a ("rdma/siw: network and RDMA core interface")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Reviewed-by: Bernard Metzler <bmt@zurich.ibm.com>
> > ---
> > v2:  Remove the NULL assignment like Bernard Metzler pointed out.
> >=20
> > drivers/infiniband/sw/siw/siw_main.c | 4 +---
> > 1 file changed, 1 insertion(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/infiniband/sw/siw/siw_main.c
> > b/drivers/infiniband/sw/siw/siw_main.c
> > index d0f140daf659..05a92f997f60 100644
> > --- a/drivers/infiniband/sw/siw/siw_main.c
> > +++ b/drivers/infiniband/sw/siw/siw_main.c
> > @@ -160,10 +160,8 @@ static int siw_init_cpulist(void)
> >=20
> > out_err:
> > 	siw_cpu_info.num_nodes =3D 0;
> > -	while (i) {
> > +	while (--i >=3D 0)
> > 		kfree(siw_cpu_info.tx_valid_cpus[i]);
> > -		siw_cpu_info.tx_valid_cpus[i--] =3D NULL;
> > -	}
> > 	kfree(siw_cpu_info.tx_valid_cpus);
> > 	siw_cpu_info.tx_valid_cpus =3D NULL;
> >=20
> > --=20
> > 2.20.1
> >=20
> >=20
>=20
> Dan, many thanks for finding and fixing this!
>=20
>=20
> Reviewed-by: Bernard Metzler <bmt@zurich.ibm.com>
>=20

Thanks, applied to for-rc.

--=20
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD

--=-SpeExsd2MzbZ9zFIrpNk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAl1RfXAACgkQuCajMw5X
L926jA//YZib3qjLhR93l5NEdFZEj+Uvb3EW6bRhnEPSn8xCOoneAbcftGU4uUog
6F+eICxZ9/9JwZ2zXFhbVCJlYaIHAMIJfgUSge/oI0rFV3EYPuABP0Wg6K0fKs03
KkXoNXNLcWTGZ4KiYPd3YFX3RSyEvH3U5DSvt8RtSlg4X/FWhpUj4TYk/BHDtkfl
gR7zgfpDPRtG61DaUVM/um/olZPVDcPDb6ag0e9ncrk/fRqWNS2G19yRicQbXuUH
9QUWIDZ1TKgPbVuqTYAmYHeFc/k8IYRzsj20P2tI1RWO2Ael2JszYqCfBY5AMKVc
ZDXupZaeZvv2UpGu4gZnpbG+3lUndN0iBHkBjWNkE0u+qjaWaHZ7CPjIH17YIhoJ
IWF9QuXAwTcAvKH4eHU1HnAJmL3JSAYDi8Gn5kUawVHqEaw1qcD/+84/nYj8ctCn
MIRZQRHeuY1/2bOIG9TQ8xp3i8E+0bKe0BLsvzci8Hg72ui3j1kFAeoR1mfunkWX
+rxpv403VHCYNS+E5phVJHMBtLh2WfPptUhiPOVM/Y02lcQuN8MTbpV6FmZmKxs2
0h0OpW7By+yiIJR2QjEoBHvR3Pkj7q3dufta/wa3Vd4xhLGV+B5SONFTvUbfp0g+
kCNaBl3/dceva942VlwDy6ZFfQi07p7FcIq0eJQQL11ytAaUuno=
=bqUy
-----END PGP SIGNATURE-----

--=-SpeExsd2MzbZ9zFIrpNk--
