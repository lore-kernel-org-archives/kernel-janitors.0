From: Ingo Molnar <mingo@elte.hu>
Date: Mon, 16 Feb 2009 17:12:33 +0000
Subject: Re: [PATCH] Remove errors caught by checkpatch.pl in
Message-Id: <20090216171233.GB25907@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902151034s5444efabw455c1dac1b875086@mail.gmail.com> <20090215184752.GA4970@uranus.ravnborg.org> <4999650C.6030700@s5r6.in-berlin.de> <20090216132822.GC17996@elte.hu> <4999717F.7090205@s5r6.in-berlin.de> <20090216141917.GA8981@elte.hu> <499984C1.6020004@s5r6.in-berlin.de> <20090216155023.GA4422@elte.hu> <4999908D.4050403@s5r6.in-berlin.de>
In-Reply-To: <4999908D.4050403@s5r6.in-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, Manish Katiyar <mkatiyar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


* Stefan Richter <stefanr@s5r6.in-berlin.de> wrote:

> Ingo Molnar wrote:
> > * Stefan Richter <stefanr@s5r6.in-berlin.de> wrote:
> >=20
> >> Ingo Molnar wrote:
> >>> We routinely mention Sparse, lockdep, Coverity, Coccinelle, kmemleak,=
=20
> >>> ftrace, kmemcheck and other tools as well when it motives to fix a bu=
g=20
> >>> or uncleanliness. [...] It is absolutely fine to
> >>> mention checkpatch when it catches uncleanliness in code that already=
=20
> >>> got merged. I dont understand your point.
> >> I wrote "don't mention checkpatch" but I really meant "think about what
> >> the effect of the patch is and describe this".
> >=20
> > Are you arguing that in all those other cases the tools should not be=20
> > mentioned either? I dont think that position is tenable.
>=20
> I'm arguing that in all those other cases the method "think about what=20
> the effect of the patch is and describe this"=B9 applies just as well,=20
> and that the mentioning of the tools used does not add value for=20
> future readers of the changelog. [...]

That position of not adding tool information to the commit log is not=20
just not tenable but also incredibly silly.

Those tools are useful, they result in fixes, so why should the patch=20
author pretend and hide the method of finding problems from the Git=20
history? We often write "found via review" or "found via testing". It's=20
useful and it gives people an idea of how certain types of fixes were=20
found.

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
