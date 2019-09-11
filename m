From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Sep 2019 13:50:51 +0000
Subject: Re: [PATCH -next] gpio: creg-snps: use devm_platform_ioremap_resource() to simplify code
Message-Id: <CACRpkdZgH9Q9OMUV4C6zADPj_NN+QrxQOLUDcOqJ_oYCxWP7vg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906131032.22148-1-yuehaibing@huawei.com>
In-Reply-To: <20190906131032.22148-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Eugeniy.Paltsev@synopsys.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Sep 6, 2019 at 2:48 PM YueHaibing <yuehaibing@huawei.com> wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied with Eugeniy's ACK!

Yours,
Linus Walleij
