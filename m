From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Jul 2018 07:43:48 +0000
Subject: Re: [PATCH -next] pinctrl: at91-pio4: remove redundant return value check of platform_get_resource()
Message-Id: <CACRpkdb7zWv10Fnr_M4zSKmhHQ=QmJTOAJsqgCPguAdCuU=4iA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1531312447-134423-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1531312447-134423-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Jul 11, 2018 at 2:25 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Remove unneeded error handling on the result of a call
> to platform_get_resource() when the value is passed to
> devm_ioremap_resource().
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
