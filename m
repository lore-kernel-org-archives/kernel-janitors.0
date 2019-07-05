From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Fri, 05 Jul 2019 09:41:35 +0000
Subject: Re: [PATCH] ACPI: APD: remove redundant assignment to pointer clk
Message-Id: <2921052.OUaa6v4X4N@kreacher>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190702131029.9621-1-colin.king@canonical.com>
In-Reply-To: <20190702131029.9621-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday, July 2, 2019 3:10:29 PM CEST Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer clk is being initialized with a value that is never
> read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/acpi/acpi_apd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
> index ff47317d8ef1..7cd0c9ac71ea 100644
> --- a/drivers/acpi/acpi_apd.c
> +++ b/drivers/acpi/acpi_apd.c
> @@ -57,7 +57,7 @@ struct apd_private_data {
>  static int acpi_apd_setup(struct apd_private_data *pdata)
>  {
>  	const struct apd_device_desc *dev_desc = pdata->dev_desc;
> -	struct clk *clk = ERR_PTR(-ENODEV);
> +	struct clk *clk;
>  
>  	if (dev_desc->fixed_clk_rate) {
>  		clk = clk_register_fixed_rate(&pdata->adev->dev,
> 

Applied, thanks!
