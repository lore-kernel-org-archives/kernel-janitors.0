From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 27 Dec 2015 11:41:30 +0000
Subject: Re: [Cocci] [PATCH v2] coccinelle: api: check for propagation of error from platform_get_irq
Message-Id: <alpine.DEB.2.02.1512271239460.2038@localhost6.localdomain6>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-506290417-1451216492=:2038"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451157891-24881-1-git-send-email-Julia.Lawall@lip6.fr>
 <567EF188.7020203@cogentembedded.com>
 <alpine.DEB.2.02.1512262107340.2070@localhost6.localdomain6>
 <alpine.DEB.2.02.1512262123500.2070@localhost6.localdomain6>
 <567EF895.6080702@cogentembedded.com>
 <alpine.DEB.2.02.1512262156580.2070@localhost6.localdomain6>
 <567F9A29.50202@users.sourceforge.net>
In-Reply-To: <567F9A29.50202@users.sourceforge.net>
To: cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-506290417-1451216492=:2038
Content-Type: TEXT/PLAIN; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable



On Sun, 27 Dec 2015, SF Markus Elfring wrote:

> > The error return value of platform_get_irq seems to often get dropped.
>=20
> How do you think about any more fine-tuning here?
>=20
> Commit message:
> * =85 of the platform_get_irq() function seems to get dropped too often.
>=20
> * Why do you concentrate on a single function name?
>   Do you plan to extend this source code analysis approach?
>=20
>=20
> > +@script:python r_report depends on report@
> > +j0 << r.j0;
> > +j1 << r.j1;
> > +@@
> > +
> > +msg =3D "Propagate return value of platform_get_irq around line %s." %=
 (j1[0].line)
>=20
> Are there more unchecked return values which are interesting
> for further considerations?
> https://cwe.mitre.org/data/definitions/252.html

The value is not unchecked.  I made a specific rule because the specific=20
problem is quite common.

julia
--8323328-506290417-1451216492=:2038--
