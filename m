From: Martin Knoblauch <spamtrap@knobisoft.de>
Date: Wed, 05 Jan 2011 10:24:46 +0000
Subject: Re: [patch] checkpatch: putting the && or || on the wrong line
Message-Id: <232289.97320.qm@web113301.mail.gq1.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110104055900.GA5062@bicker> <1294124330.6617.15.camel@Joe-Laptop> <20110104092431.GB1886@bicker>
In-Reply-To: <20110104092431.GB1886@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

----- Original Message ----

> From: Dan Carpenter <error27@gmail.com>
> To: Joe Perches <joe@perches.com>
> Cc: Andy Whitcroft <apw@canonical.com>; linux-kernel@vger.kernel.org; 
>kernel-janitors@vger.kernel.org
> Sent: Tue, January 4, 2011 10:24:31 AM
> Subject: Re: [patch] checkpatch: putting the && or || on the wrong line
> 
> On Mon, Jan 03, 2011 at 10:58:50PM -0800, Joe Perches wrote:
> > On Tue,  2011-01-04 at 08:59 +0300, Dan Carpenter wrote:
> > > +             WARN("put the && or || at the end  of the previous line\n" . 
>$herecurr);
> > 
> > I've submitted something  like this a couple of times and gotten
> > various objections but I think  it's sensible.
> > 
> > https://lkml.org/lkml/2009/12/5/65
> > https://lkml.org/lkml/2010/7/11/92
> 
> If everyone except you thinks  it's a waste of time, then stop asking me
> to redo my patches.  :/   I don't care either way so long as CodingStyle
> and checkpatch reflect the  rules.
> 

 The problem is that CodingStyle (here and elsewhere) is viewed a the holy-grail 
or at least natural-law by some. It should not. It is just about style/taste and 
that will never suit everybody. Insisting to much on style is just driving those 
away that:

a) just want to contribute content
b1) have their own style for decades
b2) detest uniformity

 For *me* the sensible thing is to keep "style" when you make small 
modifications/patches to existing stuff, but use whatever style is best for you 
when contributing new stuff.

 Anyway, I just wanted to say "Happy New Year" to Linux :-)

Cheers
Martin
