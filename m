From: Rene Herman <rene.herman@gmail.com>
Date: Thu, 05 Jul 2007 11:13:05 +0000
Subject: Re: [KJ] spam on kj ml
Message-Id: <468CD241.8000304@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <468CB2D8.9060904@bfs.de>
In-Reply-To: <468CB2D8.9060904@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 07/05/2007 12:08 PM, pradeep singh wrote:

> On 7/5/07, Rene Herman <rene.herman@gmail.com> wrote:

>> If the list isn't moving to somewhere like vger -- alsa-devel recently
>> became a moderated list for non-subscribers and I guess you guys could do
>> the same. The moderation (again, only for non-subscribers) doesn't need a
>> huge amount of time and moderator roles can be handed out to anyone, not
>> just list owners or anything like that. Works via web-interface and
>> (optionally, I suppose) via email notifications...
> 
> ok can we frame some consensus on how subscribers should be validated the
> frist time??
> 
> My suggestions :-
> 
> 1. Include a captcha kind of thing while registering, may be like how 
> much is 34+ 34 = or something like this.. It would be even easy to 
> implement guess.

This is not necesary. alsa-devel hasn't seen any spammers subscribe the last 
few months. If it turns out at some point spammers are doing so that's early 
enough.

> 2. Stop non subscribers from sending any mail to the list.

No, do not do that. As said, just make it _moderated_ for non-subscribers. 
On occasion a thread may want to be crossposted to linux-kernel and the 
subscribers there expect open access. Don't trade spam annoyances for 
spam-warring annoyances. As a moderator, you can elect to add From addresses 
to a approves/denies database or, better, just accept them manually and 
possibly send the poster a private message asking to subscribe.

As said, you can hand moderator privileges out as the only administrative 
list power, so just gather up a few volunteers. There should be enough on 
the kernel janitors list I believe (I'm not).

> 3. Anyone who sends HTML is removed and need to resubscribe.

No, do not do that. You may want to let through a well-meaning post from a 
newbie and then just give him or her the, preferably friendly, _advice_ on 
how to post. This can even be a per-case moderator decision if you let HTML 
mail end up in the moderation queue...

> 4. Have a spamassasin server up[this may be not easy] and keep it updated.

Ofcourse, a first run through a spam-filter where everything that is marked 
as spam with a high enough (define yourself..) probability doesn't even end 
up in the moderation queue is good.

You'd be surprised how easy it is to spot the remaining spam for a human 
from the subjects alone -- ie, moderators can deal with the remaining stuff 
with ease.

> 5. we all re-register using these rules to dafeguard the KJ list.

No need for anyone to resubscribe (unless owners here would like to cleanup 
the database and filter dead subscribers while they're at it)

Rene.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
