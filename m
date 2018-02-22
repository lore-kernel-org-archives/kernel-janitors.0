From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 14:29:38 +0000
Subject: Re: [PATCH] gpio-intel-mid: Delete an error message for a failed memory allocation in intel_gpio_pro
Message-Id: <CACRpkdbkhyUurc99iVeSbdoVOcC3be5N__bbzGvgSVJQ9hUfWw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0ea6dba4-0c52-4c9c-ae7e-d80c2f3d50f3@users.sourceforge.net>
In-Reply-To: <0ea6dba4-0c52-4c9c-ae7e-d80c2f3d50f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Feb 11, 2018 at 10:04 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 11 Feb 2018 21:56:42 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
