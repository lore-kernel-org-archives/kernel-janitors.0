From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 15 Aug 2017 06:23:21 +0000
Subject: Re: [PATCH] ALSA: rme9652: Use common error handling code in two functions
Message-Id: <s5h4lt9jqna.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fefeea4b-68a2-5b4c-2cfc-cb05383b5474@users.sourceforge.net>
In-Reply-To: <fefeea4b-68a2-5b4c-2cfc-cb05383b5474@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Julia Lawall <Julia.Lawall@lip6.fr>, Jaroslav Kysela <perex@perex.cz>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 14 Aug 2017 22:10:10 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 14 Aug 2017 22:00:40 +0200
> 
> Add a jump target so that a bit of exception handling can be better reused
> in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
