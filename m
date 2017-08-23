From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 23 Aug 2017 13:52:59 +0000
Subject: Re: [PATCH v2] ALSA: Fireface: Use common error handling code in pcm_open()
Message-Id: <s5ha82qmlvo.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05f76303-7370-ea37-20c2-116c04b850db@users.sourceforge.net>
        <bd318065-7a0b-efd5-8ce0-0dffe37b92cf@sakamocchi.jp>
        <05c137e8-e417-162b-c588-f5fc22be5ed6@users.sourceforge.net>
In-Reply-To: <05c137e8-e417-162b-c588-f5fc22be5ed6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 23 Aug 2017 14:54:32 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 23 Aug 2017 14:45:20 +0200
> 
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> 
> v2:
> It seems that a source code adjustment was requested by Takashi Sakamoto
> for another if branch.

Applied, thanks.


Takashi
