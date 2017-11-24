From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Fri, 24 Nov 2017 09:57:55 +0000
Subject: Re: [PATCH 1/2] ASoC: wm8903: Delete an error message for a failed memory allocation in wm8903_i2c_p
Message-Id: <20171124095755.nhvkjhnk24vy2b5u@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d4ce14fa-42a4-c911-3e0a-f2dd5cde6c14@users.sourceforge.net>
 <52cba9de-be47-1518-20fc-897967686bf8@users.sourceforge.net>
In-Reply-To: <52cba9de-be47-1518-20fc-897967686bf8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Nov 24, 2017 at 10:53:33AM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 24 Nov 2017 10:05:43 +0100
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
