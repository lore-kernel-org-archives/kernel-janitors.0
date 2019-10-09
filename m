From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 09 Oct 2019 09:12:33 +0000
Subject: Re: [PATCH] memstick: jmb38x_ms: Fix an error handling path in 'jmb38x_ms_probe()'
Message-Id: <CAPDyKFp6=6JsMSg7PV6zEohw16FeQ07G_VWSM1qFxmqswfrqFw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191005112101.14410-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191005112101.14410-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, Will Deacon <will@kernel.org>, gustavo.pimentel@synopsys.com, Colin King <colin.king@canonical.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Denis Efremov <efremov@linux.com>, Thomas Gleixner <tglx@linutronix.de>, YueHaibing <yuehaibing@huawei.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, 5 Oct 2019 at 13:21, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If 'jmb38x_ms_count_slots()' returns 0, we must undo the previous
> 'pci_request_regions()' call.
>
> Goto 'err_out_int' to fix it.
>
> Fixes: 60fdd931d577 ("memstick: add support for JMicron jmb38x MemoryStick host controller")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for fixes and by adding stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/host/jmb38x_ms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/memstick/host/jmb38x_ms.c b/drivers/memstick/host/jmb38x_ms.c
> index c4a477643977..0a9c5ddf2f59 100644
> --- a/drivers/memstick/host/jmb38x_ms.c
> +++ b/drivers/memstick/host/jmb38x_ms.c
> @@ -941,7 +941,7 @@ static int jmb38x_ms_probe(struct pci_dev *pdev,
>         if (!cnt) {
>                 rc = -ENODEV;
>                 pci_dev_busy = 1;
> -               goto err_out;
> +               goto err_out_int;
>         }
>
>         jm = kzalloc(sizeof(struct jmb38x_ms)
> --
> 2.20.1
>
