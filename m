From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 02 Jul 2018 08:34:08 +0000
Subject: Re: [PATCH] drm/msm/adreno: Remove VLA usage
Message-Id: <b531d35a-631f-c84c-831d-9ce6cff02436@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180629184818.GA37439@beast>
In-Reply-To: <20180629184818.GA37439@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kees Cook <keescook@chromium.org>, Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>, Jordan Crouse <jcrouse@codeaurora.org>

> @@ -91,12 +93,13 @@  static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname)
>  		ret = qcom_mdt_load(dev, fw, fwname, GPU_PAS_ID,
>  				mem_region, mem_phys, mem_size, NULL);
>  	} else {
> -		char newname[strlen("qcom/") + strlen(fwname) + 1];
> +		char *newname;
> 
> -		sprintf(newname, "qcom/%s", fwname);
> +		newname = kasprintf(GFP_KERNEL, "qcom/%s", fwname);
> 
>  		ret = qcom_mdt_load(dev, fw, newname, GPU_PAS_ID,
>  				mem_region, mem_phys, mem_size, NULL);

I have taken another look also at this update suggestion.
Now I wonder why the return value is not checked for the added name construction
in the way as it is specified for the function “adreno_request_fw”.
Will another condition check make sense at this place?

Regards,
Markus
