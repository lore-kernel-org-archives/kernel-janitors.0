From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Jul 2018 07:46:01 +0000
Subject: Re: [PATCH -next] pinctrl: nsp: fix potential NULL dereference in nsp_pinmux_probe()
Message-Id: <CACRpkdbwAJOaFay3x45gyf7rBpkPOAMbxW6FLQUvCekUKatLYA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1531312461-134547-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1531312461-134547-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Jul 11, 2018 at 2:25 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> platform_get_resource() may fail and return NULL, so we should
> better check it's return value to avoid a NULL pointer dereference
> a bit later in the code.
>
> This is detected by Coccinelle semantic patch.
>
> @@
> expression pdev, res, n, t, e, e1, e2;
> @@
>
> res = platform_get_resource(pdev, t, n);
> + if (!res)
> +   return -EINVAL;
> ... when != res = NULL
> e = devm_ioremap_nocache(e1, res->start, e2);
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied with Ray's ACK.

Yours,
Linus Walleij
