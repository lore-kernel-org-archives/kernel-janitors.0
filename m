From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jan 2019 08:17:27 +0000
Subject: Re: [PATCH -next] gpio: pca953x: Make symbol 'pca953x_i2c_regmap' static
Message-Id: <CACRpkdZG5Cktkpos0nkxp6Q2ccEtG9r7YFxfcM=kxA1rq2aWcQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <52902326-baf8-d6b5-52e3-0442fdaebc87@gmail.com>
In-Reply-To: <52902326-baf8-d6b5-52e3-0442fdaebc87@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jan 10, 2019 at 3:01 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Fixes the following sparse warning:
>
> drivers/gpio/gpio-pca953x.c:292:28: warning:
>  symbol 'pca953x_i2c_regmap' was not declared. Should it be static?
>
> Fixes: 49427232764d ("gpio: pca953x: Perform basic regmap conversion")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied for fixes with Marek's ACK, awesome sparsing!

Yours,
Linus Walleij
