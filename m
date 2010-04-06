From: Shaohua Li <shaohua.li@intel.com>
Date: Tue, 06 Apr 2010 01:21:13 +0000
Subject: Re: [patch v2] acpi_pad: "processor_aggregator" name too long
Message-Id: <20100406012113.GA18672@sli10-desk.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100319114806.GN5331@bicker>
 <20100325142738.GD1602@ucw.cz>
 <20100325144122.GF5069@bicker>
In-Reply-To: <20100325144122.GF5069@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Pavel Machek <pavel@ucw.cz>, Len Brown <lenb@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Chen Gong <gong.chen@linux.intel.com>, Peter

On Thu, Mar 25, 2010 at 10:41:22PM +0800, Dan Carpenter wrote:
> cpi_device_class can only be 19 characters and a NULL terminator.
> 
> With the current name we get a buffer overflow in acpi_pad_add()
> 	strcpy(acpi_device_class(device), ACPI_PROCESSOR_AGGREGATOR_CLASS);
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> V2: Thanks to Pavel Machek for coming up with the right name for this.
> 
> diff --git a/drivers/acpi/acpi_pad.c b/drivers/acpi/acpi_pad.c
> index 7e52295..790aaa1 100644
> --- a/drivers/acpi/acpi_pad.c
> +++ b/drivers/acpi/acpi_pad.c
> @@ -30,7 +30,7 @@
>  #include <acpi/acpi_bus.h>
>  #include <acpi/acpi_drivers.h>
>  
> -#define ACPI_PROCESSOR_AGGREGATOR_CLASS	"processor_aggregator"
> +#define ACPI_PROCESSOR_AGGREGATOR_CLASS	"cpu_aggregator"
>  #define ACPI_PROCESSOR_AGGREGATOR_DEVICE_NAME "Processor Aggregator"
>  #define ACPI_PROCESSOR_AGGREGATOR_NOTIFY 0x80
>  static DEFINE_MUTEX(isolated_cpus_lock);
sorry for being later to reply. Better the name could be 'acpi_pad', which
is what the spec called. cpu_aggregator looks like a invented name.

Thanks,
Shaohua
