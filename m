From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 18 Jan 2018 07:52:03 +0000
Subject: Re: [PATCH -next] pinctrl: ingenic: remove redundant dev_err call in ingenic_pinctrl_probe()
Message-Id: <CACRpkdZ4AmJg98ccqS5S8CnVsBFgaWkwY_03pyCYpGwgo4=W6g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516188557-147454-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516188557-147454-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 17, 2018 at 12:29 PM, Wei Yongjun <weiyongjun1@huawei.com> wrote:

> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.

Yours,
Linus Walleij
