From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 23 Aug 2017 08:38:07 +0000
Subject: Re: [PATCH 6/6] ALSA: timer: Adjust 13 checks for null pointers
Message-Id: <s5ha82qr85s.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b8c9e41b-a47e-1d99-3d1a-5d39772e4b54@users.sourceforge.net>
        <s5h378isw2d.wl-tiwai@suse.de>
        <800d7aa6-d8f2-cbf5-caaa-7e4006976e68@users.sourceforge.net>
        <6ce55a29-f414-fec4-0a5e-2ddd54e40bed@users.sourceforge.net>
In-Reply-To: <6ce55a29-f414-fec4-0a5e-2ddd54e40bed@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Ingo Molnar <mingo@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Vegard Nossum <vegard.nossum@oracle.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 23 Aug 2017 10:29:52 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 23 Aug 2017 09:54:42 +0200
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

I won't apply this either for the same reason as patch 3.


thanks,

Takashi
