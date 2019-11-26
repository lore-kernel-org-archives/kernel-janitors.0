From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Nov 2019 13:27:04 +0000
Subject: Re: [PATCH] spi: pic32: Fix an error code in pic32_spi_dma_prep()
Message-Id: <CAMuHMdX52phf_dSQh3vK8QGJtvmUwDiY_0f6d7xAJ_xF2vKNfg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126122324.v3rj7oscvjobhjxo@kili.mountain>
In-Reply-To: <20191126122324.v3rj7oscvjobhjxo@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On Tue, Nov 26, 2019 at 1:51 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We accidentally return success on this error path.
>
> Fixes: eb7e6dc6d9ff ("spi: pic32: Retire dma_request_slave_channel_compat()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/spi/spi-pic32.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
> index 156961b4ca86..93fb95073522 100644
> --- a/drivers/spi/spi-pic32.c
> +++ b/drivers/spi/spi-pic32.c
> @@ -633,7 +633,8 @@ static int pic32_spi_dma_prep(struct pic32_spi *pic32s, struct device *dev)
>                 goto out_err;
>         }
>
> -       if (pic32_spi_dma_config(pic32s, DMA_SLAVE_BUSWIDTH_1_BYTE))
> +       ret = pic32_spi_dma_config(pic32s, DMA_SLAVE_BUSWIDTH_1_BYTE);
> +       if (ret)
>                 goto out_err;

This used to be non-fatal, as DMA was optional, cfr. the comment:

        /* optional DMA support */
        ret = pic32_spi_dma_prep(pic32s, &pdev->dev);
        if (ret)
                goto err_bailout;

However, as of the aforementioned commit, DMA is no longer optional,
and probe will fail instead of falling back to PIO on DMA init failure...

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
