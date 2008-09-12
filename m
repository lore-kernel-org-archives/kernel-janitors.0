From: "Sosnowski, Maciej" <maciej.sosnowski@intel.com>
Date: Fri, 12 Sep 2008 12:13:11 +0000
Subject: RE: [PATCH 5/5] drivers/dma/ioat_dma.c: Drop code after return
Message-Id: <7F38996F7185A24AB9071ED4950AD8C101FEE5B9@swsmsx413.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0809111434100.9593@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0809111434100.9593@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, vigneshbabu@gmail.com, richard.genoud@gmail.comlinux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The break after the return serves no purpose.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
> 
>  drivers/dma/ioat_dma.c        |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/ioat_dma.c b/drivers/dma/ioat_dma.c
> index bc8c6e3..1ef68b3 100644
> --- a/drivers/dma/ioat_dma.c
> +++ b/drivers/dma/ioat_dma.c
> @@ -971,11 +971,9 @@ static struct ioat_desc_sw
>  	*ioat_dma_get_next_descriptor( switch
(ioat_chan->device->version) {
>  	case IOAT_VER_1_2:
>  		return ioat1_dma_get_next_descriptor(ioat_chan);
> -		break;
>  	case IOAT_VER_2_0:
>  	case IOAT_VER_3_0:
>  		return ioat2_dma_get_next_descriptor(ioat_chan);
> -		break;
>  	}
>  	return NULL;
>  }

You are right. Thanks for pointing this out.

Acked-by: Maciej Sosnowski <maciej.sosnowski@intel.com>
