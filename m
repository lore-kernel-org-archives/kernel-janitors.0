From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 28 Nov 2017 09:10:05 +0000
Subject: Re: ALSA: nm256: Fine-tuning for three function implementations
Message-Id: <s5h4lpelqfm.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d98a2685-ddf9-1cba-839a-d12c5ff8d3ba@users.sourceforge.net>
 <s5hefoy16xg.wl-tiwai@suse.de>
 <dfa99045-f213-3dad-b1f4-2e90eb38ddbd@users.sourceforge.net>
 <s5h7euq9hqt.wl-tiwai@suse.de>
 <24f8c777-1eb4-e7e7-9371-79f32700c9dc@users.sourceforge.net>
 <s5hbmjmluba.wl-tiwai@suse.de>
 <2cbef557-5f89-c630-e108-14ef2ce6b41a@users.sourceforge.net>
In-Reply-To: <2cbef557-5f89-c630-e108-14ef2ce6b41a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Arvind Yadav <arvind.yadav.cs@gmail.com>

On Tue, 28 Nov 2017 09:19:48 +0100,
SF Markus Elfring wrote:
> 
> >>>> There is a general source code transformation pattern involved.
> >>>> So I find that it is systematic.
> >>>>
> >>>> But I did not dare to develop a script variant for the semantic patch
> >>>> language (Coccinelle software) which can handle all special use cases
> >>>> as a few of them are already demonstrated in this tiny patch series.
> >>>
> >>> Then you're doing everything by hands,
> >>
> >> I am navigating through possible changes around the pattern
> >> “Use common error handling code” mostly manually so far.
> >>
> >>
> >>> and can be wrong
> >>
> >> Such a possibility remains as usual.
> > 
> > "As usual" doesn't suffice.
> 
> There can be additional means be used to reduce the probability
> of undesired side effects.

Irrelevant, it doesn't fix a bug, nor dramatic improvement.

> > It must be "almost perfect" for such a code refactoring.
> 
> Can you get the impression that the shown transformation patterns were correctly
> applied for the source file “sound/pci/nm256/nm256.c”?

Impression doesn't matter.  The question is whether it's 100% correct
or not in such a case.

> > The damage by a overseen mistake is much higher than the merit by such a patch.
> 
> Are there any more software developers and code reviewers available
> who would like to point another programming mistake out for this Linux module?

If you have find such, then it's fine, you can get your patches
reviewed and more assured.  But in the current situation, no one else
is interested in it, and that's going to nowhere.

> > If the patch is about fixing a bug, it's a different story.
> 
> How do “deviations” from the coding style and the evolution of object code size
> fit to this view here?

Again, it's no fix for a bug.

> > Or it's about a really trivial change (e.g. your sizeof() conversion
> > patches), I can check and apply easily.
> 
> My update selection can contain also trivial adjustments.

The *really* trivial ones were applied.  The rest are not.

> > But for other changes with more lines, it makes little sense.
> 
> Do you need any more information to see and eventually accept the sense again?

No.  This kind of code refactoring has no more information.
It's a "trivial" change, after all.

> > Again, the risk of breakage increases while the merit is negligible.
> 
> We disagree about corresponding benefits at the moment.
> Would any other contributors comment the situation a bit more?

I hear openly.

> >>> -- that's the heart of the problem.
> >>
> >> There might be related opportunities for further improvements.
> >> Do you trust adjustments from an evolving tool more than
> >> my concrete contributions?
> > 
> > Yes, loudly.
> 
> I noticed that the development status of tools which you might find nice
> at the moment can be also questionable.

It depends on the result.

> > I stop at this point, as the rest is simply a repeat from the previous mail.
> 
> Are you using a continuous integration system?

Not really in my side.  But there are others doing that.


Takashi
