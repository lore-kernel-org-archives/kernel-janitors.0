From: "Richard Genoud" <richard.genoud@gmail.com>
Date: Thu, 11 Sep 2008 13:47:31 +0000
Subject: Re: [PATCH 5/5] drivers/dma/ioat_dma.c: Drop code after return
Message-Id: <80b317760809110647wf1b81e3u799c63e0aa83a04@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0809111434100.9593@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0809111434100.9593@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: maciej.sosnowski@intel.com, linux-kernel@vger.kernel.org, vigneshbabu@gmail.com, kernel-janitors@vger.kernel.org

2008/9/11 Julia Lawall <julia@diku.dk>:
> From: Julia Lawall <julia@diku.dk>
>
> The break after the return serves no purpose.
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
Reviewed-by: Richard Genoud <richard.genoud@gmail.com>
> ---
>
>  drivers/dma/ioat_dma.c        |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/ioat_dma.c b/drivers/dma/ioat_dma.c
> index bc8c6e3..1ef68b3 100644
> --- a/drivers/dma/ioat_dma.c
> +++ b/drivers/dma/ioat_dma.c
> @@ -971,11 +971,9 @@ static struct ioat_desc_sw *ioat_dma_get_next_descriptor(
>        switch (ioat_chan->device->version) {
>        case IOAT_VER_1_2:
>                return ioat1_dma_get_next_descriptor(ioat_chan);
> -               break;
>        case IOAT_VER_2_0:
>        case IOAT_VER_3_0:
>                return ioat2_dma_get_next_descriptor(ioat_chan);
> -               break;
>        }
>        return NULL;
>  }
>
