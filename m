From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 07 Sep 2017 08:27:13 +0000
Subject: Re: [PATCH 2/2] ALSA: rme9652: Use common error handling code in snd_hdspm_probe()
Message-Id: <s5hefrikj6m.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9832906e-3b04-b708-2c26-4755e0beb811@users.sourceforge.net>
        <684da935-9423-70bd-2dca-32bea89cae92@users.sourceforge.net>
In-Reply-To: <684da935-9423-70bd-2dca-32bea89cae92@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 05 Sep 2017 22:38:16 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 5 Sep 2017 22:22:21 +0200
> 
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

The subject prefix isn't right, it's about hdspm driver.
I applied the patch with that correction now.


thanks,

Takashi
