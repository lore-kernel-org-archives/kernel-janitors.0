From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 14:19:50 +0000
Subject: Re: [PATCH] gpio: merrifield: Delete an error message for a failed memory allocation in mrfld_gpio_p
Message-Id: <CACRpkdbjJPcRwqCNvRnKyyrSLcrcp9CKCcWXXvSRx8BwtBw72A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d73420c9-60ee-ab28-e881-299441815afc@users.sourceforge.net>
In-Reply-To: <d73420c9-60ee-ab28-e881-299441815afc@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Feb 11, 2018 at 1:42 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 11 Feb 2018 13:30:14 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
