From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Mon, 16 Feb 2009 16:13:01 +0000
Subject: Re: [PATCH] Remove errors caught by checkpatch.pl in	kernel/kallsyms.c
Message-Id: <4999908D.4050403@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902151034s5444efabw455c1dac1b875086@mail.gmail.com> <20090215184752.GA4970@uranus.ravnborg.org> <4999650C.6030700@s5r6.in-berlin.de> <20090216132822.GC17996@elte.hu> <4999717F.7090205@s5r6.in-berlin.de> <20090216141917.GA8981@elte.hu> <499984C1.6020004@s5r6.in-berlin.de> <20090216155023.GA4422@elte.hu>
In-Reply-To: <20090216155023.GA4422@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Ingo Molnar <mingo@elte.hu>
Cc: Sam Ravnborg <sam@ravnborg.org>, Manish Katiyar <mkatiyar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Ingo Molnar wrote:
> * Stefan Richter <stefanr@s5r6.in-berlin.de> wrote:
>=20
>> Ingo Molnar wrote:
>>> We routinely mention Sparse, lockdep, Coverity, Coccinelle, kmemleak,=20
>>> ftrace, kmemcheck and other tools as well when it motives to fix a bug =

>>> or uncleanliness. [...] It is absolutely fine to
>>> mention checkpatch when it catches uncleanliness in code that already=20
>>> got merged. I dont understand your point.
>> I wrote "don't mention checkpatch" but I really meant "think about what
>> the effect of the patch is and describe this".
>=20
> Are you arguing that in all those other cases the tools should not be=20
> mentioned either? I dont think that position is tenable.

I'm arguing that in all those other cases the method "think about what
the effect of the patch is and describe this"=B9 applies just as well, and
that the mentioning of the tools used does not add value for future
readers of the changelog.  When I go through changes from three or five
years ago, I need other kinds of information than patch authoring tools
that were en vogue some years ago.

Including anything relevant is the most important one of the tasks when
writing a changelog; another --- only slightly less important --- task
is to exclude anything irrelevant.

Of course what's relevant and irrelevant is in the eye of the beholder;
but the used tools + materials (scripts, static analyzers, favourite
editor, favourite crop of tea) surely are of very very low relevance.

-------------
=B9) and if it not quite clear, describe also why this change is desirable
--=20
Stefan Richter
-=3D=3D=3D-=3D-=3D=3D -=3D-=3D -=3D-http://arcgraph.de/sr/
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
