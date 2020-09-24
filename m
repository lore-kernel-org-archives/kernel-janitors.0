From: Thomas Gleixner <tglx@linutronix.de>
Date: Thu, 24 Sep 2020 21:53:46 +0000
Subject: Re: [Cocci] coccinelle: Convert comma to semicolons (was Re: [PATCH] checkpatch: Add test for comma 
Message-Id: <87r1qqvo2d.fsf@nanos.tec.linutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <6d5383a3ec02d89dd05797c3ae158aebdc0c88ae.camel@perches.com>
References: <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
In-Reply-To: <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Julia Lawall <julia.lawall@inria.fr>
Cc: Giuseppe Scrivano <gscrivan@redhat.com>, Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernelnewbies <kernelnewbies@kernelnewbies.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@shadowen.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel-mentees@lists.linuxfoundation.org, cocci <cocci@systeme.lip6.fr>

On Thu, Sep 24 2020 at 13:33, Joe Perches wrote:
> On Thu, 2020-09-24 at 22:19 +0200, Thomas Gleixner wrote:
>> On Sat, Aug 22 2020 at 09:07, Julia Lawall wrote:
>> > On Fri, 21 Aug 2020, Joe Perches wrote:
>> > > True enough for a general statement, though the coccinelle
>> > > script Julia provided does not change a single instance of
>> > > for loop expressions with commas.
>> > > 
>> > > As far as I can tell, no logic defect is introduced by the
>> > > script at all.
>> > 
>> > The script has a rule to ensure that what is changed is part of a top
>> > level statement that has the form e1, e2;.  I put that in to avoid
>> > transforming cases where the comma is the body of a macro, but it protects
>> > against for loop headers as well.
>> 
>> Right. I went through the lot and did not find something dodgy. Except
>> for two hunks this still applies. Can someone please send a proper patch
>> with changelog/SOB etc. for this?
>
> Treewide?
>
> Somebody no doubt would complain, but there
> _really should_ be some mechanism for these
> trivial and correct treewide changes...

There are lots of mechanisms:

 - Andrew picks such changes up

 - With a few competent eyeballs on it (reviewers) this can go thorugh
   the trivial tree as well. It's more than obvious after all.

 - Send the script to Linus with a proper change log attached and ask
   him to run it.

 - In the worst case if nobody feels responsible, I'll take care.

All of the above is better than trying to get the attention of a
gazillion of maintainters.

Thanks,

        tglx
