From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2017 14:33:21 +0000
Subject: Re: [PATCH] gpio: mcp23s08: Use seq_putc() in mcp23s08_dbg_show()
Message-Id: <CACRpkdZaUFfWrSGdo=G1QZSPO-S1Nit5tq2P7aq_ZD1w6HpZkw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <78956b0e-7f06-487c-cd11-fea77a65e66a@users.sourceforge.net>
In-Reply-To: <78956b0e-7f06-487c-cd11-fea77a65e66a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, May 8, 2017 at 12:50 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 8 May 2017 12:44:36 +0200
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

I can't change stuff around this driver right now as it is being
rewritten.

Yours,
Linus Walleij
