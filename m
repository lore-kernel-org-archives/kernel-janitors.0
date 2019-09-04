From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Wed, 04 Sep 2019 14:54:07 +0000
Subject: Re: [PATCH] gpio: mockup: add missing single_release()
Message-Id: <CAMpxmJWJr0uBCs_oGX+h1uFmQ2f7Axo1iqtD6rzwgT-bbZdD6g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904141834.195294-1-weiyongjun1@huawei.com>
In-Reply-To: <20190904141834.195294-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Bamvor Jian Zhang <bamv2005@gmail.com>, linux-gpio <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

śr., 4 wrz 2019 o 16:00 Wei Yongjun <weiyongjun1@huawei.com> napisał(a):
>
> When using single_open() for opening, single_release() should be
> used instead of seq_release(), otherwise there is a memory leak.
>
> Fixes: 2a9e27408e12 ("gpio: mockup: rework debugfs interface")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpio/gpio-mockup.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index f1a9c0544e3f..213aedc97dc2 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -309,6 +309,7 @@ static const struct file_operations gpio_mockup_debugfs_ops = {
>         .read = gpio_mockup_debugfs_read,
>         .write = gpio_mockup_debugfs_write,
>         .llseek = no_llseek,
> +       .release = single_release,
>  };
>
>  static void gpio_mockup_debugfs_setup(struct device *dev,
>
>
>

Good catch!

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus: can you pick it up for your last pull-requests with fixes for v5.3?

Bart
