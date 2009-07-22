From: Mauro Carvalho Chehab <mchehab@redhat.com>
Date: Wed, 22 Jul 2009 11:54:36 +0000
Subject: Re: [PATCH] media/video/cx88: adding __init/__exit macros to cx88
Message-Id: <20090722085436.6ebd43c1@pedra.chehab.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907170100.02816.PeterHuewe@gmx.de>
	<200907221136.30036.PeterHuewe@gmx.de>
	<alpine.LNX.2.00.0907221138520.11648@wotan.suse.de>
In-Reply-To: <alpine.LNX.2.00.0907221138520.11648@wotan.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jiri Kosina <jkosina@suse.cz>
Cc: Peter =?ISO-8859-1?B?SPx3ZQ==?= <PeterHuewe@gmx.de>, kernel-janitors@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@redhat.com>, Frederic CAND <frederic.cand@anevia.com>, Trent Piepho <xyzzy@speakeasy.org>, Darron Broad <darron@kewl.org>, Steven Toth <stoth@linuxtv.org>, "Igor M. Liplianin" <liplianin@me.by>, Oleg Roitburd <oroitburd@gmail.com>, Yang Hongyang <yanghy@cn.fujitsu.com>, Jelle Foks <jelle@foks.us>, linux-media@vger.kernel.org

Em Wed, 22 Jul 2009 11:40:08 +0200 (CEST)
Jiri Kosina <jkosina@suse.cz> escreveu:

> On Wed, 22 Jul 2009, Peter H=FCwe wrote:
>=20
> > > Trivial patch which adds the __init and __exit macros to the=20
> > > module_init / module_exit functions to several files in=20
> > > drivers/media/video/cx88/
> > >
> > > linux version 2.6.31-rc3 - linus git tree
> > >
> > > Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> > any updates on this patch?

Acked-by: Mauro Carvalho Chehab <mchehab@redhat.com>
> >=20
> > If my minor fixes bug you too much please give me a hint how I can impr=
ove my=20
> > patches.
>=20
> Well the minor issue is that when you send trivial patches to=20
> trivial@kernel.org and also to all the involved maintainers, I am waiting=
=20
> for them to apply them into their trees and only if this doesn't happen=20
> after some time (I check regularly, but not very frequently), I apply to =

> trivial queue.

Jiri,

Are you applying it via trivial tree, or do you prefer if I apply this patc=
h at
linux-media one?

--=20

Cheers,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
