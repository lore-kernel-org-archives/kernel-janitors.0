From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 21 Nov 2008 15:34:03 +0000
Subject: Re: [PATCH] ALSA: hda - fix sparse warning
Message-Id: <s5hfxllks9g.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811210703h3b63273et77acddfc0e6612e8@mail.gmail.com>
In-Reply-To: <154e089b0811210703h3b63273et77acddfc0e6612e8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

At Fri, 21 Nov 2008 16:03:24 +0100,
Hannes Eder wrote:
> 
> Fix the following sparse warning:
> 
> sound/pci/hda/patch_nvhdmi.c:161:25: warning: symbol
> 'snd_hda_preset_nvhdmi' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
>  sound/pci/hda/patch_nvhdmi.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Thanks, applied now.


Takashi
