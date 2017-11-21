From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date: Tue, 21 Nov 2017 10:30:24 +0000
Subject: Re: [PATCH] omapdrm: hdmi4_cec: signedness bug in hdmi4_cec_init()
Message-Id: <5c3892ea-3ec0-f82c-19d2-5a4c8221715d@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171027062705.tmmlbgerpb2v63bj@mwanda>
In-Reply-To: <20171027062705.tmmlbgerpb2v63bj@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On 27/10/17 09:27, Dan Carpenter wrote:
> "ret" needs to be signed for the error handling to work.
> 
> Fixes: 8d7f934df8d8 ("omapdrm: hdmi4_cec: add OMAP4 HDMI CEC support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
> index d86873f2abe6..e626eddf24d5 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
> @@ -352,7 +352,7 @@ int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
>  {
>  	const u32 caps = CEC_CAP_TRANSMIT | CEC_CAP_LOG_ADDRS |
>  			 CEC_CAP_PASSTHROUGH | CEC_CAP_RC;
> -	unsigned int ret;
> +	int ret;
>  
>  	core->adap = cec_allocate_adapter(&hdmi_cec_adap_ops, core,
>  		"omap4", caps, CEC_MAX_LOG_ADDRS);
> 

Thanks. I have picked this up.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
