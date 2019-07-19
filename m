From: Vignesh Raghavendra <vigneshr@ti.com>
Date: Fri, 19 Jul 2019 08:58:17 +0000
Subject: Re: [PATCH -next] mtd: hyperbus: fix build error about CONFIG_REGMAP
Message-Id: <a4c534c3-4105-08cd-874b-91d82f5a9199@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190719010703.63815-1-maowenan@huawei.com>
In-Reply-To: <20190719010703.63815-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, miquel.raynal@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 19/07/19 6:37 AM, Mao Wenan wrote:
> When CONFIG_MUX_MMIO and CONFIG_HBMC_AM654 are both 'm', there are
> some building error as below:
> 
> drivers/mux/mmio.c: In function mux_mmio_probe:
> drivers/mux/mmio.c:76:20: error: storage size of field isnt known
>    struct reg_field field;
>                     ^~~~~
> drivers/mux/mmio.c:102:15: error: implicit declaration of function devm_regmap_field_alloc; did you mean devm_mux_chip_alloc? [-Werror=implicit-function-declaration]
>    fields[i] = devm_regmap_field_alloc(dev, regmap, field);
>                ^~~~~~~~~~~~~~~~~~~~~~~
>                devm_mux_chip_alloc
> drivers/mux/mmio.c:76:20: warning: unused variable field [-Wunused-variable]
>    struct reg_field field;
>                     ^~~~~
> cc1: some warnings being treated as errors
> make[2]: *** [drivers/mux/mmio.o] Error 1
> make[1]: *** [drivers/mux] Error 2
> make[1]: *** Waiting for unfinished jobs....
> make: *** [drivers] Error 2
> 
> This because CONFIG_REGMAP is not enable, so change the Kconfig for HBMC_AM654.

Since, hbmc-am654.c does not use regmap APIs directly we don't need to
select REGMAP here. MUX_MMIO is optional for this driver, therefore I
have converted that to an imply clause and posted a fix here:
https://patchwork.ozlabs.org/patch/1133946/

Let me know if that fixes the issue. Thanks for the report!

Regards
Vignesh

> 
> Fixes: b07079f1642c("mtd: hyperbus: Add driver for TI's HyperBus memory controller")
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/mtd/hyperbus/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/hyperbus/Kconfig b/drivers/mtd/hyperbus/Kconfig
> index cff6bbd..f324fa6 100644
> --- a/drivers/mtd/hyperbus/Kconfig
> +++ b/drivers/mtd/hyperbus/Kconfig
> @@ -14,6 +14,8 @@ if MTD_HYPERBUS
>  
>  config HBMC_AM654
>  	tristate "HyperBus controller driver for AM65x SoC"
> +	select OF
> +	select REGMAP
>  	select MULTIPLEXER
>  	select MUX_MMIO
>  	help
> 

-- 
Regards
Vignesh
