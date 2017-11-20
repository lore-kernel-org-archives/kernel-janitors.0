From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Date: Mon, 20 Nov 2017 15:21:48 +0000
Subject: Re: [PATCH] crypto: hifn_795x - Fix a memory leak in the error handling path of 'hifn_probe()'
Message-Id: <CANc+2y6kih23rAmDg6eqrGQDWAj3iM7_b40KS77QpB-M2Vd76g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171118134545.25784-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20171118134545.25784-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Christophe,

On 18 November 2017 at 19:15, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> 'dev' is leaking in the error handling path of 'hifn_probe()'.
>
> Add a 'kfree(dev)' to match the code in 'hifn_remove()'
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/crypto/hifn_795x.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/crypto/hifn_795x.c b/drivers/crypto/hifn_795x.c
> index e09d4055b19e..a5a36fe7bf2c 100644
> --- a/drivers/crypto/hifn_795x.c
> +++ b/drivers/crypto/hifn_795x.c
> @@ -2579,6 +2579,7 @@ static int hifn_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>         for (i = 0; i < 3; ++i)
>                 if (dev->bar[i])
>                         iounmap(dev->bar[i]);
> +       kfree(dev);
>
>  err_out_free_regions:
>         pci_release_regions(pdev);
> --
> 2.14.1
>

Nice catch.

Reviewed-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>

Regards,
PrasannaKumar
