From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 23 Aug 2017 08:35:00 +0000
Subject: Re: [PATCH 3/6] ALSA: pcm: Adjust 11 checks for null pointers
Message-Id: <s5hfucir8az.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b8c9e41b-a47e-1d99-3d1a-5d39772e4b54@users.sourceforge.net>
        <s5h378isw2d.wl-tiwai@suse.de>
        <800d7aa6-d8f2-cbf5-caaa-7e4006976e68@users.sourceforge.net>
        <fc79090d-7ed8-9083-4726-29769e0ef8d8@users.sourceforge.net>
In-Reply-To: <fc79090d-7ed8-9083-4726-29769e0ef8d8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Ingo Molnar <mingo@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Vegard Nossum <vegard.nossum@oracle.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 23 Aug 2017 10:25:49 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 23 Aug 2017 09:28:00 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The script “checkpatch.pl” pointed information out like the following.
> 
> Comparison to NULL could be written …
> 
> Thus fix the affected source code places.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Converting only these alone doesn't give any big merit.  Another patch
in the series fixed the style if ((err = xxx)), so it's fine, though.

checkpatch is no bible, after all.


thanks,

Takashi
