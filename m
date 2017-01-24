From: Evgeniy Polyakov <zbr@ioremap.net>
Date: Tue, 24 Jan 2017 02:03:29 +0000
Subject: Re: [PATCH] w1: omap_hdq: Free resources on error path
Message-Id: <831651485223409@web7g.yandex.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170109001300.3483-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170109001300.3483-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Christophe

09.01.2017, 03:13, "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>:
> In case of error returned by '_omap_hdq_reset()', free resources as done
> elsewhere in this function.
>
> This patch slighly changes the semantic of the code. It now propagates the
> error code returned by '_omap_hdq_reset()' instead of returning -EINVAL
> unconditionally.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks good to me.
If kernel-janitors@ will not push it upstream feel free to send to to GregKH <greg@kroah.com>
and add me to copy.

Acked-by: Evgeniy Polyakov <zbr@ioremap.net>

> ---
>  drivers/w1/masters/omap_hdq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
> index bb09de633939..fb190c259607 100644
> --- a/drivers/w1/masters/omap_hdq.c
> +++ b/drivers/w1/masters/omap_hdq.c
> @@ -715,7 +715,7 @@ static int omap_hdq_probe(struct platform_device *pdev)
>          ret = _omap_hdq_reset(hdq_data);
>          if (ret) {
>                  dev_dbg(&pdev->dev, "reset failed\n");
> - return -EINVAL;
> + goto err_irq;
>          }
>
>          rev = hdq_reg_in(hdq_data, OMAP_HDQ_REVISION);
> --
> 2.9.3
