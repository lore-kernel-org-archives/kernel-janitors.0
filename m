From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 12 Aug 2017 21:34:15 +0000
Subject: Re: [PATCH] ALSA: ca0106: Delete an error message for a failed memory allocation in snd_ca0106_pcm_o
Message-Id: <s5ha834wjvs.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <73511244-b12e-9756-6a46-89d9c56c75dc@users.sourceforge.net>
In-Reply-To: <73511244-b12e-9756-6a46-89d9c56c75dc@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Julia Lawall <Julia.Lawall@lip6.fr>, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, 12 Aug 2017 19:15:58 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 12 Aug 2017 19:09:23 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
