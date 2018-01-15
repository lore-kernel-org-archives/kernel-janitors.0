From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Mon, 15 Jan 2018 10:03:00 +0000
Subject: Re: [PATCH] gpio-wm831x: Use seq_putc() in wm831x_gpio_dbg_show()
Message-Id: <20180115100300.rtvqfaebjm22kcsx@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <85344479-907c-adf7-6ae6-6d6acff2c1b1@users.sourceforge.net>
In-Reply-To: <85344479-907c-adf7-6ae6-6d6acff2c1b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jan 12, 2018 at 09:37:53PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 12 Jan 2018 21:30:09 +0100
> 
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
