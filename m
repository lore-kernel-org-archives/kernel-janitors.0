From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 31 May 2020 16:06:42 +0000
Subject: Re: [PATCH] media: exynos4-is: Fix runtime PM imbalance in isp_video_open()
Message-Id: <3b8459ce-114b-f69a-b671-4f4cc0127fd6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>

> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.

How do you think about a wording variant like the following?

   Change description:
   The PM runtime usage counter is incremented even if a call of
   the function “pm_runtime_get_sync” failed. Thus decrement it also
   in an error case so that the reference counting is kept consistent.


Would you like to add the tag “Fixes” to the commit message?


Can it make sense to combine the software adjustment with the
update step “media: exynos4-is: Fix runtime PM imbalance in fimc_is_probe”?
https://lore.kernel.org/linux-arm-kernel/20200524025903.17219-1-dinghao.liu@zju.edu.cn/
https://lore.kernel.org/patchwork/patch/1246424/


…
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -293,6 +293,7 @@  static int isp_video_open(struct file *file)
 	if (!ret)
 		goto unlock;
 rel_fh:
+	pm_runtime_put_noidle(&isp->pdev->dev);
 	v4l2_fh_release(file);
 unlock:
…

Is there a need to use a label like “put_pm”?

Regards,
Markus
