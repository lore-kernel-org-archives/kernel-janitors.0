From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Mar 2020 14:25:52 +0000
Subject: Re: [PATCH] drm/amd/display: Possible divide by zero in set_speed()
Message-Id: <CADnq5_POLvoLi=1TprgH7jFn3TAJw37_P+1-VngxWtYTi1xmoA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200131045739.ault4d6yk2lqlbed@kili.mountain>
In-Reply-To: <20200131045739.ault4d6yk2lqlbed@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lewis Huang <Lewis.Huang@amd.com>, Jun Lei <Jun.Lei@amd.com>, Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>, kernel-janitors@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Derek Lai <Derek.Lai@amd.com>, Tony Cheng <Tony.Cheng@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

Applied.  Thanks!

Alex

On Thu, Jan 30, 2020 at 11:58 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If "speed" is zero then we use it as a divisor to find "prescale".  It's
> better to move the check for zero to the very start of the function.
>
> Fixes: 9eeec26a1339 ("drm/amd/display: Refine i2c frequency calculating sequence")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c
> index 066188ba7949..24adec407972 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c
> @@ -267,6 +267,9 @@ static void set_speed(
>         uint32_t xtal_ref_div = 0;
>         uint32_t prescale = 0;
>
> +       if (speed = 0)
> +               return;
> +
>         REG_GET(MICROSECOND_TIME_BASE_DIV, XTAL_REF_DIV, &xtal_ref_div);
>
>         if (xtal_ref_div = 0)
> @@ -274,17 +277,15 @@ static void set_speed(
>
>         prescale = ((dce_i2c_hw->reference_frequency * 2) / xtal_ref_div) / speed;
>
> -       if (speed) {
> -               if (dce_i2c_hw->masks->DC_I2C_DDC1_START_STOP_TIMING_CNTL)
> -                       REG_UPDATE_N(SPEED, 3,
> -                                    FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_PRESCALE), prescale,
> -                                    FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_THRESHOLD), 2,
> -                                    FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_START_STOP_TIMING_CNTL), speed > 50 ? 2:1);
> -               else
> -                       REG_UPDATE_N(SPEED, 2,
> -                                    FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_PRESCALE), prescale,
> -                                    FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_THRESHOLD), 2);
> -       }
> +       if (dce_i2c_hw->masks->DC_I2C_DDC1_START_STOP_TIMING_CNTL)
> +               REG_UPDATE_N(SPEED, 3,
> +                            FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_PRESCALE), prescale,
> +                            FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_THRESHOLD), 2,
> +                            FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_START_STOP_TIMING_CNTL), speed > 50 ? 2:1);
> +       else
> +               REG_UPDATE_N(SPEED, 2,
> +                            FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_PRESCALE), prescale,
> +                            FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_THRESHOLD), 2);
>  }
>
>  static bool setup_engine(
> --
> 2.11.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
