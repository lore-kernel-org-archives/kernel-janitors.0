From: Peter Chen <hzpeterchen@gmail.com>
Date: Thu, 20 Sep 2018 03:33:35 +0000
Subject: Re: [PATCH] usb: phy: mxs: fix spelling mistake "stardard" -> "standard"
Message-Id: <CAL411-pJT8AkmFpS__X9=JOd971-uxBUHVEUbnqBhe19SqXmYw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180918065411.30625-1-colin.king@canonical.com>
In-Reply-To: <20180918065411.30625-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: balbi@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On Tue, Sep 18, 2018 at 2:55 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Trivial fix to spelling mistake in dev_dbg message
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index e5aa24c1e4fd..1b1bb0ad40c3 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -563,7 +563,7 @@ static enum usb_charger_type mxs_charger_primary_detection(struct mxs_phy *x)
>         regmap_read(regmap, ANADIG_USB1_CHRG_DET_STAT, &val);
>         if (!(val & ANADIG_USB1_CHRG_DET_STAT_CHRG_DETECTED)) {
>                 chgr_type = SDP_TYPE;
> -               dev_dbg(x->phy.dev, "It is a stardard downstream port\n");
> +               dev_dbg(x->phy.dev, "It is a standard downstream port\n");
>         }
>
>         /* Disable charger detector */
> --
> 2.17.1
>

Acked-by: Peter Chen <peter.chen@nxp.com>
