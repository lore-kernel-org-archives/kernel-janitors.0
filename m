From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Wed, 11 Jul 2018 19:59:32 +0000
Subject: Re: [PATCH -next] gpio: pxa: fix potential NULL dereference in pxa_gpio_probe()
Message-Id: <87601lfsrf.fsf@belgarion.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1531315178-185878-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1531315178-185878-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> writes:

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
> e = devm_ioremap(e1, res->start, e2);
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
