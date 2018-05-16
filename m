From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 May 2018 12:55:41 +0000
Subject: Re: [PATCH -next] gpio: Fix return value check in owl_gpio_probe()
Message-Id: <CACRpkdbO+At1=4BBV-QrPXzDP-3P9UBmpKvdeJ6ivLo_FD+mKg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1525657224-88189-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1525657224-88189-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Mon, May 7, 2018 at 3:40 AM, Wei Yongjun <weiyongjun1@huawei.com> wrote:

> In case of error, the function of_iomap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
>
> Fixes: d3654d38809c ("gpio: Add gpio driver for Actions OWL S900 SoC")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

We dropped this driver from the GPIO tree in favor of an extended
pin control driver.

Yours,
Linus Walleij
