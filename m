From: Michael Buesch <mb@bu3sch.de>
Date: Sun, 23 Aug 2009 00:06:57 +0000
Subject: Re: [PATCH] gpio: adding __init/__exit macros in drivers/gpio/bt8xxgpio.c
Message-Id: <200908230206.57937.mb@bu3sch.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200908230201.10471.PeterHuewe@gmx.de>
In-Reply-To: <200908230201.10471.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <PeterHuewe@gmx.de>
Cc: Jiri Kosina <trivial@kernel.org>, Kay Sievers <kay.sievers@vrfy.org>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sunday 23 August 2009 02:01:10 Peter Huewe wrote:
> From: Peter Huewe <peterhuewe@gmx.de>
> 
> Trivial patch which adds the __init/__exit macro to the init/exit functions of
> drivers/gpio/bt8xxgpio.c
> 
> Michael, Kay or Greg, please have a look at the small patch and either pull it
> through your tree, or please ack' it so Jiri can pull it through the trivial
> tree.
> 
> linux version 2.6.31-rc7 - linus git tree, So 23. Aug 01:38:43 CEST 2009
> 
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>

Acked-by: Michael Buesch <mb@bu3sch.de>

> ---
> diff --git a/drivers/gpio/bt8xxgpio.c b/drivers/gpio/bt8xxgpio.c
> index 984b587..5590414 100644
> --- a/drivers/gpio/bt8xxgpio.c
> +++ b/drivers/gpio/bt8xxgpio.c
> @@ -331,13 +331,13 @@ static struct pci_driver bt8xxgpio_pci_driver = {
>  	.resume		= bt8xxgpio_resume,
>  };
>  
> -static int bt8xxgpio_init(void)
> +static int __init bt8xxgpio_init(void)
>  {
>  	return pci_register_driver(&bt8xxgpio_pci_driver);
>  }
>  module_init(bt8xxgpio_init)
>  
> -static void bt8xxgpio_exit(void)
> +static void __exit bt8xxgpio_exit(void)
>  {
>  	pci_unregister_driver(&bt8xxgpio_pci_driver);
>  }
> 
> 



-- 
Greetings, Michael.
