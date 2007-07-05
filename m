From: Rene Herman <rene.herman@gmail.com>
Date: Thu, 05 Jul 2007 12:54:03 +0000
Subject: Re: [KJ] spam on kj ml
Message-Id: <468CE9EB.6020200@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <468CB2D8.9060904@bfs.de>
In-Reply-To: <468CB2D8.9060904@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 07/05/2007 02:11 PM, pradeep singh wrote:

>> > 2. Stop non subscribers from sending any mail to the list.
>>
>> No, do not do that. As said, just make it _moderated_ for 
>> non-subscribers. On occasion a thread may want to be crossposted to
>> linux-kernel and the subscribers there expect open access. Don't trade
>> spam annoyances for spam-warring annoyances. As a moderator, you can
>> elect to add From addresses to a approves/denies database or, better,
>> just accept them manually and possibly send the poster a private
>> message asking to subscribe.
>>
> Fair enough, let non-subscribers post then.
> Why even send a private message to subscribe then i guess?

Moderation introduces an inevitable delay even if with enough moderators it 
wouldn't be a large delay. Still an undesirable thing though so if I see 
from a moderated message that it's destined specifically for the alsa-devel 
list and is not one where it's just CCed as "catch-all sound thing CC" I 
tend to reply to the poster privately informing of the subscribtion policy 
and pointing out the delay. Ofcourse, fewer non-subscriber posts also means 
fewer things to moderate...

>> As said, you can hand moderator privileges out as the only administrative
>> list power, so just gather up a few volunteers. There should be enough on
>> the kernel janitors list I believe (I'm not).
> 
> This can be tricky IMHO. How you identify whom to give priviliges. What
> are the rules? etc etc 

You ask who wants to and would like the more active members to volunteer. 
The rules would be "if (spam) reject(); else accept();" where "spam" is 
pretty tightly defined. Remember -- the moderators would've been put in 
place just as human spam filters, not as topic police so the rules are 
pretty darn simple.

>> > 4. Have a spamassasin server up[this may be not easy] and keep it 
>> updated.
>>
>> Ofcourse, a first run through a spam-filter where everything that is 
>> marked as spam with a high enough (define yourself..) probability
>> doesn't even end up in the moderation queue is good.
>>
>> You'd be surprised how easy it is to spot the remaining spam for a human
>> from the subjects alone -- ie, moderators can deal with the remaining 
>> stuff  with ease.
> 
> Same point applies here.
> identification of the moderators and subswquent chaos like, what if X
> moderator remains inactive for a long period...
> all boils down to some rules. right?

Rule 1 -- trust people to get it right unless proven otherwise. I believe 
you overestimate the amount of trouble non-subscriber moderation would be. 
kernel-janitors sees less traffic than alsa-devel, and  _much_ less from 
non-subscribers (it's not a topic list to CC wen you're not doing specific 
janitor stuff) and if some of the more active articipants here would 
volunteer I believe things should readily work themselves out.

List-owner has to ask and set things up...

Rene.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
