From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 08 Feb 2019 12:11:07 +0000
Subject: Re: [PATCH -next] gpio: tqmx86: Drop unnecessary gpiochip_remove in tqmx86_gpio_probe()
Message-Id: <CACRpkda1PbxquM98qwJQMiN9RJHJ2EpgP6-H9hL1+Yw-sFnsWA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190201091841.152704-1-weiyongjun1@huawei.com>
In-Reply-To: <20190201091841.152704-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 1, 2019 at 10:04 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> It's not necessary to remove gpio_chip which added with
> devm_gpiochip_add_data().
>
> Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied with Andew's review tag.

Yours,
Linus Walleij
