From: Mike Marshall <hubcap@omnibond.com>
Date: Sat, 26 Nov 2016 13:51:57 +0000
Subject: Re: [PATCH] orangefs: Axe some dead code
Message-Id: <CAOg9mSShecnZt56d7pkWHg_WCoge9Ko0=7PSxyfe3r42ukTtXQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161121221702.6438-1-christophe.jaillet@wanadoo.fr>
 <alpine.BSO.2.20.1611221048250.48648@x220.mkb.name> <CAOg9mSRZ8VLGPD876DPq1iLFofwPExWb-rzvieoiP+kQJZiJeQ@mail.gmail.com>
 <20161125215139.GM6266@mwanda> <CAOg9mSR=_+j-AJSz1Kchhyek8sovAFhH7KU9Gz+wcV5KLns-9g@mail.gmail.com>
 <20161126100229.GO6266@mwanda>
In-Reply-To: <20161126100229.GO6266@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Martin Brandenburg <martin@omnibond.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

I think I understand what you're saying, except for this part:

> would have been secretly disapointed at your lack of
> courage in my heart but it would have been normal and fine.

I'm pretty sure that Linus won't accept a pull request from me
at the wrong time and that I won't send one at the wrong time
on purpose.

I've been laboring under the belief that the rc period is when
we "push only patches that do not include new functionalities",
and I would have thought that stripping out a few lines of dead
code would be appropriate then.

-Mike

On Sat, Nov 26, 2016 at 5:02 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Fri, Nov 25, 2016 at 06:09:39PM -0500, Mike Marshall wrote:
>> We're on rc7 now. Linus said in LWN that there might be a rc8 this time.
>> I'll try to get this pulled in 4.9-rc8 I hope, or sometime in 4.10...
>> it is just a
>> few lines of code that I don't think can be reached. Sorry for the confusion.
>
> It's not -rc material at all.  Especially not after -rc2.  If you had
> said 4.11, I would have been secretly disapointed at your lack of
> courage in my heart but it would have been normal and fine.  Merging
> this in 4.10 is the earliest reasonable.
>
> regards,
> dan carpenter
>
