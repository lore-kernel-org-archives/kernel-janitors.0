From: Joe Perches <joe@perches.com>
Date: Thu, 24 Sep 2020 20:33:06 +0000
Subject: Re: [Cocci] coccinelle: Convert comma to semicolons (was Re: [PATCH] checkpatch: Add test for comma 
Message-Id: <6d5383a3ec02d89dd05797c3ae158aebdc0c88ae.camel@perches.com>
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
 <alpine.DEB.2.22.394.2008220905460.3150@hadrien>
 <87tuvn6i88.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87tuvn6i88.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Julia Lawall <julia.lawall@inria.fr>
Cc: Giuseppe Scrivano <gscrivan@redhat.com>, Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernelnewbies <kernelnewbies@kernelnewbies.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@shadowen.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel-mentees@lists.linuxfoundation.org, cocci <cocci@systeme.lip6.fr>

On Thu, 2020-09-24 at 22:19 +0200, Thomas Gleixner wrote:
> On Sat, Aug 22 2020 at 09:07, Julia Lawall wrote:
> > On Fri, 21 Aug 2020, Joe Perches wrote:
> > > True enough for a general statement, though the coccinelle
> > > script Julia provided does not change a single instance of
> > > for loop expressions with commas.
> > > 
> > > As far as I can tell, no logic defect is introduced by the
> > > script at all.
> > 
> > The script has a rule to ensure that what is changed is part of a top
> > level statement that has the form e1, e2;.  I put that in to avoid
> > transforming cases where the comma is the body of a macro, but it protects
> > against for loop headers as well.
> 
> Right. I went through the lot and did not find something dodgy. Except
> for two hunks this still applies. Can someone please send a proper patch
> with changelog/SOB etc. for this?

Treewide?

Somebody no doubt would complain, but there
_really should_ be some mechanism for these
trivial and correct treewide changes...
