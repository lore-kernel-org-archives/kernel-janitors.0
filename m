From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Thu, 23 Nov 2017 05:55:08 +0000
Subject: Re: [PATCH] ASoC: wm0010: Delete an error message for a failed memory allocation in wm0010_boot()
Message-Id: <20171123055508.exw4ht2ojrvv5y3s@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fcfdbb1f-5b43-f430-dee9-61b86d6cfc79@users.sourceforge.net>
In-Reply-To: <fcfdbb1f-5b43-f430-dee9-61b86d6cfc79@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, LKML <linux-kernel@vger.kernel.org>

On Wed, Nov 22, 2017 at 05:27:11PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 22 Nov 2017 17:17:48 +0100
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
