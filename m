From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 28 Nov 2017 07:27:04 +0000
Subject: Re: [PATCH] ALSA: gus: Delete an error message for a failed memory allocation in snd_gf1_dma_transfe
Message-Id: <s5hefoilv7b.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5b6cc700-01d2-92ea-c9b4-75e8a93a05bf@users.sourceforge.net>
In-Reply-To: <5b6cc700-01d2-92ea-c9b4-75e8a93a05bf@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 22 Nov 2017 17:47:14 +0100,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 22 Nov 2017 17:43:25 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
