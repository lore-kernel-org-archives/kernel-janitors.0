From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 04 Oct 2019 19:44:52 +0000
Subject: Re: [PATCH] sata_gemini: Use devm_platform_ioremap_resource() in gemini_sata_probe()
Message-Id: <CACRpkdbgUVm_6MdHw+6MJBc-oHYp-MA7_3jM3buQtKJEtEMtnA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b17404cd-294f-fe2f-e8a3-2218a0dae14f@web.de>
In-Reply-To: <b17404cd-294f-fe2f-e8a3-2218a0dae14f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-ide@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Himanshu Jha <himanshujha199640@gmail.com>

On Wed, Sep 18, 2019 at 8:34 AM Markus Elfring <Markus.Elfring@web.de> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 08:28:09 +0200
>
> Simplify this function implementation by using a known wrapper function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Looks correct.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
