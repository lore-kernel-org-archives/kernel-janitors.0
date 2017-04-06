From: Neil Armstrong <narmstrong@baylibre.com>
Date: Thu, 06 Apr 2017 08:58:56 +0000
Subject: Re: [PATCH] drm: bridge: dw-hdmi: Add a missing break statement
Message-Id: <6fa17233-9941-5dd6-f3e4-3afc52c30bf4@baylibre.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170406052132.GA26605@mwanda>
 <757bc9ac-9e17-cd19-e805-5fa4a19d225b@baylibre.com>
In-Reply-To: <757bc9ac-9e17-cd19-e805-5fa4a19d225b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Archit Taneja <architt@codeaurora.org>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

On 04/06/2017 09:41 AM, Neil Armstrong wrote:
> On 04/06/2017 07:21 AM, Dan Carpenter wrote:
>> There was supposed to be a break before the next case statement.
>>
>> Fixes: def23aa7e982 ("drm: bridge: dw-hdmi: Switch to V4L bus format and encodings")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 84cc949eae2b..8b605039c613 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -1318,6 +1318,7 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
>>  			frame.colorimetry = HDMI_COLORIMETRY_ITU_601;
>>  		frame.extended_colorimetry >>  				HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
>> +		break;
>>  	case V4L2_YCBCR_ENC_709:
>>  		if (hdmi->hdmi_data.enc_in_encoding = V4L2_YCBCR_ENC_XV709)
>>  			frame.colorimetry = HDMI_COLORIMETRY_EXTENDED;
>>
> 
> Thanks for the fix !
> 
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> 

Applied to drm-misc-next

Thanks,
Neil
