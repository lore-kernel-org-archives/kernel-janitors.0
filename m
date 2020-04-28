From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 28 Apr 2020 16:15:26 +0000
Subject: Re: [PATCH] drm/mcde: dsi: Fix a return value check in mcde_dsi_bind()
Message-Id: <1900157b-39fe-e6fe-6fe7-26053a32f507@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> In case of error, the function of_drm_find_bridge() returns NULL pointer
> not ERR_PTR().

Such information is helpful.


> The IS_ERR() test in the return value check should be
> replaced with NULL test.

* Would you like to convert this description into an imperative wording?

* Please fix the patch subject according to a function name.

* How do you think about to add the tag “Fixes” to the commit message
  because of an adjustment for the error detection?

Regards,
Markus
