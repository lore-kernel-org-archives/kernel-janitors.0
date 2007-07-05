From: Jaco Kroon <jaco@kroon.co.za>
Date: Thu, 05 Jul 2007 14:08:34 +0000
Subject: Re: [KJ] spam on kj ml
Message-Id: <468CFB62.4020900@kroon.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
References: <468CB2D8.9060904@bfs.de>
In-Reply-To: <468CB2D8.9060904@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Rene Herman wrote:
> On 07/05/2007 02:11 PM, pradeep singh wrote:
> 
>>> > 2. Stop non subscribers from sending any mail to the list.
>>>
>>> No, do not do that. As said, just make it _moderated_ for 
>>> non-subscribers. On occasion a thread may want to be crossposted to
>>> linux-kernel and the subscribers there expect open access. Don't trade
>>> spam annoyances for spam-warring annoyances. As a moderator, you can
>>> elect to add From addresses to a approves/denies database or, better,
>>> just accept them manually and possibly send the poster a private
>>> message asking to subscribe.
>>>
>> Fair enough, let non-subscribers post then.
>> Why even send a private message to subscribe then i guess?
> 
> Moderation introduces an inevitable delay even if with enough moderators 
> it wouldn't be a large delay. Still an undesirable thing though so if I 
> see from a moderated message that it's destined specifically for the 
> alsa-devel list and is not one where it's just CCed as "catch-all sound 
> thing CC" I tend to reply to the poster privately informing of the 
> subscribtion policy and pointing out the delay. Ofcourse, fewer 
> non-subscriber posts also means fewer things to moderate...

Yes, it introduces a delay.  So here are a few further suggestions:

use dns blacklists to filter out any IP ranges within a DUL.  This 
elimates a _lot_ of spam.  Also, there are known "bad" servers out 
there, DNS BLs can also help filtering these out.  These checks are 
pretty cheap, and it's accuracy is just about perfect (most of the 
time).  I personally add a server to a local allow list periodically 
when I find that ISPs get blacklisted, this is usually done upon request 
when an email is sent to postmaster@ for the domain in question and I've 
talked to the ISP to make sure that they shouldn't be on the list. 
Users complains to their ISPs pretty quickly when mail starts bouncing.

Perform sender-callout verifications.  This filters out a _lot_ of SPAM.

Block bounces from going to the list (A lot of spam seem to have a NULL 
return path but then puts an address in the From: header).  Bounces have 
no reason to go to the list as the list return path has a -bounces appended.

Checks on the email addresses listed in headers like To: and From: to 
ensure they are formatted correctly.  This also seems to be highly 
effective, and not that costly.

Greylisting?  Annoying, but it mostly helps to filter out many of the 
"drop and run" spam bots (although, these generally tend to only help on 
the DUL ranges anyway).

If after that we still get too much spam, then set up spamassassin as 
well, get some extra rules from SARE, my SA seems to function well with 
the reject required score set to 7, in the six months where I trialled 
it I didn't get many legit messages going over that, and those that did 
I really didn't want to receive anyway (receive and forward type spam). 
  And were always HTML-based mail (which we are against anyway).

Note, none of these checks rely on spamassassin.  Spamassassin, whilst 
pretty effective is a resource consumer like few others things I've 
worked with.  Try to filter out as much stuff as possible _before_ 
passing messages to spamassassin.

>>> As said, you can hand moderator privileges out as the only 
>>> administrative
>>> list power, so just gather up a few volunteers. There should be 
>>> enough on
>>> the kernel janitors list I believe (I'm not).
>>
>> This can be tricky IMHO. How you identify whom to give priviliges. What
>> are the rules? etc etc 
> 
> You ask who wants to and would like the more active members to 
> volunteer. The rules would be "if (spam) reject(); else accept();" where 
> "spam" is pretty tightly defined. Remember -- the moderators would've 
> been put in place just as human spam filters, not as topic police so the 
> rules are pretty darn simple.

I would keep this as a last step.  Or simply put a "human check" in 
place, ie, if this person hasn't sent mail to the list before, just send 
him/her an email, asking to respond to a link, after clicking this link, 
the email is allowed to pass through.  Not sure if either ezlm, 
majordomo or mailman supports this out of the box though.

>>> > 4. Have a spamassasin server up[this may be not easy] and keep it 
>>> updated.

Yes, sa-update is not that difficult to put in a cron job on a daily 
basis, and to just restart spamd when it's done.

>>> Ofcourse, a first run through a spam-filter where everything that is 
>>> marked as spam with a high enough (define yourself..) probability
>>> doesn't even end up in the moderation queue is good.
>>>
>>> You'd be surprised how easy it is to spot the remaining spam for a human
>>> from the subjects alone -- ie, moderators can deal with the remaining 
>>> stuff  with ease.
>>
>> Same point applies here.
>> identification of the moderators and subswquent chaos like, what if X
>> moderator remains inactive for a long period...
>> all boils down to some rules. right?
> 
> Rule 1 -- trust people to get it right unless proven otherwise. I 
> believe you overestimate the amount of trouble non-subscriber moderation 
> would be. kernel-janitors sees less traffic than alsa-devel, and  _much_ 
> less from non-subscribers (it's not a topic list to CC wen you're not 
> doing specific janitor stuff) and if some of the more active articipants 
> here would volunteer I believe things should readily work themselves out.

I agree, however, stay away from human intervention as far as possible. 
  I used to do this for our local LUG ... it eventually becomes a full 
time job in it's own right.  Also, even with notifications to the 
moderators, what happens if none of them looks for three days?  No, 
imho, rather just filter as much of the crap automatically as possible, 
and let the rest come.  It should be much reduced, if it's still too 
much, then we can take further action.

Jaco
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
