From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 09 Jan 2018 14:29:06 +0000
Subject: Re: [PATCH] pinctrl: sh-pfc: Use seq_puts() in sh_pfc_pin_dbg_show()
Message-Id: <CACRpkdb-eGrqequRO_B1__rnT07=FO6yecsxEPEw6YLAU6nyrw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7e3a88a6-2ea8-1704-b7a0-67f1f4b4f3f6@users.sourceforge.net>
In-Reply-To: <7e3a88a6-2ea8-1704-b7a0-67f1f4b4f3f6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Jan 6, 2018 at 9:56 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 6 Jan 2018 21:50:20 +0100
>
> A string which did not contain a data format specification should be put
> into a sequence. Thus use the corresponding function "seq_puts".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Leaving to Geert to pick this up. (Looks good.)

Yours,
Linus Walleij
