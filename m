From: Julia Lawall <julia.lawall@inria.fr>
Date: Sat, 22 Aug 2020 07:07:34 +0000
Subject: Re: [Cocci] coccinelle: Convert comma to semicolons (was Re: [PATCH] checkpatch: Add test for comma 
Message-Id: <alpine.DEB.2.22.394.2008220905460.3150@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-12852889-1598080054=:3150"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200818184107.f8af232fb58b17160c570874@linux-foundation.org>
 <3bf27caf462007dfa75647b040ab3191374a59de.camel@perches.com>
 <b0fd63e4b379eda69ee85ab098353582b8c054bb.camel@perches.com>
 <alpine.DEB.2.22.394.2008201021400.2524@hadrien> 
 <a5713d8597065ef986f780499428fcc4cd31c003.camel@perches.com>
 <alpine.DEB.2.22.394.2008201856110.2524@hadrien>
 <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
 <162653.1598067338@turing-police>
 <3836b482434bd0b9a609959d3696cc6113a93f2f.camel@perches.com>
In-Reply-To: <3836b482434bd0b9a609959d3696cc6113a93f2f.camel@perches.com>
To: Joe Perches <joe@perches.com>
Cc: Giuseppe Scrivano <gscrivan@redhat.com>, =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernelnewbies <kernelnewbies@kernelnewbies.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@shadowen.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel-mentees@lists.linuxfoundation.org, cocci <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-12852889-1598080054=:3150
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Fri, 21 Aug 2020, Joe Perches wrote:

> On Fri, 2020-08-21 at 23:35 -0400, Valdis Klētnieks wrote:
> > On Fri, 21 Aug 2020 18:08:08 -0700, Joe Perches said:
> > > (forwarding on to kernel-janitors/mentees and kernelnewbies)
> > >
> > > Just fyi for anyone that cares:
> > >
> > > A janitorial task for someone might be to use Julia's coccinelle
> > > script below to convert the existing instances of commas that
> > > separate statements into semicolons.
> >
> > Note that you need to *really* check for possible changes in semantics.
> > It's *usually* OK to do that, but sometimes it's not...
> >
> > for (i=0; i++, last++; !last) {
> >
> > changing that comma to a ; will break the compile.  In other cases, it can
> > introduce subtle bugs.
>
> True enough for a general statement, though the coccinelle
> script Julia provided does not change a single instance of
> for loop expressions with commas.
>
> As far as I can tell, no logic defect is introduced by the
> script at all.

The script has a rule to ensure that what is changed is part of a top
level statement that has the form e1, e2;.  I put that in to avoid
transforming cases where the comma is the body of a macro, but it protects
against for loop headers as well.

julia
--8323329-12852889-1598080054=:3150--
