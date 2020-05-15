From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 15 May 2020 15:08:24 +0000
Subject: Re: [PATCH] blkcg: Fix memory leak in blkg_conf_prep()
Message-Id: <4c670a6c-98c3-2b14-7438-09199506d92f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wu Bo <wubo40@huawei.com>, cgroups@vger.kernel.org, linux-block@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Feilong Lin <linfeilong@huawei.com>, Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, Zhiqiang Liu <liuzhiqiang26@huawei.com>

…
> new_blkg = blkg_alloc(pos, q, GFP_KERNEL);
…

I suggest to omit the source code quotation from the change description.


> if calling blkg_lookup_check() failed, at the IS_ERR block,
> the new_blkg should be free before goto lable fail_unlock
> in blkg_conf_prep() function.

How do you think about a wording variant like the following?

  If a call of the function “blkg_lookup_check” failed,
  release the previously allocated block group before jumping
  to the target “fail_unlock” in the implementation of
  the function “blkg_conf_prep”.


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
