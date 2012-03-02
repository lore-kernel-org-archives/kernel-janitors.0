From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 Mar 2012 19:09:32 +0000
Subject: Re: [patch] edac i5000: fix pointer math in i5000_get_mc_regs()
Message-Id: <20120302190932.GI22598@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="mXDO3udm/xYWQeMQ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120302065441.GB24508@elgon.mountain>
 <4F508C16.30900@bfs.de>
In-Reply-To: <4F508C16.30900@bfs.de>
To: walter harms <wharms@bfs.de>
Cc: Eric Wollesen <ericw@xmtp.net>, Doug Thompson <dougthompson@xmission.com>, list-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--mXDO3udm/xYWQeMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 02, 2012 at 10:00:06AM +0100, walter harms wrote:
> > diff --git a/drivers/edac/i5000_edac.c b/drivers/edac/i5000_edac.c
> > index 4dc3ac2..fcdc4ab 100644
> > --- a/drivers/edac/i5000_edac.c
> > +++ b/drivers/edac/i5000_edac.c
> > @@ -1130,7 +1130,7 @@ static void i5000_get_mc_regs(struct mem_ctl_info=
 *mci)
> >  	pci_read_config_dword(pvt->system_address, AMBASE,
> >  			(u32 *) & pvt->ambase);
> >  	pci_read_config_dword(pvt->system_address, AMBASE + sizeof(u32),
> > -			((u32 *) & pvt->ambase) + sizeof(u32));
> > +			(u32 *)((char *) &pvt->ambase + sizeof(u32)));
> > =20
> >  	maxdimmperch =3D pvt->maxdimmperch;
> >  	maxch =3D pvt->maxch;
>=20
> i think this is hard to understand. personally i would prefer a union or =
other
> more obvious solutions. my suggestion would be to get rid of this.
>=20
> u32 bottom,top;
>  	pci_read_config_dword(pvt->system_address, AMBASE,
>   			&bottom);
> 	pci_read_config_dword(pvt->system_address, AMBASE+ sizeof(u32),
>   			&top);
> 	maxdimmperch=3D(u64)top<<32|bottom;
> =09
> you can find this pattern in other parts of the kernel also.
>=20

Sure.  I want to do this again anyway because I see I've missed some
other parts which have the same bug.  I'll resend a patch later.

regards,
dan carpenter

--mXDO3udm/xYWQeMQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPURrsAAoJEOnZkXI/YHqRcvEQAK+pJNqbiVna3olJmofaOUoA
qGB+b/eqIJdr/yFb2VV1Ia0X0LU6BWF4NQGndxRKTV2F0sja2vlB4Aqa/FB0ZM3o
lRxcm0zP13g1kBZeAF9jzuCQqM/AV4XYpDLjE3oGa7eehvwuZFiZn+6P7OEyZWU/
Mnb0gvB8miCR757zL/j0H4LqFDQbiD46NX9JlTW/l7S7xfRHAfHNkAFJZzMItWOv
oTKjxHeqPpTiIBu37pa/Hlmrn0tpX+nB1MfzFlv2mMIoXc7TmGtQX5sqRXKlodgt
1HK1JHolUUQqTMAPJ6yEWyhSAGW/xoxjEhjvh91sp5n2EGzyEG7HMXbwiJjiCEK3
SQIcOC0UPm53twZoa+hcZy0WOGIcNGQwY7yRvEmmayQuqL4+fHFnBI2UlOa0Po0O
T41exswyMdyTGb4vd1zPgKPpFWXXIrbgF2mxmdjj0+Y+gF8yknUldig8OUZN2UCo
PHNN48qFWJ3lDxRzsqtvRB/99McczPjh33lYO5B96f+BTW1PKC2ouqDfZ44Mudk2
78sQB98aD2UNt7HpG79uSX+m/v3WpEzHt1VATjB3wsIX0jGe26+kHQ/oQyhTNmPu
poT6X+kzyFpZ1UeChIuAaXpdqltjmc1029yVpv3+YudMflqVklOZwFkeWOcGP3e8
VBiCGgy+lirO/ReAIyRP
=ClNJ
-----END PGP SIGNATURE-----

--mXDO3udm/xYWQeMQ--
