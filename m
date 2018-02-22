From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 14:17:35 +0000
Subject: Re: [PATCH 2/2] gpio: omap: Improve a size determination in omap_gpio_probe()
Message-Id: <CACRpkdZF+_vG3FF4i=FzJAUnCZqqOKGZp6DqHhUOZQHQ2ZWr5Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8ec31664-badc-5454-b759-ae9132833589@users.sourceforge.net> <422a4c63-5ffc-2b40-4d9a-cf947d4af2fd@users.sourceforge.net>
In-Reply-To: <422a4c63-5ffc-2b40-4d9a-cf947d4af2fd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Linux-OMAP <linux-omap@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Kevin Hilman <khilman@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Feb 10, 2018 at 10:08 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 10 Feb 2018 21:49:22 +0100
>
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
