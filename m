From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 12 Sep 2017 07:23:54 +0000
Subject: Re: [PATCH] ALSA: FireWire-MOTU: Use common error handling code in snd_motu_stream_start_duplex()
Message-Id: <s5hwp54nzw5.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9f50358a-0357-82ec-ee38-deae60eb53e9@users.sourceforge.net>
In-Reply-To: <9f50358a-0357-82ec-ee38-deae60eb53e9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 06 Sep 2017 13:35:51 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 6 Sep 2017 13:30:14 +0200
> 
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
