From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 31 May 2020 15:01:26 +0000
Subject: Re: [PATCH v2] power: supply: bq24190_charger: Fix runtime PM imbalance in bq24190_sysfs_store()
Message-Id: <e3faa9ac-c35e-41cc-a298-84ee81c74183@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, Sebastian Reichel <sre@kernel.org>

> pm_runtime_get_sync() increments the runtime PM usage counter even
> it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.

How do you think about a wording variant like the following?

   Change description:
   The PM runtime usage counter is incremented even if a call of
   the function “pm_runtime_get_sync” failed. Thus decrement it also
   in an error case so that the reference counting is kept consistent.


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
