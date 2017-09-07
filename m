From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 07 Sep 2017 08:28:55 +0000
Subject: Re: [PATCH 2/2] ALSA: usx2y: Use common error handling code in submit_urbs()
Message-Id: <s5hbmmmkj3s.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6743b977-4293-42d2-6c1b-cb83b687bd66@users.sourceforge.net>
        <aa96b0c6-09cf-16c6-91e2-7fb490b815f3@users.sourceforge.net>
In-Reply-To: <aa96b0c6-09cf-16c6-91e2-7fb490b815f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Dave Jiang <dave.jiang@intel.com>, Johan Hovold <johan@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 06 Sep 2017 15:17:38 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 6 Sep 2017 15:00:08 +0200
> 
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
