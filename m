From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Jan 2018 10:07:41 +0000
Subject: Re: [PATCH] pinctrl: pinmux: Use seq_putc() in pinmux_pins_show()
Message-Id: <CACRpkdZps9XjXE+BP+xi4J1a85BVjmbOfdzDMXYHRjJbZDnegw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bb070097-4d6a-3986-398d-7276cb18bb37@users.sourceforge.net>
In-Reply-To: <bb070097-4d6a-3986-398d-7276cb18bb37@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Jan 13, 2018 at 11:49 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 13 Jan 2018 11:33:47 +0100
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
