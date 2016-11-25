From: Mike Marshall <hubcap@omnibond.com>
Date: Fri, 25 Nov 2016 23:09:39 +0000
Subject: Re: [PATCH] orangefs: Axe some dead code
Message-Id: <CAOg9mSR=_+j-AJSz1Kchhyek8sovAFhH7KU9Gz+wcV5KLns-9g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161121221702.6438-1-christophe.jaillet@wanadoo.fr>
 <alpine.BSO.2.20.1611221048250.48648@x220.mkb.name> <CAOg9mSRZ8VLGPD876DPq1iLFofwPExWb-rzvieoiP+kQJZiJeQ@mail.gmail.com>
 <20161125215139.GM6266@mwanda>
In-Reply-To: <20161125215139.GM6266@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Martin Brandenburg <martin@omnibond.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

We're on rc7 now. Linus said in LWN that there might be a rc8 this time.
I'll try to get this pulled in 4.9-rc8 I hope, or sometime in 4.10...
it is just a
few lines of code that I don't think can be reached. Sorry for the confusion.

-Mike

On Fri, Nov 25, 2016 at 4:51 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Thu, Nov 24, 2016 at 07:31:11AM -0500, Mike Marshall wrote:
>> This seems like a good and proper patch to me, and simple too.
>> But like all changes, it needs tested. While I was testing it, I
>> discovered a regression in the associated userspace code. I
>> "bisected" (we use SVN for the userspace part of Orangefs)
>> down to the commit that caused the regression, and some
>> of the userspace folks are going to fix it.
>>
>> I don't think I should ask Linus to pull this patch until I can
>> test it. Since we're about to go into rc7, it might not go in
>> until the next go around...
>>
>
> Linus is on 4.9-rc7 so you're saying this would probably go into 4.11?
>
> regards,
> dan carpenter
>
