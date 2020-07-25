From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 25 Jul 2020 11:35:54 +0000
Subject: Re: [PATCH] block: Fix reference count leak in blk_integrity_add
Message-Id: <6301315e-1613-0970-ce9b-019d18458819@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Yi Wang <wang.yi59@zte.com.cn>, Liao Pingfang <liao.pingfang@zte.com.cn>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Wang Liang <wang.liang82@zte.com.cn>, Xue Zhihong <xue.zhihong@zte.com.cn>

> kobject_init_and_add() takes reference even when it fails. If this
> function returns an error, kobject_put() must be called to properly
> clean up the memory associated with the object.

* An imperative wording can be preferred for the change description,
  can't it?

* Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
