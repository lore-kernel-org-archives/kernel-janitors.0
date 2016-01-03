From: Joe Perches <joe@perches.com>
Date: Sun, 03 Jan 2016 07:29:23 +0000
Subject: Re: [PATCH 1/3] NFC-mei_phy: Refactoring for mei_nfc_connect()
Message-Id: <1451806163.4334.36.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
	 <56883849.2080304@users.sourceforge.net>
	 <5688390B.3080800@users.sourceforge.net>
	 <CAGRGNgWiHKLrHMUySnCpfiF1+C=QV-i4C4KNmziga3-E1CLfKA@mail.gmail.com>
	 <5688C712.3070900@users.sourceforge.net>
In-Reply-To: <5688C712.3070900@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, Julian Calaby <julian.calaby@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, 2016-01-03 at 08:00 +0100, SF Markus Elfring wrote:
> > > =A0=A0=A0=A0=A0=A0=A0=A0r =3D 0;
> > > -
> > > -err:
> > > +free_reply:
> > > =A0=A0=A0=A0=A0=A0=A0=A0kfree(reply);
> > > +free_cmd:
> > > =A0=A0=A0=A0=A0=A0=A0=A0kfree(cmd);
> > > -
> >=20
> > Why are you deleting the two blank lines here?
>=20
> Can they be unnecessary at this source code place
> according to the Linux coding style convention?

As far as I know, there's no linux specific accepted
convention for blank lines preceding labels.

My personal preference is for a blank line before a
new block, but not before the second and subsequent
labels in an error handling block.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
