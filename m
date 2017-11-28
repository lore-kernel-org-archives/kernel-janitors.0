From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 28 Nov 2017 09:50:21 +0000
Subject: Re: ALSA: nm256: Fine-tuning for three function implementations
Message-Id: <1547a4c2-5b70-e3a3-b482-d28c538e615c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d98a2685-ddf9-1cba-839a-d12c5ff8d3ba@users.sourceforge.net>
 <s5hefoy16xg.wl-tiwai@suse.de>
 <dfa99045-f213-3dad-b1f4-2e90eb38ddbd@users.sourceforge.net>
 <s5h7euq9hqt.wl-tiwai@suse.de>
 <24f8c777-1eb4-e7e7-9371-79f32700c9dc@users.sourceforge.net>
 <s5hbmjmluba.wl-tiwai@suse.de>
 <2cbef557-5f89-c630-e108-14ef2ce6b41a@users.sourceforge.net>
 <s5h4lpelqfm.wl-tiwai@suse.de>
In-Reply-To: <s5h4lpelqfm.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Cc: Arvind Yadav <arvind.yadav.cs@gmail.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>> There can be additional means be used to reduce the probability
>> of undesired side effects.
> 
> Irrelevant,

I got an other opinion here.


> it doesn't fix a bug,

Did I suggest to correct a coding style “bug”?


> nor dramatic improvement.

I agree that the change could be small only for this software module alone.
I guess that we discuss not only change patterns for this one
but also other affected modules here (besides a concrete example).
The result summary might be more significant overall.


>>> It must be "almost perfect" for such a code refactoring.
>>
>> Can you get the impression that the shown transformation patterns were correctly
>> applied for the source file “sound/pci/nm256/nm256.c”?
> 
> Impression doesn't matter.

It seems then that you can not get the kind of information you might be looking for
at the moment from me (alone).


> The question is whether it's 100% correct or not in such a case.

Would any other source code reviewers like to provide a corresponding acknowledgement
for concrete changes?


>> Are there any more software developers and code reviewers available
>> who would like to point another programming mistake out for this Linux module?
> 
> If you have find such, then it's fine, you can get your patches
> reviewed and more assured.

I hope that mailing list readers could offer something.


> But in the current situation, no one else is interested in it,
> and that's going to nowhere.

Did this software module become “too old”?


> The *really* trivial ones were applied.  The rest are not.

Can higher level transformation patterns become easier to accept
by any other means?


>> Do you need any more information to see and eventually accept the sense again?
> 
> No.  This kind of code refactoring has no more information.
> It's a "trivial" change, after all.

Would you like to distinguish the possible update steps better to avoid
further confusion around “triviality”?


>> Are you using a continuous integration system?
> 
> Not really in my side.  But there are others doing that.

How much does the omission of such an useful development tool
influence your concerns?

Would you like to improve the software situation in any ways there?

Regards,
Markus
