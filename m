From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 28 Nov 2017 06:50:28 +0000
Subject: Re: [PATCH 2/3] ALSA: sgio2audio: Improve a size determination in snd_sgio2audio_create()
Message-Id: <s5hk1yalwwb.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <eb375101-03bd-37bb-67ef-e261eeca206e@users.sourceforge.net>
 <f7ebb350-79c1-6ce2-eb15-bef62c631cb4@users.sourceforge.net>
In-Reply-To: <f7ebb350-79c1-6ce2-eb15-bef62c631cb4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>

On Sat, 11 Nov 2017 20:22:36 +0100,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 11 Nov 2017 20:02:07 +0100
> 
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
