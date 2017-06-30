From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 Jun 2017 13:49:05 +0000
Subject: Re: [PATCH] pinctrl: rza1: make structures rza1_gpiochip_template and rza1_pinmux_ops static
Message-Id: <CACRpkdaw3APxQhNw9zmc5-41s6jxSS34f7BZ-PncNpmW0=-_8Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170630102653.9546-1-colin.king@canonical.com>
In-Reply-To: <20170630102653.9546-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 30, 2017 at 12:26 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> structures rza1_gpiochip_template and rza1_pinmux_ops do not need to be
> in global scope, so make them static.
>
> Cleans up sparse warnings:
> symbol 'rza1_gpiochip_template' was not declared. Should it be static?
> symbol 'rza1_pinmux_ops' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
