From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Date: Thu, 05 Oct 2017 20:29:49 +0000
Subject: Re: [PATCH 1/2] powerpc/platforms/cell: Delete an error message for a failed memory allocation in th
Message-Id: <20171005222949.3a288238@kitsune.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <db9efaf4-f3d7-d5dc-b0b2-f20e418fa3c8@users.sourceforge.net>
 <62146108-5be0-c236-f404-4be122e162ac@users.sourceforge.net>
 <20171005220210.681f78e8@kitsune.suse.cz>
 <alpine.DEB.2.20.1710052205560.2626@hadrien>
In-Reply-To: <alpine.DEB.2.20.1710052205560.2626@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>, linuxppc-dev@lists.ozlabs.org, SF Markus Elfring <elfring@users.sourceforge.net>

On Thu, 5 Oct 2017 22:06:11 +0200 (CEST)
Julia Lawall <julia.lawall@lip6.fr> wrote:

> On Thu, 5 Oct 2017, Michal Such=C3=A1nek wrote:
>=20
> > Hello,
> >
> > On Thu, 5 Oct 2017 21:36:26 +0200
> > SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> > =20
> > > From: Markus Elfring <elfring@users.sourceforge.net>
> > > Date: Thu, 5 Oct 2017 21:04:30 +0200
> > >
> > > Omit extra messages for a memory allocation failure in these
> > > functions. =20
> >
> > this is bogus. All these functions return -1 on any error. Until
> > they reflect the error in their return value (and it is properly
> > propagated to the user) there is no way to tell WTF failed without
> > the message. =20
>=20
> A backtrace will be generated.
>=20

I do not see why it would. I do not expect the kernel to generate a
stack trace every time memory allocation fails. With all the hooks in
the code it is hard to tell, though.

Thanks

Michal
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
