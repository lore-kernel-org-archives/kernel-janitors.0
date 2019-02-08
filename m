From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 08 Feb 2019 11:52:36 +0000
Subject: Re: [PATCH] mmc: cb710: fix indentation issue in if block
Message-Id: <CAPDyKFoU6rQa+WdHUSYHmaoxjgVkUqzhB9Scs40dQS6KsSGvow@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190207125906.3084-1-colin.king@canonical.com>
In-Reply-To: <20190207125906.3084-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 7 Feb 2019 at 14:00, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is an if block that is not indented, fix this.  Also add a
> break statement on the default case to clean up a cppcheck warning.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/cb710-mmc.c | 42 +++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/mmc/host/cb710-mmc.c b/drivers/mmc/host/cb710-mmc.c
> index 1087b4c79cd6..4c477dcd2ada 100644
> --- a/drivers/mmc/host/cb710-mmc.c
> +++ b/drivers/mmc/host/cb710-mmc.c
> @@ -566,30 +566,32 @@ static void cb710_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>
>         cb710_mmc_select_clock_divider(mmc, ios->clock);
>
> -       if (ios->power_mode != reader->last_power_mode)
> -       switch (ios->power_mode) {
> -       case MMC_POWER_ON:
> -               err = cb710_mmc_powerup(slot);
> -               if (err) {
> -                       dev_warn(cb710_slot_dev(slot),
> -                               "powerup failed (%d)- retrying\n", err);
> -                       cb710_mmc_powerdown(slot);
> -                       udelay(1);
> +       if (ios->power_mode != reader->last_power_mode) {
> +               switch (ios->power_mode) {
> +               case MMC_POWER_ON:
>                         err = cb710_mmc_powerup(slot);
> -                       if (err)
> +                       if (err) {
>                                 dev_warn(cb710_slot_dev(slot),
> -                                       "powerup retry failed (%d) - expect errors\n",
> +                                       "powerup failed (%d)- retrying\n", err);
> +                               cb710_mmc_powerdown(slot);
> +                               udelay(1);
> +                               err = cb710_mmc_powerup(slot);
> +                               if (err)
> +                                       dev_warn(cb710_slot_dev(slot),
> +                                               "powerup retry failed (%d) - expect errors\n",
>                                         err);
> +                       }
> +                       reader->last_power_mode = MMC_POWER_ON;
> +                       break;
> +               case MMC_POWER_OFF:
> +                       cb710_mmc_powerdown(slot);
> +                       reader->last_power_mode = MMC_POWER_OFF;
> +                       break;
> +               case MMC_POWER_UP:
> +               default:
> +                       /* ignore */
> +                       break;
>                 }
> -               reader->last_power_mode = MMC_POWER_ON;
> -               break;
> -       case MMC_POWER_OFF:
> -               cb710_mmc_powerdown(slot);
> -               reader->last_power_mode = MMC_POWER_OFF;
> -               break;
> -       case MMC_POWER_UP:
> -       default:
> -               /* ignore */;
>         }
>
>         cb710_mmc_enable_4bit_data(slot, ios->bus_width != MMC_BUS_WIDTH_1);
> --
> 2.20.1
>
