From: Randy Dunlap <rdunlap@xenotime.net>
Date: Fri, 22 Jul 2011 18:21:24 +0000
Subject: Re: Question about submitting patches
Message-Id: <20110722112124.12f379d1.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAB2gnbW=umjGrVH6Bi6+hoUN6w1J0ZzefMhSueSicz6NKGE=xQ@mail.gmail.com>
In-Reply-To: <CAB2gnbW=umjGrVH6Bi6+hoUN6w1J0ZzefMhSueSicz6NKGE=xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 22 Jul 2011 12:20:20 -0600 Noah Watkins wrote:

> 
> On Jul 22, 2011, at 12:14 PM, Randy Dunlap wrote:
> 
> > Do those variable names currently cause a problem?
> > They are not static, but they also are not exported symbols [EXPORT_SYMBOL()].
> 
> They are not exported and there are not currently warnings, but it struck me
> as inappropriate to have a device specific non-static variable named "devices".
> I guess it really might be better to fix later if an actual conflict arises.

In general the patches are good -- the variable names are indeed too generic.

> Thanks a lot for the note about maintainer reply behavior, I was a little anxious
> about sending, but now I'll wait to see what happens.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
