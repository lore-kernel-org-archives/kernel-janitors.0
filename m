From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 30 Apr 2020 09:30:38 +0000
Subject: Re: [PATCH] drm/vboxvideo: Fix a NULL vs IS_ERR() check in vbox_hw_init()
Message-Id: <32389e2b-50e8-8bd4-ee7c-5c6dfa273c00@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

> The devm_gen_pool_create() function returns ERR_PTR() on error, it
> doesn't return NULL so this check doesn't work.

How do you think about a wording variant like the following?

   Change description:
   A null pointer check was performed after a call of the
   function “devm_gen_pool_create” despite of the detail
   that failures are indicated by error pointers instead.
   Thus adjust a check for the failure predicate
   and return the corresponding error code.


Regards,
Markus
