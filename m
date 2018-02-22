From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 14:18:30 +0000
Subject: Re: [PATCH] gpio-ml-ioh: Delete an error message for a failed memory allocation in ioh_gpio_probe()
Message-Id: <CACRpkdaf=PCcTrOasn0DOqB0+kLZ-VY7yuY0isiqApLhdF6ktQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0da1b5a4-ccd6-98f6-3546-e466b3f10524@users.sourceforge.net>
In-Reply-To: <0da1b5a4-ccd6-98f6-3546-e466b3f10524@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Feb 10, 2018 at 10:30 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 10 Feb 2018 22:27:15 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
