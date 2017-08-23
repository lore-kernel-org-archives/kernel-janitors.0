From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 23 Aug 2017 10:54:30 +0000
Subject: Re: [PATCH] ALSA: USB-MIDI: Use common error handling code in __snd_usbmidi_create()
Message-Id: <s5hefs27dw9.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <328d3b62-2113-e51a-5d66-79d515de3179@users.sourceforge.net>
In-Reply-To: <328d3b62-2113-e51a-5d66-79d515de3179@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>, LKML <linux-kernel@vger.kernel.org>

On Wed, 23 Aug 2017 12:25:50 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 23 Aug 2017 12:20:07 +0200
> 
> Add jump targets so that a bit of exception handling can be better reused
> at the end of this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
