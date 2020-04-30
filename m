From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 30 Apr 2020 11:56:23 +0000
Subject: Re: [PATCH v2] drm/mcde: dsi: Fix return value check in mcde_dsi_bind()
Message-Id: <7be53832-592b-7837-0688-0f1fb98673fb@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> The of_drm_find_bridge() function returns NULL on error, it doesn't return
> error pointers so this check doesn't work.

How do you think about a wording variant like the following?

   Change description:
   An error pointer check was performed after a call of the
   function “of_drm_find_bridge” despite of the detail
   that failures are indicated for the bridge search
   by null pointers instead.
   Thus adjust a check for the failure predicate
   and the corresponding exception handling.


Regards,
Markus
