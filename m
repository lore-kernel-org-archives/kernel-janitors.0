From: David Daney <ddaney@caviumnetworks.com>
Date: Fri, 30 Jul 2010 15:19:30 +0000
Subject: Re: [PATCH 2/9] staging: octeon: check request_irq() return value
Message-Id: <4C52ED82.6040703@caviumnetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280488062-20737-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280488062-20737-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Ralf Baechle <ralf@linux-mips.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On 07/30/2010 04:07 AM, Kulikov Vasiliy wrote:
> request_irq() may fail, if so propagate error code.
>
> Signed-off-by: Kulikov Vasiliy<segooon@gmail.com>

You can add:

Acked-by: David Daney <ddaney@caviumnetworks.com>


> ---
>   drivers/staging/octeon/ethernet-spi.c |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/staging/octeon/ethernet-spi.c b/drivers/staging/octeon/ethernet-spi.c
> index b58b897..9708254 100644
> --- a/drivers/staging/octeon/ethernet-spi.c
> +++ b/drivers/staging/octeon/ethernet-spi.c
> @@ -294,6 +294,8 @@ int cvm_oct_spi_init(struct net_device *dev)
>   	if (number_spi_ports = 0) {
>   		r = request_irq(OCTEON_IRQ_RML, cvm_oct_spi_rml_interrupt,
>   				IRQF_SHARED, "SPI",&number_spi_ports);
> +		if (r)
> +			return r;
>   	}
>   	number_spi_ports++;
>

