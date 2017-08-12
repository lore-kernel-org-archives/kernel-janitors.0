From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 12 Aug 2017 21:34:55 +0000
Subject: Re: [PATCH] ALSA: opl3: Delete an error message for a failed memory allocation in snd_opl3_new()
Message-Id: <s5h8tiowjuo.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5991f20d-dbad-a916-76be-375ade7de737@users.sourceforge.net>
In-Reply-To: <5991f20d-dbad-a916-76be-375ade7de737@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Fabian Frederick <fabf@skynet.be>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, 12 Aug 2017 20:02:14 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 12 Aug 2017 19:54:20 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
