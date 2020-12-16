From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 16 Dec 2020 11:55:19 +0000
Subject: NAK: [PATCH] wilc1000: fix spelling mistake in Kconfig "devision" -> "division"
Message-Id: <3ae68497-ddee-c494-cb4a-66dda7818806@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201216115425.12745-1-colin.king@canonical.com>
In-Reply-To: <20201216115425.12745-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Ajay Singh <ajay.kathat@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Kalle Valo <kvalo@codeaurora.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 16/12/2020 11:54, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the Kconfig help text. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/ni/Kconfig                 | 2 +-
>  drivers/net/wireless/microchip/wilc1000/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ni/Kconfig b/drivers/net/ethernet/ni/Kconfig
> index 01229190132d..dcfbfa516e67 100644
> --- a/drivers/net/ethernet/ni/Kconfig
> +++ b/drivers/net/ethernet/ni/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
> -# National Instuments network device configuration
> +# National Instruments network device configuration
>  #
>  
>  config NET_VENDOR_NI
> diff --git a/drivers/net/wireless/microchip/wilc1000/Kconfig b/drivers/net/wireless/microchip/wilc1000/Kconfig
> index 80c92e8bf8a5..7f15e42602dd 100644
> --- a/drivers/net/wireless/microchip/wilc1000/Kconfig
> +++ b/drivers/net/wireless/microchip/wilc1000/Kconfig
> @@ -44,4 +44,4 @@ config WILC1000_HW_OOB_INTR
>  	  chipset. This OOB interrupt is intended to provide a faster interrupt
>  	  mechanism for SDIO host controllers that don't support SDIO interrupt.
>  	  Select this option If the SDIO host controller in your platform
> -	  doesn't support SDIO time devision interrupt.
> +	  doesn't support SDIO time division interrupt.
> 

Messed this up. V2 coming soon.
