From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 07 Dec 2011 07:58:46 +0000
Subject: Re: [patch -next] x86: dubious one-bit signed bitfields
Message-Id: <20111207075846.GH3236@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="hAW+M2+FUO+onfmf"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111207063848.GA14507@elgon.mountain>
In-Reply-To: <20111207063848.GA14507@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--hAW+M2+FUO+onfmf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2011 at 11:39:31PM -0800, H. Peter Anvin wrote:
> On 12/06/2011 10:38 PM, Dan Carpenter wrote:
> > It doesn't cause any runtime problems in this case, but bitfields should
> > be unsigned.  This file gets included a lot so it generates thousands of
> > Sparse warnings about dubious one-bit signed bitfields.
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >=20
> > diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/=
thread_info.h
> > index 0ecd1a9..114dca1 100644
> > --- a/arch/x86/include/asm/thread_info.h
> > +++ b/arch/x86/include/asm/thread_info.h
> > @@ -40,8 +40,8 @@ struct thread_info {
> >  						*/
> >  	__u8			supervisor_stack[0];
> >  #endif
> > -	int			sig_on_uaccess_error:1;
> > -	int			uaccess_err:1;	/* uaccess failed */
> > +	unsigned int		sig_on_uaccess_error:1;
> > +	unsigned int		uaccess_err:1;	/* uaccess failed */
> >  };
> > =20
>=20
> Can bitfields legally be declared "bool"?  If so it's probably the right
> thing, really...

Sure.  Bool takes one byte, so it would be:
	bool			sig_on_uaccess_error:1;
	bool			uaccess_err:1;  /* uaccess failed */

The __u8 types mean that we're trying to not polute the posix
namespace?  Does that affect bool?  I'm not sure the rules with that.

regards,
dan carpenter


--hAW+M2+FUO+onfmf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO3xy1AAoJEOnZkXI/YHqROjAP/0PM2BFhLCrxKgk4aKYbT/rQ
pazrnSX32dFuLOxf2SX6TVmOQ/BfEuuFJOI1T54rqxXOVMr1HxLdigRLxewvpIOz
rDoLMPsT8DiyUTTjB/pCaaVAl+BYhnLfEGXrhsmTtfHwKbxs1HoaOka4yMCM3pCo
03HnQ93/K/KhSLWZ67gXgA/clGHK8CMej014YzfrjBmHVVu0Kr+BRW26AvxOncRx
8b/E32Nmd0rnjq8GSzAhUI+MsqwxikudDGOvsCG7Dt7MfDvm4aMr9IGb7RPyh+Dq
SnJijCn1TMT0z+r+sHssBJUoUH/rpPxRtEFo8UHHyaOgzhCHDDKCqINt426rgXUv
yUMid4IdaXVFfqDBOdhUIH0eV8SV0+Wv2svKZrwVXaASkakPhDHanXaVoKuCf6i8
iWFexFMbm/8bjJ/lAyCEcryrXnpECMHtnXcfWcCYVqcCbu/9pOaIAdWijYuOqdpq
uAD2xoYCltMOCRusbLOcUF/6lAjR/cC5nNIKp+nM7FunBJoabzFniGMScBo3+68i
9omKtTM3ztu58XEDvNE4Ske6xDDmaB9WmKDNZK4g2K6HzVHs+Drj/XsdyP9EHj2y
MkrO9hbSTtBSdI3CvEx2zylJXtkCvmQWasJ+SKpOdHzAkj96fIMZNZVp6tCYS25Y
myfslH/Xls8HY18YrQVl
=/cIm
-----END PGP SIGNATURE-----

--hAW+M2+FUO+onfmf--
