From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Mar 2016 20:09:15 +0000
Subject: Re: [patch 2/2] drm/exynos: mic: remove some dead code
Message-Id: <20160325200915.GG30221@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160317103912.GB3100@mwanda>
 <56F4FC08.6090009@samsung.com>
In-Reply-To: <56F4FC08.6090009@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Inki Dae <inki.dae@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>

On Fri, Mar 25, 2016 at 05:51:20PM +0900, Inki Dae wrote:
> Hi Dan,
> 
> 2016년 03월 17일 19:39에 Dan Carpenter 이(가) 쓴 글:
> > We know "ret" is zero and the test makes static checkers complain so
> > let's delete this printk.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> > index 890c9b1..12db353 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> > @@ -130,8 +130,6 @@ static void mic_set_path(struct exynos_mic *mic, bool enable)
> >  		val &= ~(MIC0_RGB_MUX | MIC0_I80_MUX | MIC0_ON_MUX);
> >  
> >  	regmap_write(mic->sysreg, DSD_CFG_MUX, val);
> > -	if (ret)
> > -		DRM_ERROR("mic: Failed to read system register\n");
> 
> I think we missed to keep return value from regmap_write function,
> 	ret = regmap_write(mic->sysreg, ....);
> 	if (ret)
> 		...

Yeah.  You're right.

regards,
dan carpenter

