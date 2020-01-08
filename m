From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 08 Jan 2020 22:29:24 +0000
Subject: Re: [PATCH] power: avs: qcom-cpr: Fix error code in cpr_fuse_corner_init()
Message-Id: <CAJZ5v0hwo_NzspnM551DjJOKsJNV8ssT_FKwpj3qfhZ+r-ebJg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108053418.tjc62uppube6q4q3@kili.mountain>
In-Reply-To: <20200108053418.tjc62uppube6q4q3@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andy Gross <agross@kernel.org>, Niklas Cassel <niklas.cassel@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Kevin Hilman <khilman@kernel.org>, Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Linux PM <linux-pm@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jan 8, 2020 at 6:34 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We're returning the wrong variable.  "ret" isn't initialized.
>
> Fixes: bf6910abf548 ("power: avs: Add support for CPR (Core Power Reduction)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/power/avs/qcom-cpr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/power/avs/qcom-cpr.c b/drivers/power/avs/qcom-cpr.c
> index 9247f53550b3..0321729431a5 100644
> --- a/drivers/power/avs/qcom-cpr.c
> +++ b/drivers/power/avs/qcom-cpr.c
> @@ -922,7 +922,7 @@ static int cpr_fuse_corner_init(struct cpr_drv *drv)
>                 uV = cpr_read_fuse_uV(desc, fdata, fuses->init_voltage,
>                                       step_volt, drv);
>                 if (uV < 0)
> -                       return ret;
> +                       return uV;
>
>                 fuse->min_uV = fdata->min_uV;
>                 fuse->max_uV = fdata->max_uV;
> --

Thanks for the fix, but this issue has been fixed already.
