From: Ingo Molnar <mingo@elte.hu>
Date: Fri, 23 Oct 2009 07:59:11 +0000
Subject: Re: Fix sparse warning
Message-Id: <20091023075911.GC10067@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4ADCD559.9080807@sysvalve.homelinux.net>
In-Reply-To: <4ADCD559.9080807@sysvalve.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


* "L. Alberto Gim=E9nez" <agimenez@sysvalve.homelinux.net> wrote:

> >  - All such variables need proper locking, as they can be re-entered=20
> >    from multiple CPUs (while local stack variables cannot and generally=
=20
> >    dont need such locking). Moving them to file scope makes sure it's=20
> >    all visible and makes sure proper locking is done.
>=20
> The same thing about visibility applies as above. Moreover, I can't=20
> see any explicit lock inside the main.c file. [...]

It's implicit - all bootup execution is serialized.

So it's double important to make any global state clearly visible -=20
should any of this be pushed to async bootup init functions (which would=20
require the addition of a lock).

> > All in one, there's a constant trend away from statics at function=20
> > scope. It can be done correctly but is subtly fragile for the above=20
> > reasons.
>=20
> Indeed it may be fragile. And I'm sure that you've faced tons of bugs=20
> because of declaring static variables in funcion scope and not having=20
> it in mind when using those variables. I'm just a newbie and I have=20
> not faced serious challenges about kernel development, but I think=20
> that those "sanity" things should be fixed (I'm kind of standards=20
> taliban :) ), but I need your expertise to know *how* to fix it, from=20
> the point of view of semantics and not just syntax.

I think it's subtly wrong if you try to 'fix a warning', as the subject=20
line already says it.

Warnings are not something that should be 'fixed' - they are just a sign=20
of some sort of trouble:

 1- bug/limitation in the tool (Sparse)
 2- uncleanliness in the source code
 3- bug in the source code

here it seems to be case #1, as file scope statics are perfectly fine,=20
even if used by a single function.

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
