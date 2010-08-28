From: David Brownell <david-b@pacbell.net>
Date: Sat, 28 Aug 2010 18:11:07 +0000
Subject: Re: [PATCH 2/7] drivers/usb/gadget: Remove double test
Message-Id: <620873.86430.qm@web180307.mail.gq1.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1008281916580.13508@ask.diku.dk>
References: <1283010066-20935-3-git-send-email-julia@diku.dk>
In-Reply-To: <1283010066-20935-3-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Stefan Richter <stefanr@s5r6.in-berlin.de>, Julia Lawall <julia@diku.dk>
Cc: Thomas Dahlmann <dahlmann.thomas@arcor.de>, kernel-janitors@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-geode@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org



--- On Sat, 8/28/10, Julia Lawall <julia@diku.dk> wrote:

> From: Julia Lawall <julia@diku.dk>
> Subject: Re: [PATCH 2/7] drivers/usb/gadget: Remove double test
> To: "Stefan Richter" <stefanr@s5r6.in-berlin.de>
> Cc: "David Brownell" <david-b@pacbell.net>, "Thomas Dahlmann" <dahlmann.t=
homas@arcor.de>, kernel-janitors@vger.kernel.org, "David Brownell" <dbrowne=
ll@users.sourceforge.net>, "Greg Kroah-Hartman" <gregkh@suse.de>, linux-geo=
de@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel=
.org
> Date: Saturday, August 28, 2010, 10:17 AM
> On Sat, 28 Aug 2010, Stefan Richter
> wrote:
>=20
> > Julia Lawall wrote:
> > > On Sat, 28 Aug 2010, David Brownell wrote:
> > >=20
> > >> Please update $SUBJECT to say which driver
> is
> > >> affected;
> > >=20
> > > Done.

Thanks.  Unless the author/maintainer of this
driver objects, the patch is OK by me.


> > >=20
> > >> it's not everything in that directory,
> > >> and accurate GIT summaries help a lot.
> > >=20
> > > Is there some sort of rule that can be
> followed?=A0

Don't be misleading ...

Generally, if it updates just one driver,
mention that driver in $SUBJECT.

Only say the subsystem itself is being
updated (which your original $SUBJECT did)
when the patch affects framework code,=20
that's shared by all drivers,=20

=A0> > >  What if the=20
> > > patch affects only two files?

Which two files?
The "patch updates one thing" rule will then
cause it to affect only one driver (usually)
or some framework issue, so the above policies
kick in directly.

Rarely there will be bugs repeated (e.g. via
cut/paste) in multiple drivers, ... in which
 case  it can make sense to summarize a patch
as a multi-driver subsystem fix .  Similarly
with API changes.




--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
