From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Fri, 24 Nov 2017 08:34:57 +0000
Subject: Re: [PATCH 4/4] ASoC: wm2000: Improve a size determination in wm2000_i2c_probe()
Message-Id: <20171124083457.ezopgjiowejhklhi@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd76c876-81a5-3cf6-e7d9-52037729fb98@users.sourceforge.net>
 <a6e50094-3d1c-6ad4-67e4-377036f5ccd6@users.sourceforge.net>
In-Reply-To: <a6e50094-3d1c-6ad4-67e4-377036f5ccd6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Nov 24, 2017 at 08:40:22AM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 24 Nov 2017 08:18:14 +0100
> 
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
