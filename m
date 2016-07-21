From: Wolfram Sang <wsa@the-dreams.de>
Date: Thu, 21 Jul 2016 06:25:43 +0000
Subject: Re: [PATCH 3/9] staging: ks7010: Return directly after a failed kmalloc()
Message-Id: <20160721062543.GA1664@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <3aa380a9-afe6-6dc8-7533-6747afeb1bdc@users.sourceforge.net>
 <alpine.DEB.2.10.1607172057500.3177@hadrien>
 <20160720154756.GC1688@katana>
 <2071ae3b-9878-c798-6ead-897d1dd0d116@users.sourceforge.net>
In-Reply-To: <2071ae3b-9878-c798-6ead-897d1dd0d116@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2016 at 08:40:11PM +0200, SF Markus Elfring wrote:
> >>> @@ -713,10 +713,8 @@ static int ks7010_sdio_update_index(struct ks_wl=
an_private *priv, u32 index)
> >>>  	unsigned char *data_buf;
> >>>
> >>>  	data_buf =3D kmalloc(sizeof(u32), GFP_KERNEL);
> >>> -	if (!data_buf) {
> >>> -		rc =3D 1;
> >>> -		goto error_out;
> >>> -	}
> >>> +	if (!data_buf)
> >>> +		return 1;
> >>
> >> One could rather wonder why the function has such strange error values=
=2E..
> >=20
> > Agreed. Markus, can you check if we can use -ENOMEM in those places.
>=20
> I find that I do not know this software good enough at the moment
> so that I could safely decide on the shown special error values.
> I guess that further clarification might be needed for affected
> implementation details.

That's OK, too.

Acked-by: Wolfram Sang <wsa@the-dreams.de>


--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXkGrnAAoJEBQN5MwUoCm2soIP/3SVaHud4GD7KIThwAmQC51Z
1vZvUzFh1rZuIH0ZOUNt34AVBJlClgWK2iNhpg7kh1TI6/Dd3rpOm9KZlMCAlYYE
Q/fVGCGgTkXGCpemtaTHTu8ehdoIFRdOkYVbZlrmvp0Z0Dy/iEZG2Jo1GsTHe+JS
GP1KIax4PTpxhjEK/5TWbfKpe1No/IwcZwKJlf1LmhO8jA4jBRgyTfThTeSP0yOi
lIhy5z8wcHMlPFprN2qpENd5Vsnn7xDEo7LQegnl8ijhQH2xq5vfUFygdmhGVBiM
DIpq8O1gea+UESItBoEYB21LEg4MYpZCK9ZuAIQyHqVFYfweNuS4CbI/E7tDLbXz
B1QaIwWJqTa5gbDXw+fkaW1ePUJjoIZaI0shb7NYE+arZf2yWQ9jT4dIhlub5FX/
ALhZ/zB9tIkJqu/qEtuOr1clIvNRNPeOL/FSksjatqWiuSXeX3HFmkyFTCO7LQBr
uQxRLjIPKIW5CLZ7T9t2YufQOe1DIAY5benFPyjhYPLf2UEdxtzaeoPGxGzZqhJr
kcV64REKIhE/q54iQoZEzfqS4wDnZVvJOVnLhgB+7MwDmeX2b2+yZBYKXqYSLniZ
AhfHuME4YGIhbSU2gozuRbIEe9qgY0uFOMZvhzHe2UvP5m8h8oZOI1aMSjPDcW1+
8vI5sIQtK3rc0UAMJOgg
=pw8s
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
