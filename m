From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Sep 2018 16:08:59 +0000
Subject: Re: [PATCH -next] pinctrl: mediatek: moore: fix return value check in mtk_moore_pinctrl_probe()
Message-Id: <CACRpkdbyHU6cNNd96UMuH-ck5Z0i1vFjXXm6ECtUwUDw6R8=_w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537424510-23623-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1537424510-23623-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Sep 19, 2018 at 11:12 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> In case of error, the function devm_kmalloc_array() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
>
> Fixes: b7d7f9eeca55 ("pinctrl: mediatek: extend struct mtk_pin_desc which per-pin driver depends on")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied with Sean's ACK.

Yours,
Linus Walleij
