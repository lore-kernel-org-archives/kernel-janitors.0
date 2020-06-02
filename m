From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jun 2020 09:05:07 +0000
Subject: Re: [PATCH] spi: sprd: call pm_runtime_put if pm_runtime_get_sync fails
Message-Id: <8ea80af8-e964-4488-25c6-837f2ac88493@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-spi@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Baolin Wang <baolin.wang7@gmail.com>, Mark Brown <broonie@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Dinghao Liu <dinghao.liu@zju.edu.cn>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Call to pm_runtime_get_sync increments counter even in case of
> failure leading to incorrect ref count.
> Call pm_runtime_put_noidle if pm_runtime_get_sync fails.

How do you think about a wording variant like the following?

   Change description:
   The PM runtime reference counter is generally incremented by a call of
   the function “pm_runtime_get_sync”.
   Thus call the function “pm_runtime_put_noidle” also in one error case
   to keep the reference counting consistent.


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
