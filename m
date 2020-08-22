From: Joe Perches <joe@perches.com>
Date: Sat, 22 Aug 2020 05:30:21 +0000
Subject: Re: [Cocci] coccinelle: Convert comma to semicolons (was Re: [PATCH] checkpatch: Add test for comma 
Message-Id: <3836b482434bd0b9a609959d3696cc6113a93f2f.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200818184107.f8af232fb58b17160c570874@linux-foundation.org>
 <3bf27caf462007dfa75647b040ab3191374a59de.camel@perches.com>
 <b0fd63e4b379eda69ee85ab098353582b8c054bb.camel@perches.com>
 <alpine.DEB.2.22.394.2008201021400.2524@hadrien>
 <a5713d8597065ef986f780499428fcc4cd31c003.camel@perches.com>
 <alpine.DEB.2.22.394.2008201856110.2524@hadrien>
 <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
 <162653.1598067338@turing-police>
In-Reply-To: <162653.1598067338@turing-police>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc: Giuseppe Scrivano <gscrivan@redhat.com>, kernelnewbies <kernelnewbies@kernelnewbies.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@shadowen.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel-mentees@lists.linuxfoundation.org, cocci <cocci@systeme.lip6.fr>

On Fri, 2020-08-21 at 23:35 -0400, Valdis Kl=C4=93tnieks wrote:
> On Fri, 21 Aug 2020 18:08:08 -0700, Joe Perches said:
> > (forwarding on to kernel-janitors/mentees and kernelnewbies)
> >=20
> > Just fyi for anyone that cares:
> >=20
> > A janitorial task for someone might be to use Julia's coccinelle
> > script below to convert the existing instances of commas that
> > separate statements into semicolons.
>=20
> Note that you need to *really* check for possible changes in semantics.
> It's *usually* OK to do that, but sometimes it's not...
>=20
> for (i=3D0; i++, last++; !last) {
>=20
> changing that comma to a ; will break the compile.  In other cases, it can
> introduce subtle bugs.

True enough for a general statement, though the coccinelle
script Julia provided does not change a single instance of
for loop expressions with commas.

As far as I can tell, no logic defect is introduced by the
script at all.
