From: Sven Eckelmann <sven.eckelmann@gmx.de>
Date: Wed, 09 Jun 2010 16:13:32 +0000
Subject: Re: [PATCH] drivers/staging/batman-adv: fix function prototype
Message-Id: <20100609161332.GA18171@sven-atom.lazhur.ath.cx>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="PNTmBPCT7hxwcZjr"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1275787408.10961.13.camel@lenovo>
In-Reply-To: <1275787408.10961.13.camel@lenovo>
To: kernel-janitors@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 06, 2010 at 09:37:06AM -0700, Greg KH wrote:
> On Sun, Jun 06, 2010 at 09:41:36AM +0200, Sven Eckelmann wrote:
> > On Sunday 06 June 2010 03:23:28 you wrote:
> > > In today linux-next I got a compile warning in staging/batman-adv.
> > >=20
> > > This is due a struct bin_attribute read function prototype change and=
 the
> > > driver was not updated.
> > >=20
> > > This patch solves the issue
> > >=20
> > > Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
> > > ---
> > [...]
> > >=20
> > > -static ssize_t transtable_local_read(struct kobject *kobj,
> > [...]
> > >=20
> > > -static ssize_t transtable_global_read(struct kobject *kobj,
> > [...]
> > >=20
> > > -static ssize_t originators_read(struct kobject *kobj,
> > [...]
> > >=20
> > > -static ssize_t vis_data_read(struct kobject *kobj,
> > [...]
> >=20
> > These files were already removed and the patch is waiting in GregKH's q=
ueue.
>=20
> Hm, but those files are not going to be removed until 2.6.36, right?  So
> I think we need this patch now to keep 2.6.35 working properly.  Or am I
> mistaken?

No, this is correct. I just wanted to write a short notice... but it was a
little bit too short.

Situation:
 * Files were removed (actually moved to debugfs) for 2.6.36
 * patches for that were already send to Greg
 * this patch conflicts with at least one patch we already sent

How it was (hopefully) resolved:
 * this and another patch was applied in our repo in a special 2.6.35 branch
 * our debugfs patches (and patches we send at the same time) were rebased
 * new patches for 2.6.35 and again _all_ patches for 2.6.36 were send to
   Greg some days ago

I hope that it is ok for Greg. Otherwise he would have to fix the merge
conflicts - extra work which (at least I think) isn't is duty. I am not hap=
py
about the resubmission, but maybe we find a good way to coordinate the
submission of patches a little bit better.

And forgot also to thank Javier - it seems that I completely missed that ch=
ange
or it came at the same time we submitted out things to Greg (not sure about
that - but in case of doubt, just say that it was my fault).

Best regards,
	Sven

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBCgAGBQJMD72rAAoJEF2HCgfBJntGcSEQAKGFXtqwyZJInqTyyhk9QSfe
VUMIa7qObzCZXkui0AFap8jwIq1a96zAwyRPNT3b0rklPtoeZ6phxcNDaTKJVUgi
FlPQnpPrRG/SxECaIU69RA4QhaoWmVgiQKzBbeJFTGsL+daTvqr6CvkDji7VGQ3X
AArqRThrHlGt28WqTNfgWb2lWZCH0HWqjfRDqf4RsmzEJIMrbdbU+N/cQECc6oCm
+i1Kn/lnxN1Y2ozVUa60CV4vch0X5ztfOD1+LHs2FmkWwT9CLIYiN8cQOvf9g6bE
KPRNEBGF6J+Vp9E1rAcEXXFbPObfODoCAxLv61AAE1H8I56r0qkRVU5Zd9oQEoTO
WIQwHQxymu9UsdcI0+c1C1hXkW7KKApae0tZPfGFfOHlmAusDCTlgpGrU1raELP+
aO0ZuV+58WaTjIA5KHIBJdoAqo450mOVS5Ji9I3k3kawm8t2nqFJqt+lWxjamzS7
sTYqQ/nHJwihQrtQb9Hqq82cHg15fleMsp5YlCOR3nCF0JM0/2CY0oV69DSWLccR
Q9+f2YAzClNeTXgn+bNEja+UzvHa2riUr+tDvQXojlZy3NL0VDegxCiNHA9xhzeM
IMLZE1d+cUfUhOFX88KTfgKunkIlaurrDGjaicQPvPu+a1wWkGse1hNHUd2yIJP/
5/cN5omBAKggy+zNG+Uq
=lkFD
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
