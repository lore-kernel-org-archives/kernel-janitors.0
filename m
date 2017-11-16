From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 16 Nov 2017 17:15:23 +0000
Subject: Re: [PATCH 0/2] ALSA: nm256: Fine-tuning for three function implementations
Message-Id: <s5hefoy16xg.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d98a2685-ddf9-1cba-839a-d12c5ff8d3ba@users.sourceforge.net>
In-Reply-To: <d98a2685-ddf9-1cba-839a-d12c5ff8d3ba@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 16 Nov 2017 18:05:27 +0100,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 16 Nov 2017 18:00:18 +0100
> 
> Two update suggestions were taken into account
> from static source code analysis.

Markus, I'd apply this kind of patches only when they are really
tested on the hardware, or they were converted systematically by a
script like spatch.  The reason is that you might break something (and
you already broke things in the past).  The merit by such a patch is
negligible in comparison of the risk of breakage.  These codes aren't
too bad without fixing, after all; everyone can read it pretty well as
is.

If these patches were tested on a real hardware, or at least on VM, so
that you can show that they don't break anything, I'll happily apply
them for the next (4.16) kernel.  In that case, please show that in 
the changelog explicitly.

Or, if you're really working on other real changes (no cosmetic coding
style fixes nor the code shuffling, but fixing a real bug) *and* such
a cleanup is mandatory as preliminary, it can be accepted, too.


thanks,

Takashi
