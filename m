From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 07 Sep 2017 08:30:12 +0000
Subject: Re: [PATCH] ALSA: 6Fire: Use common error handling code in usb6fire_chip_probe()
Message-Id: <s5ha826kj1n.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b3e5ec7-557c-4330-4fa4-221530d6c811@users.sourceforge.net>
In-Reply-To: <6b3e5ec7-557c-4330-4fa4-221530d6c811@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Torsten Schenk <torsten.schenk@zoho.com>, Arvind Yadav <arvind.yadav.cs@gmail.com>

On Wed, 06 Sep 2017 16:38:25 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 6 Sep 2017 16:26:29 +0200
> 
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
