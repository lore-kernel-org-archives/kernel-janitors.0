From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 05 Feb 2019 03:37:40 +0000
Subject: Re: [PATCH][V2][next] regulator: axp20x: check rdev is null before dereferencing it
Message-Id: <CAGb2v6597uiPec=BPvTZgppxF2upTa_zKHq+QSbddyMGJAd7uA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181222113159.31029-1-colin.king@canonical.com>
In-Reply-To: <20181222113159.31029-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Sat, Dec 22, 2018 at 7:32 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently rdev is dereferenced when assigning desc before rdev is null
> checked, hence there is a potential null pointer dereference on rdev.
> Fix this by null checking rdev first.
>
> Detected by CoverityScan, CID#1476031 ("Dereference before null check")
>
> Fixes: 77e3e3b165db ("regulator: axp20x: add software based soft_start for AXP209 LDO3")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

This patch somehow fell through the cracks. Sorry about that.

Both are really false positives. Both functions are callbacks for the
regulator core to use. If you look through the core code, rdev->desc->ops
is used to check for these callbacks before they are called. rdev is always
passed in, and rdev->desc is always valid after regulator_register.

ChenYu


> ---
>
> V2: Fix 2nd occurrance of this thinko
>
> ---
>  drivers/regulator/axp20x-regulator.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
> index 48af859fd053..0dfa4ea6bbdf 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c
> @@ -367,7 +367,7 @@ static const int axp209_dcdc2_ldo3_slew_rates[] = {
>  static int axp20x_set_ramp_delay(struct regulator_dev *rdev, int ramp)
>  {
>         struct axp20x_dev *axp20x = rdev_get_drvdata(rdev);
> -       const struct regulator_desc *desc = rdev->desc;
> +       const struct regulator_desc *desc;
>         u8 reg, mask, enable, cfg = 0xff;
>         const int *slew_rates;
>         int rate_count = 0;
> @@ -375,6 +375,8 @@ static int axp20x_set_ramp_delay(struct regulator_dev *rdev, int ramp)
>         if (!rdev)
>                 return -EINVAL;
>
> +       desc = rdev->desc;
> +
>         switch (axp20x->variant) {
>         case AXP209_ID:
>                 if (desc->id = AXP20X_DCDC2) {
> @@ -436,11 +438,13 @@ static int axp20x_set_ramp_delay(struct regulator_dev *rdev, int ramp)
>  static int axp20x_regulator_enable_regmap(struct regulator_dev *rdev)
>  {
>         struct axp20x_dev *axp20x = rdev_get_drvdata(rdev);
> -       const struct regulator_desc *desc = rdev->desc;
> +       const struct regulator_desc *desc;
>
>         if (!rdev)
>                 return -EINVAL;
>
> +       desc = rdev->desc;
> +
>         switch (axp20x->variant) {
>         case AXP209_ID:
>                 if ((desc->id = AXP20X_LDO3) &&
> --
> 2.19.1
>
