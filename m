From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 14 Jun 2020 13:05:46 +0000
Subject: Re: [PATCH] drm/amdgpu: fix ref count leak in amdgpu_display_crtc_set_config
Message-Id: <241aaf11-d4a0-e5a9-9744-75839006c128@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Shirish S <shirish.s@amd.com>, Navid Emamdoost <emamd001@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Alex Deucher <alexander.deucher@amd.com>, Yu Kuai <yukuai3@huawei.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>

> in amdgpu_display_crtc_set_config, …

* Can the term “reference count” become relevant also for this commit message
  besides other possible adjustments?

* Can it be nicer to combine proposed updates for this software module
  as a patch series (with a cover letter)?

* Would you like to add the tag “Fixes”?


…
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
…
> @@ -306,6 +306,7 @@  int amdgpu_display_crtc_set_config(struct drm_mode_set *set,
>  		adev->have_disp_power_ref = false;
>  	}
>
> +out:
>  	/* drop the power reference we got coming in here */
>  	pm_runtime_put_autosuspend(dev->dev);
>  	return ret;

Perhaps use the label “put_runtime” instead?

Regards,
Markus
