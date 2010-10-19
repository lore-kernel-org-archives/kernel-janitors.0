From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 19 Oct 2010 22:26:05 +0000
Subject: Re: [PATCH] dma: imx-dma: fix signedness bug
Message-Id: <AANLkTik15Z2_wyDRDOHOnpKKPgb+PHWs477esndgWmex@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287327110-9158-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1287327110-9158-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org

On Sun, Oct 17, 2010 at 7:51 AM, Vasiliy Kulikov <segooon@gmail.com> wrote:
> mxdmac->channel was unsigned, so check (imxdmac->channel < 0) for
> failed imx_dma_request_by_prio() made no sence. =A0Explicitly check
> signed values.
>
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
> =A0drivers/dma/imx-dma.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
> index 346be62..75d870f 100644
> --- a/drivers/dma/imx-dma.c
> +++ b/drivers/dma/imx-dma.c
> @@ -335,7 +335,7 @@ static int __init imxdma_probe(struct platform_device=
 *pdev)
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0imxdmac->imxdma_channel =3D imx_dma_reques=
t_by_prio("dmaengine",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0DMA_PRIO_M=
EDIUM);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (imxdmac->channel < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((int)imxdmac->channel < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_init;

Should this be:

               if ((int)imxdmac->channel < 0) {
                       ret =3D -ENODEV;
                       goto err_init;
               }

...because I get the following in my compilation tests.
drivers/dma/imx-dma.c: In function 'imxdma_probe':
drivers/dma/imx-dma.c:324: warning: 'ret' may be used uninitialized in
this function

--
Dan
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
