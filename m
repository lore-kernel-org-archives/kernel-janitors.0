From: walter harms <wharms@bfs.de>
Date: Tue, 25 Jun 2019 07:48:11 +0000
Subject: Re: [PATCH][next] media: vivid: fix potential integer overflow on left shift
Message-Id: <5D11D1BB.5070701@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190624215804.12122-1-colin.king@canonical.com>
In-Reply-To: <20190624215804.12122-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Am 24.06.2019 23:58, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a potential integer overflow when int 2 is left shifted
> as this is evaluated using 32 bit arithmetic but is being used in
> a context that expects an expression of type s64.  Fix this by
> shifting 2ULL to avoid a 32 bit overflow.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: 8a99e9faa131 ("media: vivid: add HDMI (dis)connect RX emulation")
> Fixes: 79a792dafac6 ("media: vivid: add HDMI (dis)connect TX emulation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/platform/vivid/vivid-ctrls.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
> index 3e916c8befb7..8f340cfd6993 100644
> --- a/drivers/media/platform/vivid/vivid-ctrls.c
> +++ b/drivers/media/platform/vivid/vivid-ctrls.c
> @@ -1634,8 +1634,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  			0, V4L2_DV_RGB_RANGE_AUTO);
>  		dev->ctrl_rx_power_present = v4l2_ctrl_new_std(hdl_vid_cap,
>  			NULL, V4L2_CID_DV_RX_POWER_PRESENT, 0,
> -			(2 << (dev->num_hdmi_inputs - 1)) - 1, 0,
> -			(2 << (dev->num_hdmi_inputs - 1)) - 1);
> +			(2ULL << (dev->num_hdmi_inputs - 1)) - 1, 0,
> +			(2ULL << (dev->num_hdmi_inputs - 1)) - 1);
>  
>  	}
>  	if (dev->num_hdmi_outputs) {
> @@ -1653,16 +1653,16 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  			&vivid_ctrl_display_present, NULL);
>  		dev->ctrl_tx_hotplug = v4l2_ctrl_new_std(hdl_vid_out,
>  			NULL, V4L2_CID_DV_TX_HOTPLUG, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1);
> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1, 0,
> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1);
>  		dev->ctrl_tx_rxsense = v4l2_ctrl_new_std(hdl_vid_out,
>  			NULL, V4L2_CID_DV_TX_RXSENSE, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1);
> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1, 0,
> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1);
>  		dev->ctrl_tx_edid_present = v4l2_ctrl_new_std(hdl_vid_out,
>  			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1);
> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1, 0,
> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1);
>  	}
>  	if ((dev->has_vid_cap && dev->has_vid_out) ||
>  	    (dev->has_vbi_cap && dev->has_vbi_out))


To make this more readable for humans, it could help to store
 (2ULL << (dev->num_hdmi_outputs - 1)) - 1 in an intermediate.
like:
s64 hdmi=(2ULL << (dev->num_hdmi_outputs - 1)) - 1;

  		dev->ctrl_tx_edid_present = v4l2_ctrl_new_std(hdl_vid_out,
  			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0,
			hdmi, 0,hdmi);


just my 2 cents,

re,
 wh
