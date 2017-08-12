From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 12 Aug 2017 21:26:36 +0000
Subject: Re: [PATCH] ALSA: trident: Delete an error message for a failed memory allocation in snd_trident_tlb
Message-Id: <s5hinhswk8j.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20c860e6-2aeb-eb8b-2ba7-fba216a70cfa@users.sourceforge.net>
In-Reply-To: <20c860e6-2aeb-eb8b-2ba7-fba216a70cfa@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Fabian Frederick <fabf@skynet.be>, Julia Lawall <Julia.Lawall@lip6.fr>, Bhumika Goyal <bhumirks@gmail.com>

On Sat, 12 Aug 2017 13:31:55 +0200,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 12 Aug 2017 13:20:16 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
