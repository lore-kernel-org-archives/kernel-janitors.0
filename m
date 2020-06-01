From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 01 Jun 2020 08:37:23 +0000
Subject: Re: [PATCH] pwm: img: call pm_runtime_put in pm_runtime_get_sync failed case
Message-Id: <166b2437-748a-1c1a-2b7f-e1163e4855d0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Dinghao Liu <dinghao.liu@zju.edu.cn>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Even in failed case of pm_runtime_get_sync, the usage_count
> is incremented. In order to keep the usage_count with correct
> value call appropriate put.

* I suggest to adjust the word “usage_count” in this change description.

* Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
