From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 May 2020 09:17:23 +0000
Subject: Re: [PATCH -next] bus: arm-integrator-lm: Fix return value check in integrator_ap_lm_probe()
Message-Id: <CACRpkdYXmziVfd0ZDTq_3ReCdcw9cWPXXD1H9jfxvLiE=7EDDA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520032150.165388-1-weiyongjun1@huawei.com>
In-Reply-To: <20200520032150.165388-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

Hi Wei,

On Wed, May 20, 2020 at 5:18 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> In case of error, the function of_find_matching_node() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
>
> Fixes: ccea5e8a5918 ("bus: Add driver for Integrator/AP logic modules")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

I applied this and signed it off and sent it over to the ARM SoC
maintainers.

Yours,
Linus Walleij
