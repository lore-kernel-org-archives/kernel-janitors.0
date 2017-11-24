From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Fri, 24 Nov 2017 08:11:34 +0000
Subject: Re: [PATCH 1/4] ASoC: wm2000: Delete an error message for a failed memory allocation in wm2000_i2c_p
Message-Id: <20171124081134.glzwg6pusswm4m66@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd76c876-81a5-3cf6-e7d9-52037729fb98@users.sourceforge.net>
 <87078639-7ec0-c3cc-5399-5607f2329c63@users.sourceforge.net>
In-Reply-To: <87078639-7ec0-c3cc-5399-5607f2329c63@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Nov 24, 2017 at 08:36:17AM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 23 Nov 2017 22:28:00 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
