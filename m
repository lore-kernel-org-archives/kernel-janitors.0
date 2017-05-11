From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2017 13:28:56 +0000
Subject: Re: [PATCH 8/9] pinctrl: Use seq_putc() in pinctrl_maps_show()
Message-Id: <CACRpkdb4=4BAT+aPLYneVNuBeaxntWAvG9t3Hgx=k5aHB96oCA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net> <80f6dabc-6547-4d2b-2efa-15a90de41c0c@users.sourceforge.net>
In-Reply-To: <80f6dabc-6547-4d2b-2efa-15a90de41c0c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, May 2, 2017 at 11:28 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 2 May 2017 10:47:35 +0200
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Maybe I will coalesce it with other commits as Andy suggests.

Yours,
Linus Walleij
