From: Guenter Roeck <linux@roeck-us.net>
Date: Fri, 01 Sep 2017 14:20:24 +0000
Subject: Re: [PATCH][staging-next] staging: typec: fusb302: make structure fusb302_psy_desc static
Message-Id: <20170901142023.GA599@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170901102057.17637-1-colin.king@canonical.com>
In-Reply-To: <20170901102057.17637-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Yueyao Zhu <yueyao.zhu@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Guru Das Srinagesh <gurooodas@gmail.com>, Frans Klaver <fransklaver@gmail.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 01, 2017 at 11:20:57AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The const structure fusb302_psy_desc is local to the source and
> does not need to be in global scope, so make it static.
> 
> Cleans up sparse warnings
> symbol 'fusb302_psy_desc' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/staging/typec/fusb302/fusb302.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/typec/fusb302/fusb302.c b/drivers/staging/typec/fusb302/fusb302.c
> index cf6355f59cd9..fc6a3cf74eb3 100644
> --- a/drivers/staging/typec/fusb302/fusb302.c
> +++ b/drivers/staging/typec/fusb302/fusb302.c
> @@ -1723,7 +1723,7 @@ static enum power_supply_property fusb302_psy_properties[] = {
>  	POWER_SUPPLY_PROP_CURRENT_MAX,
>  };
>  
> -const struct power_supply_desc fusb302_psy_desc = {
> +static const struct power_supply_desc fusb302_psy_desc = {
>  	.name		= "fusb302-typec-source",
>  	.type		= POWER_SUPPLY_TYPE_USB_TYPE_C,
>  	.properties	= fusb302_psy_properties,
> -- 
> 2.14.1
> 
