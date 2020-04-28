From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Apr 2020 14:11:39 +0000
Subject: Re: [PATCH -next] gpio: mlxbf2: fix return value check in mlxbf2_gpio_get_lock_res()
Message-Id: <CACRpkdYpFBUZfSKbA4ENdc7T5kHn4HmB=esUkKg1CpFoTeOU0g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427110829.154785-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427110829.154785-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Apr 27, 2020 at 1:07 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> In case of error, the function devm_ioremap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.

Yours,
Linus Walleij
