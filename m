From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 14 Jun 2020 11:31:09 +0000
Subject: Re: [PATCH] drm/panfrost: fix ref count leak in panfrost_job_hw_submit
Message-Id: <bb7c5ba8-92e5-c286-2599-a567597821bd@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Qiushi Wu <wu000273@umn.edu>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Steven Price <steven.price@arm.com>, Navid Emamdoost <emamd001@umn.edu>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Stephen McCamant <smccaman@umn.edu>

> in panfrost_job_hw_submit, …

* Can the term “reference count” become relevant also for this commit message
  besides other possible adjustments?

* Would you like to add the tag “Fixes”?


…
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
…
> @@ -184,6 +183,9 @@  static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  				job, js, jc_head);
>
>  	job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
> +out:
> +	pm_runtime_put_sync_autosuspend(pfdev->dev);
> +	return;
>  }
…

Perhaps use the label “put_sync” instead?

Regards,
Markus
