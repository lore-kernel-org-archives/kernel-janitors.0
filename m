From: Ondrej Zary <linux@rainbow-software.org>
Date: Tue, 28 Nov 2017 12:33:14 +0000
Subject: Re: [alsa-devel] ALSA: nm256: Fine-tuning for three function implementations
Message-Id: <201711281333.15131.linux@rainbow-software.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d98a2685-ddf9-1cba-839a-d12c5ff8d3ba@users.sourceforge.net> <s5hbmjmluba.wl-tiwai@suse.de> <2cbef557-5f89-c630-e108-14ef2ce6b41a@users.sourceforge.net>
In-Reply-To: <2cbef557-5f89-c630-e108-14ef2ce6b41a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel@alsa-project.org
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Takashi Iwai <tiwai@suse.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tuesday 28 November 2017, SF Markus Elfring wrote:
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
> >>> and can be wrong
> >>
> >> Such a possibility remains as usual.
> >
> > "As usual" doesn't suffice.
>
> There can be additional means be used to reduce the probability
> of undesired side effects.
>
> > It must be "almost perfect" for such a code refactoring.
>
> Can you get the impression that the shown transformation patterns were
> correctly applied for the source file “sound/pci/nm256/nm256.c”?

Have you tested the driver? Probably not. Please don't "improve" working 
drivers unless you have the hardware to test your changes. Patches like this 
are known to cause regressions. If the hardware is rare (like the NM256), the 
regression can hit years later when someone with such HW upgrades distro 
(e.g. Debian stable).

-- 
Ondrej Zary
