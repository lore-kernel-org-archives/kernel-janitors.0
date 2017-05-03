From: "H. Nikolaus Schaller" <hns@goldelico.com>
Date: Wed, 03 May 2017 12:25:57 +0000
Subject: Re: [PATCH] power: supply: twl4030-charger: make twl4030_bci_property_is_writeable static
Message-Id: <84E3CDD6-1B1D-4316-B23A-8F43B3C2E397@goldelico.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170503103357.22598-1-colin.king@canonical.com>
In-Reply-To: <20170503103357.22598-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Sebastian Reichel <sre@kernel.org>
Cc: Linux PM mailing list <linux-pm@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Colin,

> Am 03.05.2017 um 12:33 schrieb Colin King <colin.king@canonical.com>:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function twl4030_bci_property_is_writeable can be made static
> as it does not need to be in global scope.

Indeed. Have tested and it still works.

> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> drivers/power/supply/twl4030_charger.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/power/supply/twl4030_charger.c b/drivers/power/supply/twl4030_charger.c
> index abd10f6861ae..2f82d0e9ec1b 100644
> --- a/drivers/power/supply/twl4030_charger.c
> +++ b/drivers/power/supply/twl4030_charger.c
> @@ -943,7 +943,7 @@ static int twl4030_bci_set_property(struct power_supply *psy,
> 	return 0;
> }
> 
> -int twl4030_bci_property_is_writeable(struct power_supply *psy,
> +static int twl4030_bci_property_is_writeable(struct power_supply *psy,
> 				      enum power_supply_property psp)
> {
> 	switch (psp) {
> -- 
> 2.11.0
> 

Thanks and BR,
Nikolaus

