From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 12 Aug 2017 21:33:41 +0000
Subject: Re: [PATCH] ALSA: mixart: Delete an error message for a failed memory allocation in snd_mixart_creat
Message-Id: <s5hbmnkwjwq.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b5d2cdc9-a2d7-a264-7802-99217cee65c4@users.sourceforge.net>
In-Reply-To: <b5d2cdc9-a2d7-a264-7802-99217cee65c4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Julia Lawall <Julia.Lawall@lip6.fr>, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, 12 Aug 2017 18:51:51 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 12 Aug 2017 18:45:42 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
