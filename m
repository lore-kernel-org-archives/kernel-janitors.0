From: Po-Yu Chuang <ratbert.chuang@gmail.com>
Date: Sat, 19 Mar 2011 05:05:46 +0000
Subject: Re: [patch] ftmac100: use resource_size()
Message-Id: <AANLkTimHkwDnzKhWh2fD_-ue0-m-+6evPNz=BQZTOis-@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110319043915.GB2008@bicker>
In-Reply-To: <20110319043915.GB2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: Po-Yu Chuang <ratbert@faraday-tech.com>, Eric Dumazet <eric.dumazet@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Sat, Mar 19, 2011 at 12:39 PM, Dan Carpenter <error27@gmail.com> wrote:
> The calculation is off-by-one.  It should be "end - start + 1".  This
> patch fixes it to use resource_size() instead.  Oddly, the code already
> uses resource size correctly a couple lines earlier when it calls
> request_mem_region() for this memory.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/drivers/net/ftmac100.c b/drivers/net/ftmac100.c
> index 1d6f4b8..a316619 100644
> --- a/drivers/net/ftmac100.c
> +++ b/drivers/net/ftmac100.c
> @@ -1102,7 +1102,7 @@ static int ftmac100_probe(struct platform_device *pdev)
>                goto err_req_mem;
>        }
>
> -       priv->base = ioremap(res->start, res->end - res->start);
> +       priv->base = ioremap(res->start, resource_size(res));
>        if (!priv->base) {
>                dev_err(&pdev->dev, "Failed to ioremap ethernet registers\n");
>                err = -EIO;

Ah, I incautiously missed that line when code review.

Thanks,
Po-Yu Chuang
