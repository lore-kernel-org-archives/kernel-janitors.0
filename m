From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 28 Jul 2020 22:37:39 +0000
Subject: Re: [PATCH][next] drm: xln: fix spelling mistake "failes" -> "failed"
Message-Id: <20200728223739.GV13753@pendragon.ideasonboard.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200724111258.14762-1-colin.king@canonical.com>
In-Reply-To: <20200724111258.14762-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Colin,

Thank you for the patch.

On Fri, Jul 24, 2020 at 12:12:58PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_dbg messages. Fix it.

There is a spelling mistake in the commit message, s/xln/xlnx/ ;-)

> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 821f7a71e182..0e1c818746eb 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1308,7 +1308,7 @@ zynqmp_dp_connector_detect(struct drm_connector *connector, bool force)
>  		ret = drm_dp_dpcd_read(&dp->aux, 0x0, dp->dpcd,
>  				       sizeof(dp->dpcd));
>  		if (ret < 0) {
> -			dev_dbg(dp->dev, "DPCD read failes");
> +			dev_dbg(dp->dev, "DPCD read failed");
>  			goto disconnected;
>  		}
>  

-- 
Regards,

Laurent Pinchart
