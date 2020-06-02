From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jun 2020 08:40:33 +0000
Subject: Re: [PATCH] spi: spi-ti-qspi: call pm_runtime_put on pm_runtime_get failure
Message-Id: <26028f50-3fb8-eb08-3c9f-08ada018bf9e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-spi@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Mark Brown <broonie@kernel.org>, Dinghao Liu <dinghao.liu@zju.edu.cn>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> The counter is incremented via pm_runtime_get even in failure case.
> To correct the counter call pm_runtime_put in case of failure, too.

How do you think about a wording variant like the following?

   Change description:
   The PM runtime reference counter is generally incremented by a call of
   the function “pm_runtime_get_sync”.
   Thus call the function “pm_runtime_put_autosuspend” also in one error case
   to keep the reference counting consistent.


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
