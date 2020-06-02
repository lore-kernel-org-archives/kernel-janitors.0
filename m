From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jun 2020 10:23:14 +0000
Subject: Re: [PATCH] media: staging: tegra-vde: add missing pm_runtime_put_autosuspend
Message-Id: <248e05e2-1df9-70f2-a6ac-f1af7de59a06@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, devel@driverdev.osuosl.org, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Navid Emamdoost <emamd001@umn.edu>, Thierry Reding <thierry.reding@gmail.com>, Qiushi Wu <wu000273@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>

> Call to pm_runtime_get_sync increments counter even in case of
> failure leading to incorrect ref count.
> Call pm_runtime_put_autosuspend if pm_runtime_get_sync fails.

How do you think about a wording variant like the following?

   Change description:
   The PM runtime reference counter is generally incremented by a call of
   the function “pm_runtime_get_sync”.
   Thus call the function “pm_runtime_put_autosuspend” also in one error case
   to keep the reference counting consistent.


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
