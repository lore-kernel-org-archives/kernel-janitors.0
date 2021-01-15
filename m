From: Tony Lindgren <tony@atomide.com>
Date: Fri, 15 Jan 2021 13:24:17 +0000
Subject: Re: [PATCH][next] power: supply: cpcap-charger: Fix power_supply_put on null battery pointer
Message-Id: <YAGXgWeWvy/0FyqN@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210115131524.71339-1-colin.king@canonical.com>
In-Reply-To: <20210115131524.71339-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

* Colin King <colin.king@canonical.com> [210115 13:15]:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if the pointer battery is null there is a null pointer
> dereference on the call to power_supply_put.  Fix this by only
> performing the put if battery is not null.
> 
> Addresses-Coverity: ("Dereference after null check")
> Fixes: 4bff91bb3231 ("power: supply: cpcap-charger: Fix missing power_supply_put()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Oopsie, thanks for fixing it:

Acked-by: Tony Lindgren <tony@atomide.com>


>  drivers/power/supply/cpcap-charger.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
> index 823d666f09e0..641dcad1133f 100644
> --- a/drivers/power/supply/cpcap-charger.c
> +++ b/drivers/power/supply/cpcap-charger.c
> @@ -300,8 +300,9 @@ cpcap_charger_get_bat_const_charge_voltage(struct cpcap_charger_ddata *ddata)
>  				&prop);
>  		if (!error)
>  			voltage = prop.intval;
> +
> +		power_supply_put(battery);
>  	}
> -	power_supply_put(battery);
>  
>  	return voltage;
>  }
> -- 
> 2.29.2
> 
