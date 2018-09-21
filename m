From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Sep 2018 16:03:20 +0000
Subject: Re: [PATCH -next] pinctrl: mediatek: make symbol 'mtk_drive' static
Message-Id: <CACRpkdb6yYV-KaHUOUXHLsKDYtPNe-bYq7wHGHqqberRzTJcbA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537424502-23554-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1537424502-23554-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Sep 19, 2018 at 11:12 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Fixes the following sparse warning:
>
> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:37:29: warning:
>  symbol 'mtk_drive' was not declared. Should it be static?
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied with Sean's ACK.

Yours,
Linus Walleij
