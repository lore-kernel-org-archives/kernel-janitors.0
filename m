From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Oct 2019 11:36:23 +0000
Subject: Re: [PATCH -next] power: supply: ab8500_charger: Fix wrong pointer passed to PTR_ERR()
Message-Id: <CACRpkdb0JMTj3xzLODdYbQe=o=pY3LbVP0RLcdBn-teDEu5EsQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191022111856.44118-1-weiyongjun1@huawei.com>
In-Reply-To: <20191022111856.44118-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Sebastian Reichel <sre@kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, kernel-janitors@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>

On Tue, Oct 22, 2019 at 1:19 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
>
> Fixes: 97ab78bac5d0 ("power: supply: ab8500_charger: Convert to IIO ADC")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

If Sebastian has pulled Jon's branch into his tree he can apply it
in the power tree I suppose.

Yours,
Linus Walleij
