From: Jiri Kosina <jkosina@suse.cz>
Date: Wed, 22 Jul 2009 09:40:08 +0000
Subject: Re: [PATCH] media/video/cx88: adding __init/__exit macros to cx88
Message-Id: <alpine.LNX.2.00.0907221138520.11648@wotan.suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="168427776-1656527655-1248255610=:11648"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907170100.02816.PeterHuewe@gmx.de> <200907221136.30036.PeterHuewe@gmx.de>
In-Reply-To: <200907221136.30036.PeterHuewe@gmx.de>
To: =?ISO-8859-15?Q?Peter_H=FCwe?= <PeterHuewe@gmx.de>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@redhat.com>, Frederic CAND <frederic.cand@anevia.com>, Trent Piepho <xyzzy@speakeasy.org>, Darron Broad <darron@kewl.org>, Steven Toth <stoth@linuxtv.org>, "Igor M. Liplianin" <liplianin@me.by>, Oleg Roitburd <oroitburd@gmail.com>, Yang Hongyang <yanghy@cn.fujitsu.com>, Jelle Foks <jelle@foks.us>, linux-media@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--168427776-1656527655-1248255610=:11648
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Jul 2009, Peter H=FCwe wrote:

> > Trivial patch which adds the __init and __exit macros to the=20
> > module_init / module_exit functions to several files in=20
> > drivers/media/video/cx88/
> >
> > linux version 2.6.31-rc3 - linus git tree
> >
> > Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> any updates on this patch?
>=20
> If my minor fixes bug you too much please give me a hint how I can improv=
e my=20
> patches.

Well the minor issue is that when you send trivial patches to=20
trivial@kernel.org and also to all the involved maintainers, I am waiting=20
for them to apply them into their trees and only if this doesn't happen=20
after some time (I check regularly, but not very frequently), I apply to=20
trivial queue.

Thanks,

--=20
Jiri Kosina
SUSE Labs
--168427776-1656527655-1248255610=:11648--
