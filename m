From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 07 Jan 2020 10:59:05 +0000
Subject: Re: [PATCH][next] power: avs: fix uninitialized error return on failed cpr_read_fuse_uV call
Message-Id: <CAJZ5v0jxEv8UKUuf+PBtaGR95Dpie3vdSOd=VDw21RgYTqM5DQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200106120558.37758-1-colin.king@canonical.com> <20200106191458.GV3755841@builder>
In-Reply-To: <20200106191458.GV3755841@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Colin King <colin.king@canonical.com>
Cc: Andy Gross <agross@kernel.org>, Niklas Cassel <niklas.cassel@linaro.org>, Kevin Hilman <khilman@kernel.org>, Nishanth Menon <nm@ti.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jan 6, 2020 at 8:15 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 06 Jan 04:05 PST 2020, Colin King wrote:
>
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently when the call cpr_read_fuse_uV returns an error the value in the
> > uninitialized variable ret is returned. Fix this by instread returning the
> > error value in the variable uV.
> >
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Applied, thanks!

> > Addresses-Coverity: ("Uninitialized scalar variable")
> > Fixes: bf6910abf548 ("power: avs: Add support for CPR (Core Power Reduction)")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/power/avs/qcom-cpr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/power/avs/qcom-cpr.c b/drivers/power/avs/qcom-cpr.c
> > index 9247f53550b3..0321729431a5 100644
> > --- a/drivers/power/avs/qcom-cpr.c
> > +++ b/drivers/power/avs/qcom-cpr.c
> > @@ -922,7 +922,7 @@ static int cpr_fuse_corner_init(struct cpr_drv *drv)
> >               uV = cpr_read_fuse_uV(desc, fdata, fuses->init_voltage,
> >                                     step_volt, drv);
> >               if (uV < 0)
> > -                     return ret;
> > +                     return uV;
> >
> >               fuse->min_uV = fdata->min_uV;
> >               fuse->max_uV = fdata->max_uV;
> > --
