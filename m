From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 18 Jun 2020 08:40:26 +0000
Subject: Re: [PATCH][next] usb: xhci: fix spelling mistake in Kconfig "firwmare" -> "firmware"
Message-Id: <20200618084026.GA1073692@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200603121152.16550-1-colin.king@canonical.com>
In-Reply-To: <20200603121152.16550-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 03, 2020 at 01:11:52PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are two spelling mistakes in the Kconfig text. Fix these.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/host/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 62c348062e48..5f4b6c71392c 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -44,10 +44,10 @@ config USB_XHCI_PCI
>  	default y
>  
>  config USB_XHCI_PCI_RENESAS
> -	tristate "Support for additional Renesas xHCI controller with firwmare"
> +	tristate "Support for additional Renesas xHCI controller with firmware"
>  	---help---
>  	  Say 'Y' to enable the support for the Renesas xHCI controller with
> -	  firwmare. Make sure you have the firwmare for the device and
> +	  firmware. Make sure you have the firwmare for the device and
>  	  installed on your system for this device to work.
>  	  If unsure, say 'N'.
>  
> -- 
> 2.25.1
> 

Does not apply to my tree :(
