From: Michal Simek <michal.simek@xilinx.com>
Date: Thu, 25 Jun 2015 08:32:27 +0000
Subject: Re: [patch] spi: zynq: missing break statement
Message-Id: <558BBC9B.8030004@xilinx.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150624143133.GE1702@mwanda>
In-Reply-To: <20150624143133.GE1702@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ranjit Waghmode <ranjit.waghmode-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?windows-1252?Q?S=F6ren_Br?= =?windows-1252?Q?inkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 06/24/2015 04:31 PM, Dan Carpenter wrote:
> There is a missing break statement here so selecting both only selects
> upper.
> 
> Fixes: dfe11a11d523 ('spi: Add support for Zynq Ultrascale+ MPSoC GQSPI controller')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
> index 87b20a5..f23f36e 100644
> --- a/drivers/spi/spi-zynqmp-gqspi.c
> +++ b/drivers/spi/spi-zynqmp-gqspi.c
> @@ -214,6 +214,7 @@ static void zynqmp_gqspi_selectslave(struct zynqmp_qspi *instanceptr,
>  	case GQSPI_SELECT_FLASH_CS_BOTH:
>  		instanceptr->genfifocs = GQSPI_GENFIFO_CS_LOWER |
>  			GQSPI_GENFIFO_CS_UPPER;
> +		break;
>  	case GQSPI_SELECT_FLASH_CS_UPPER:
>  		instanceptr->genfifocs = GQSPI_GENFIFO_CS_UPPER;
>  		break;
> 

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
