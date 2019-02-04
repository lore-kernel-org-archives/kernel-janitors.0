From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Feb 2019 19:30:42 +0000
Subject: Re: [PATCH][V2][next] regulator: axp20x: check rdev is null before dereferencing it
Message-Id: <20190204193042.GD2563@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181222113159.31029-1-colin.king@canonical.com>
 <66f320fe-7df1-2715-ec55-ef7dc3493aa0@canonical.com>
In-Reply-To: <66f320fe-7df1-2715-ec55-ef7dc3493aa0@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 04, 2019 at 07:13:30PM +0000, Colin Ian King wrote:
> >  drivers/regulator/axp20x-regulator.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
> > index 48af859fd053..0dfa4ea6bbdf 100644
> > --- a/drivers/regulator/axp20x-regulator.c
> > +++ b/drivers/regulator/axp20x-regulator.c
> > @@ -367,7 +367,7 @@ static const int axp209_dcdc2_ldo3_slew_rates[] = {
> >  static int axp20x_set_ramp_delay(struct regulator_dev *rdev, int ramp)
> >  {
> >  	struct axp20x_dev *axp20x = rdev_get_drvdata(rdev);
> > -	const struct regulator_desc *desc = rdev->desc;
> > +	const struct regulator_desc *desc;

This is only called from set_machine_constraints() so "rdev" can't be
NULL.  (On my allmodonconfig build).

> >  	u8 reg, mask, enable, cfg = 0xff;
> >  	const int *slew_rates;
> >  	int rate_count = 0;
> > @@ -375,6 +375,8 @@ static int axp20x_set_ramp_delay(struct regulator_dev *rdev, int ramp)
> >  	if (!rdev)
> >  		return -EINVAL;
> >  
> > +	desc = rdev->desc;
> > +
> >  	switch (axp20x->variant) {
> >  	case AXP209_ID:
> >  		if (desc->id = AXP20X_DCDC2) {
> > @@ -436,11 +438,13 @@ static int axp20x_set_ramp_delay(struct regulator_dev *rdev, int ramp)
> >  static int axp20x_regulator_enable_regmap(struct regulator_dev *rdev)
> >  {
> >  	struct axp20x_dev *axp20x = rdev_get_drvdata(rdev);
> > -	const struct regulator_desc *desc = rdev->desc;
> > +	const struct regulator_desc *desc;
> >  
> >  	if (!rdev)
> >  		return -EINVAL;
> >  
> > +	desc = rdev->desc;

Called from _regulator_do_enable() and rdev can't be NULL:

	ret = rdev->desc->ops->enable(rdev);

regards,
dan carpenter
