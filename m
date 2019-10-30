From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Wed, 30 Oct 2019 12:53:00 +0000
Subject: Re: [PATCH][next] drivers: thermal: tsens: fix potential integer overflow on multiply
Message-Id: <CAHLCerNvsZDT-FF4a+wsCqi4Fwf04e-rzaVq0qwsUtEWQL6kSQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191022114910.652-1-colin.king@canonical.com> <cc9ea171-dfdc-f28e-59a4-26ab55155b8b@linaro.org>
In-Reply-To: <cc9ea171-dfdc-f28e-59a4-26ab55155b8b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Colin King <colin.king@canonical.com>, Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Stephen Boyd <swboyd@chromium.org>, Linux PM list <linux-pm@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Oct 30, 2019 at 1:10 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 22/10/2019 13:49, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently a multiply operation is being performed on two int values
> > and the result is being assigned to a u64, presumably because the
> > end result is expected to be probably larger than an int. However,
> > because the multiply is an int multiply one can get overflow. Avoid
> > the overflow by casting degc to a u64 to force a u64 multiply.
> >
> > Addresses-Coverity: ("Unintentional integer overflow")
> > Fixes: fbfe1a042cfd ("drivers: thermal: tsens: Add interrupt support")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/thermal/qcom/tsens-common.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> > index 03bf1b8133ea..3d7855106ecd 100644
> > --- a/drivers/thermal/qcom/tsens-common.c
> > +++ b/drivers/thermal/qcom/tsens-common.c
> > @@ -92,7 +92,7 @@ void compute_intercept_slope(struct tsens_priv *priv, u32 *p1,
> >
> >  static inline u32 degc_to_code(int degc, const struct tsens_sensor *s)
> >  {
> > -     u64 code = (degc * s->slope + s->offset) / SLOPE_FACTOR;
> > +     u64 code = ((u64)degc * s->slope + s->offset) / SLOPE_FACTOR;
>
>
> -       u64 code = ((u64)degc * s->slope + s->offset) / SLOPE_FACTOR;
> +       u64 code = div_u64(((u64)degc * s->slope + s->offset),
> SLOPE_FACTOR);

This implementation should handle 32-bit architectures too. Colin,
could you respin?

Regards,
Amit
