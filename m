From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 12 Aug 2017 21:22:51 +0000
Subject: Re: [PATCH] ALSA: usb: caiaq: audio: Delete two error messages for a failed memory allocation in all
Message-Id: <s5hk228wkes.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cb2a553-e247-f432-48ef-1a7438416366@users.sourceforge.net>
In-Reply-To: <8cb2a553-e247-f432-48ef-1a7438416366@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Daniel Mack <zonque@gmail.com>

On Fri, 11 Aug 2017 20:00:30 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 11 Aug 2017 19:39:06 +0200
> 
> Omit extra messages for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
