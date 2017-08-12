From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 12 Aug 2017 21:36:29 +0000
Subject: Re: [PATCH 0/3] ALSA: mpu401: Adjustments for three function implementations
Message-Id: <s5h7ey8wjs2.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47947226-bd09-5d15-c0d2-a9f4a659e1b4@users.sourceforge.net>
In-Reply-To: <47947226-bd09-5d15-c0d2-a9f4a659e1b4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, 12 Aug 2017 21:10:12 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 12 Aug 2017 21:05:21 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (3):
>   Delete an error message for a failed memory allocation in snd_mpu401_uart_new()
>   Use common error handling code in snd_mpu401_uart_new()
>   Adjust four checks for null pointers

Applied all three patches, thanks.


Takashi
