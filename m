From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 23 Aug 2017 08:39:45 +0000
Subject: Re: [PATCH 4/6] ALSA: timer: Use common error handling code in alsa_timer_init()
Message-Id: <s5h8tiar832.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b8c9e41b-a47e-1d99-3d1a-5d39772e4b54@users.sourceforge.net>
 <s5h378isw2d.wl-tiwai@suse.de>
 <800d7aa6-d8f2-cbf5-caaa-7e4006976e68@users.sourceforge.net>
 <f390776b-343f-3787-8520-0754ddfe8154@users.sourceforge.net>
In-Reply-To: <f390776b-343f-3787-8520-0754ddfe8154@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Vegard Nossum <vegard.nossum@oracle.com>, Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Ingo Molnar <mingo@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>

On Wed, 23 Aug 2017 10:27:14 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 23 Aug 2017 09:30:41 +0200
> 
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
