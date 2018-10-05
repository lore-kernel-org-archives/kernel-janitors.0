From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 05 Oct 2018 07:43:20 +0000
Subject: Re: [PATCH -next] eeprom: at25: remove unneeded 'at25_remove'
Message-Id: <CAK8P3a2Yzv1ThTZLp5boydi1_poi_V7RbSF3JZ4KG41GEjF6RA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538720352-85691-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538720352-85691-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: gregkh <gregkh@linuxfoundation.org>, devang.panchal@softnautics.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Oct 5, 2018 at 8:08 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/misc/eeprom/at25.c: In function 'at25_remove':
> drivers/misc/eeprom/at25.c:384:20: warning:
>  variable 'at25' set but not used [-Wunused-but-set-variable]
>
> Since commit 96d08fb43e30 ("eeprom: at25: use devm_nvmem_register()"),
> at25_remove is do nothing, so can be removed.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

I had to double-check that removing the remove callback doesn't
result in a device that you cannot remove, but it is in fact supported, so

Acked-by: Arnd Bergmann <arnd@arndb.de>
