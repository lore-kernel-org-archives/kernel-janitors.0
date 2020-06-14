From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 14 Jun 2020 12:16:50 +0000
Subject: Re: [PATCH] drm/vc4: fix ref count leak in vc4_dsi_encoder_enable
Message-Id: <a81cacf1-88e5-18d1-9d01-8e8d32f6f0a7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Qiushi Wu <wu000273@umn.edu>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> in vc4_dsi_encoder_enable, the call to pm_runtime_get_sync increments
> the counter even in case of failure, leading to incorrect
> ref count. In case of failure, decrement the ref count before returning.

* Can the term “reference count” become relevant also for this commit message
  besides other possible adjustments?

* Can it be nicer to combine proposed updates for this software module
  as a patch series (with a cover letter)?

* Would you like to add the tag “Fixes”?


…
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
…
> @@ -1088,6 +1088,8 @@  static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
>  		dev_info(&dsi->pdev->dev, "DSI regs after:\n");
>  		drm_print_regset32(&p, &dsi->regset);
>  	}
> +out:
> +	pm_runtime_put(dev);
>  }
…

* Perhaps use the label “put_runtime” instead?

* Do you propose to perform an additional function call always
  (and not only according to failure cases)?

* How do you think about calling the function “pm_runtime_put_noidle”?

Regards,
Markus
