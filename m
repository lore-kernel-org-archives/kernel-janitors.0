From: Peter =?utf-8?q?H=C3=BCwe?= <PeterHuewe@gmx.de>
Date: Tue, 22 Dec 2009 09:08:24 +0000
Subject: Re: [PATCH 1/6] uwb/i1480: add __init/__exit macros
Message-Id: <200912221008.24319.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261470431-23642-1-git-send-email-peterhuewe@gmx.de> <1261471904.609.0.camel@localhost.localdomain> <200912220957.25680.PeterHuewe@gmx.de>
In-Reply-To: <200912220957.25680.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Marcel Holtmann <marcel@holtmann.org>
Cc: David Vrabel <david.vrabel@csr.com>, Jiri Kosina <trivial@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Am Dienstag 22 Dezember 2009 09:57:25 schrieb Peter H=C3=BCwe:
> Am Dienstag 22 Dezember 2009 09:51:44 schrieb Marcel Holtmann:
> > Hi Peter,
> >
> > > Trivial patch which adds the __init/__exit macros to the module_init/
> > > module_exit functions of
> > >
> > > uwb/i1480/i1480-est.c
> > >
> > > @Jiri: As there is no maintainer, it seems it is up to you to decide =
:)
> >
> > actually David Vrabel is taking care of the UWB subsystem and everything
> > related to it.
> >
> > Regards
> >
> > Marcel
>=20
> Hmm, okay - thanks for the hint.
>=20
> Unfortunately get-maintainers.pl did not come up with any one.
>=20
> Thanks,
> Peter

Created a patch for MAINTAINERS
"[PATCH] MAINTAINERS: Fix entry for uwb to include subdirectories"


Thanks,
Peter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
