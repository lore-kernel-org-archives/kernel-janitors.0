From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 12 Aug 2017 21:28:16 +0000
Subject: Re: [PATCH 0/3] ALSA: rme96: Adjustments for six function implementations
Message-Id: <s5hh8xcwk5r.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b38ee17e-f2ed-2bd7-6bc1-524ab4b3eb02@users.sourceforge.net>
In-Reply-To: <b38ee17e-f2ed-2bd7-6bc1-524ab4b3eb02@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Julia Lawall <Julia.Lawall@lip6.fr>

On Sat, 12 Aug 2017 15:38:01 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 12 Aug 2017 15:36:54 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (3):
>   Delete two error messages for a failed memory allocation in snd_rme96_probe()
>   Use common error handling code in snd_rme96_probe()
>   Adjust five checks for null pointers

Applied all three patches, thanks.


Takashi
