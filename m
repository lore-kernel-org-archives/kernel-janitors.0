From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 14:16:31 +0000
Subject: Re: [PATCH 1/2] gpio: omap: Delete an error message for a failed memory allocation in omap_gpio_prob
Message-Id: <CACRpkdaEteCvgQuP-+5eR7Jn1E4ViZdskV9DqA7uekcuqO_k5A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8ec31664-badc-5454-b759-ae9132833589@users.sourceforge.net> <86570340-688b-34ec-2d99-ff728ccbe4a9@users.sourceforge.net>
In-Reply-To: <86570340-688b-34ec-2d99-ff728ccbe4a9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Linux-OMAP <linux-omap@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Kevin Hilman <khilman@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Feb 10, 2018 at 10:07 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 10 Feb 2018 21:46:30 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
