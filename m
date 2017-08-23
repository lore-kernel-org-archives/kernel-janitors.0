From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 23 Aug 2017 08:36:56 +0000
Subject: Re: [PATCH 2/6] ALSA: pcm: Adjust nine function calls together with a variable assignment
Message-Id: <s5hd17mr87r.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b8c9e41b-a47e-1d99-3d1a-5d39772e4b54@users.sourceforge.net>
        <s5h378isw2d.wl-tiwai@suse.de>
        <800d7aa6-d8f2-cbf5-caaa-7e4006976e68@users.sourceforge.net>
        <9fcdbe5a-b17a-dfb8-f4af-a1261da93a38@users.sourceforge.net>
In-Reply-To: <9fcdbe5a-b17a-dfb8-f4af-a1261da93a38@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Ingo Molnar <mingo@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Vegard Nossum <vegard.nossum@oracle.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 23 Aug 2017 10:24:34 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 23 Aug 2017 09:20:29 +0200
> 
> The script "checkpatch.pl" pointed information out like the following.
> 
> ERROR: do not use assignment in if condition
> 
> Thus fix the affected source code places.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
