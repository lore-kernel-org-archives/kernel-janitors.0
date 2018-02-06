From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 06 Feb 2018 13:29:51 +0000
Subject: Re: [PATCH] gpio-wm831x: Use seq_putc() in wm831x_gpio_dbg_show()
Message-Id: <CACRpkdbMRzD11F9b5QHCHeRp7aBqXNCr6dpPjKg9fSFdc5rOVQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <85344479-907c-adf7-6ae6-6d6acff2c1b1@users.sourceforge.net>
In-Reply-To: <85344479-907c-adf7-6ae6-6d6acff2c1b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jan 12, 2018 at 9:37 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 12 Jan 2018 21:30:09 +0100
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied with Charles' ACK.

Yours,
Linus Walleij
