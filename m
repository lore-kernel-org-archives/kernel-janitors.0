From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 23 Jan 2018 15:14:19 +0000
Subject: Re: mfd/viperboard: Delete an error message for a failed memory allocation in vprbrd_probe()
Message-Id: <20180123151419.prwq62c7gpsnpbx3@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9c50fe6a-21cc-e49d-1b10-5d2457ed4e2a@users.sourceforge.net>
 <20180123125851.ysypf7375sjlgsc6@dell>
 <20180123130130.powyttapsx3djawx@dell>
 <f8900a77-eea4-d244-37e1-44d22484f826@users.sourceforge.net>
In-Reply-To: <f8900a77-eea4-d244-37e1-44d22484f826@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Lars =?iso-8859-1?Q?P=F6schel?= <poeschel@lemonage.de>, Samuel Ortiz <sameo@linux.intel.com>

On Tue, 23 Jan 2018, SF Markus Elfring wrote:

> >> Can you please fix-up all of the patches I've NACKed and collect them
> >> up with all the other MFD patches you currently have on the list and
> >> send them as a single set please?
> >>
> >> Reviewing them one after another, is taking a lot of time and causing
> >> my a great deal of pain.
> 
> There will be review efforts needed as usual. They might be more noticeable
> in this case just because I sent some update suggestions also for software
> modules from the directory “drivers/mfd”.

"It's not you, it's me!"

My preferred mailer (Mutt) re-orders replied-to mails by putting them
to the top of my Inbox.  At which point I have to re-navigate down to
the next patch to review.  This is fine for most submissions, but you
have fired ~30, mostly individual patches at me.  Most of which could
realistically be squashed into ~5 patches (if I was feeling mean).

The choice is yours though, either squash them into patches dealing
with the same type of fix-up or merely send all of the un-applied
patches again as a single set, so I can deal with them in a sane
manner.

> >> I am marking all of your other MFD submissions as 'read and reviewed'
> >> and will not be processing any more until the are all contained in a
> >> single, threaded set.
> >>
> >> Thank you!
> > 
> > Also, could you change the subject lines, so they match that expected
> > by the subsystem.
> 
> Do you request a resent for almost all changes from this patch series here?

I'm not sure I can decipher this.

I'd like you to do the following please:

  - Pull all un-applied MFD patches into a single branch based on Mainline
  - Add any Reviewed-by/Acked-by's you've received
  - Fix the subject lines on all of the patches 's///: /'
  - Resubmit as one single threaded patch-set

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
