From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 01 Dec 2018 12:58:36 +0000
Subject: Re: [PATCH -next] mmc: jz4740: Use PTR_ERR_OR_ZERO in jz4740_mmc_request_gpios()
Message-Id: <CACRpkdZf3F8u5PDVf97KV-sUD_HdOKhq=4FHXm1BMADgoAwmpw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543628746-101825-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543628746-101825-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Dec 1, 2018 at 2:37 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Ah, smart.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
