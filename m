From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Nov 2016 11:07:13 +0000
Subject: Re: [PATCH] orangefs: Axe some dead code
Message-Id: <20161128110713.GE28558@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161121221702.6438-1-christophe.jaillet@wanadoo.fr>
 <alpine.BSO.2.20.1611221048250.48648@x220.mkb.name>
 <CAOg9mSRZ8VLGPD876DPq1iLFofwPExWb-rzvieoiP+kQJZiJeQ@mail.gmail.com>
 <20161125215139.GM6266@mwanda>
 <CAOg9mSR=_+j-AJSz1Kchhyek8sovAFhH7KU9Gz+wcV5KLns-9g@mail.gmail.com>
 <20161126100229.GO6266@mwanda>
 <CAOg9mSShecnZt56d7pkWHg_WCoge9Ko0=7PSxyfe3r42ukTtXQ@mail.gmail.com>
In-Reply-To: <CAOg9mSShecnZt56d7pkWHg_WCoge9Ko0=7PSxyfe3r42ukTtXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>
Cc: Martin Brandenburg <martin@omnibond.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Nov 26, 2016 at 08:51:57AM -0500, Mike Marshall wrote:
> I think I understand what you're saying, except for this part:
> 
> > would have been secretly disapointed at your lack of
> > courage in my heart but it would have been normal and fine.
>
What I'm saying is that for some people the cut off for 4.10 happens
the week or two before 4.9 is released.  I'm sending bugfixes and they
still push them out to 4.11.  It annoys me, secretly.

 
> I'm pretty sure that Linus won't accept a pull request from me
> at the wrong time and that I won't send one at the wrong time
> on purpose.

Linus pulls lots of things that make him unhappy.  If he didn't
compromise he would go mad.

> 
> I've been laboring under the belief that the rc period is when
> we "push only patches that do not include new functionalities",
> and I would have thought that stripping out a few lines of dead
> code would be appropriate then.
> 

No.  -rc is for fixing regressions only.  If it's a fix for a bug that
has *always* been there, then think carefully about how important it is
because that's not a regression fix.  If it's a bug fix, but it's not a
regression fix and it's not critical then wait.  Non-bugfixes should
only go in during the merge window.

regards,
dan carpenter

