From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Jan 2018 10:04:10 +0000
Subject: Re: [PATCH 4/4] gpio-stmpe: Delete an unnecessary variable initialisation in stmpe_gpio_probe()
Message-Id: <CACRpkdYr8U-6bzQ7rOX_768Hdo-u1kMQJ3OFWDOR+t11zvrAjw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net> <245fffed-3b76-5265-25b1-9f9077518894@users.sourceforge.net>
In-Reply-To: <245fffed-3b76-5265-25b1-9f9077518894@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jan 12, 2018 at 9:04 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 12 Jan 2018 20:48:40 +0100
>
> The local variable "irq" will eventually be set to an appropriate value
> a bit later. Thus omit the explicit initialisation at the beginning.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
