From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 12 Aug 2017 21:33:09 +0000
Subject: Re: [PATCH] ALSA: pcxhr: Delete an error message for a failed memory allocation in pcxhr_create()
Message-Id: <s5hd180wjxm.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f30e314b-4666-2880-8051-976c631b3718@users.sourceforge.net>
In-Reply-To: <f30e314b-4666-2880-8051-976c631b3718@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Julia Lawall <Julia.Lawall@lip6.fr>, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, 12 Aug 2017 18:28:06 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 12 Aug 2017 18:14:54 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
