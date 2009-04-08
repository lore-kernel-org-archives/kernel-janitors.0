From: Ingo Molnar <mingo@elte.hu>
Date: Wed, 08 Apr 2009 15:16:44 +0000
Subject: Re: [PATCH 54/56] x86: Remove void casts
Message-Id: <20090408151644.GQ12931@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <36ca99e90904080518qf81b483h6ed2bc9752ee0d1e@mail.gmail.com> <49DCAE97.8040602@fastmail.fm> <20090408140637.GC12931@elte.hu> <49DCB140.7000603@fastmail.fm> <20090408144055.GH12931@elte.hu> <49DCB8C5.4090108@fastmail.fm> <20090408144842.GK12931@elte.hu> <49DCBA61.8060507@fastmail.fm> <20090408145715.GO12931@elte.hu> <49DCBBDF.4040603@fastmail.fm>
In-Reply-To: <49DCBBDF.4040603@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Stone <jwjstone@fastmail.fm>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bert Wesarg <bert.wesarg@googlemail.com>, linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org


* Jack Stone <jwjstone@fastmail.fm> wrote:

> Ingo Molnar wrote:
>
> > Since you do many such patches it might make sense to script up 
> > a "who maintains what" kind of script - and share that script 
> > with lkml.
> >
> > I have this silly little script:
> >
> >   git log $@ | grep Signed-off-by: |
> >    cut -d: -f2 | cut -d\< -f1 |
> >     sort | uniq -c | sort -n
> >
> > To find out any recent parties that touches a particular file. 
> > But it would be nice to somehow automate the pickup of 
> > mailing-list addresses from MAINTAINERS for example. We've 
> > literally got hundreds of email lists there.
> >
> > It is not trivial to do though :-)
>
> It would be useful. The main problem is working out what files 
> belong to what MAINTAINERS entries.
> 
> I'll see what I can cook up.

In theory we could put regex patterns into MAINTAINERS. Something 
like this:

LOCKDEP AND LOCKSTAT
P:	Peter Zijlstra
M:	peterz@infradead.org
P:	Ingo Molnar
M:	mingo@redhat.com
L:	linux-kernel@vger.kernel.org
T:	git://git.kernel.org/pub/scm/linux/kernel/git/peterz/linux-2.6-lockdep.git
F:	kernel/lock*
F:	include/linux/lockdep.h
S:	Maintained

Note: there are files that fall under multiple maintainers so this 
wouldnt be a 'precise' thing - but it would sure be useful.

( There's also other details like subdirectories within a larger 
  hiearchy and there being overlap between problems. Sometimes they 
  are sub-maintained, sometimes they are exclusive so pure glob
  patterns are probably not enough. )

If this concept looks good to you ... i'd suggest that before you do 
a large patch against MAINTAINERS mapping all the maintainer 
domains, could you just do it for a few cases and send an RFC patch 
to lkml?

If there's a general upstream buy-in and a there's a 
scripts/list-maintainers.sh script that takes advantage of it then 
all this would be rather useful. (and i've Cc:-ed Andrew and Linus - 
if this is to be shot down due to fundamental objections then better 
do it at the early stages ;-)

Plus checkpatch could be extended to check whether the Cc: list in a 
patch properly matches the patterns in MAINTAINERS.

If done propery this would save us from quite a few mechanic "hm, 
who maintains _that_ file??" searches and it would also save 
maintainers from quite a few "hm, who queued up _that_ crap without 
Cc:-ing me??" moments.

Thanks,

	Ingo
