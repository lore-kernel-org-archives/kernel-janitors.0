From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 22 Aug 2017 17:43:50 +0000
Subject: Re: [PATCH] ALSA: ctxfi: Use common error handling code in two functions
Message-Id: <s5htw0zsdk9.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6293f7ce-a3c7-ace8-cab4-26d09f4e0c91@users.sourceforge.net>
In-Reply-To: <6293f7ce-a3c7-ace8-cab4-26d09f4e0c91@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 22 Aug 2017 18:50:16 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 22 Aug 2017 18:43:42 +0200
> 
> Add jump targets so that a bit of exception handling can be better reused
> at the end of these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
