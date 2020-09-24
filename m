From: Joe Perches <joe@perches.com>
Date: Thu, 24 Sep 2020 22:23:39 +0000
Subject: Re: [Cocci] coccinelle: Convert comma to semicolons (was Re: [PATCH] checkpatch: Add test for comma 
Message-Id: <a53048f738dacc1c58654eb94e229de79d4f94c2.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87r1qqvo2d.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87r1qqvo2d.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Julia Lawall <julia.lawall@inria.fr>
Cc: Giuseppe Scrivano <gscrivan@redhat.com>, Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernelnewbies <kernelnewbies@kernelnewbies.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@shadowen.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel-mentees@lists.linuxfoundation.org, cocci <cocci@systeme.lip6.fr>

On Thu, 2020-09-24 at 23:53 +0200, Thomas Gleixner wrote:
> On Thu, Sep 24 2020 at 13:33, Joe Perches wrote:
> > On Thu, 2020-09-24 at 22:19 +0200, Thomas Gleixner wrote:
> > > On Sat, Aug 22 2020 at 09:07, Julia Lawall wrote:
> > > > On Fri, 21 Aug 2020, Joe Perches wrote:
> > > > > True enough for a general statement, though the coccinelle
> > > > > script Julia provided does not change a single instance of
> > > > > for loop expressions with commas.
> > > > > 
> > > > > As far as I can tell, no logic defect is introduced by the
> > > > > script at all.
> > > > 
> > > > The script has a rule to ensure that what is changed is part of a top
> > > > level statement that has the form e1, e2;.  I put that in to avoid
> > > > transforming cases where the comma is the body of a macro, but it protects
> > > > against for loop headers as well.
> > > 
> > > Right. I went through the lot and did not find something dodgy. Except
> > > for two hunks this still applies. Can someone please send a proper patch
> > > with changelog/SOB etc. for this?
> > 
> > Treewide?
> > 
> > Somebody no doubt would complain, but there
> > _really should_ be some mechanism for these
> > trivial and correct treewide changes...
> 
> There are lots of mechanisms:

I've tried them all.

None of them work particularly well,
especially the individual patch route.

>  - Andrew picks such changes up

Generally not treewide.

>  - With a few competent eyeballs on it (reviewers) this can go thorugh
>    the trivial tree as well. It's more than obvious after all.

Jiri is almost non-existent when it comes to
trivial treewide patches.

>  - Send the script to Linus with a proper change log attached and ask
>    him to run it.

Linus has concerns about backports and what he
deems trivialities.  Generally overblown IMO.

>  - In the worst case if nobody feels responsible, I'll take care.

If Julia doesn't send a new patch in the next few
days, I will do the apply, fixup and resend of hers.

So, you're on-deck, nearly up...

> All of the above is better than trying to get the attention of a
> gazillion of maintainters.

True.

And all of the treewide changes depend on some
generic acceptance of value in the type of change.

Some believe that comma->semicolon conversions
aren't useful as there isn't a logical change and
the compiler output wouldn't be different.

Anyway, cheers, Joe
