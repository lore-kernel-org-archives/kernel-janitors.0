From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date: Tue, 21 Nov 2017 10:31:30 +0000
Subject: Re: [PATCH] omapdrm: hdmi4_cec: fix unsigned int comparison with less than zero
Message-Id: <5bbb40cc-fcdf-0514-7dd1-c4a1074c977f@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171117184956.3092-1-colin.king@canonical.com>
In-Reply-To: <20171117184956.3092-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On 17/11/17 20:49, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The two comparisons of the unsigned int ret for -ve error returns is
> always false because ret is unsigned. Fix this by making ret a signed
> int.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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

Thanks. There was an earlier patch from Dan Carpenter for this, which I
have applied.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
