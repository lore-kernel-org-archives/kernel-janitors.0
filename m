From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 18 May 2020 14:06:58 +0000
Subject: Re: [PATCH v2] blkcg: Fix memory leak in blkg_conf_prep()
Message-Id: <48c1964b-a939-b33f-2c47-90ac7069317a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1589805366-328489-1-git-send-email-wubo40@huawei.com>
In-Reply-To: <1589805366-328489-1-git-send-email-wubo40@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wu Bo <wubo40@huawei.com>, cgroups@vger.kernel.org, linux-block@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Feilong Lin <linfeilong@huawei.com>, Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, Zhiqiang Liu <liuzhiqiang26@huawei.com>

> If a call of the function blkg_lookup_check() failed,

Thanks that you would like to integrate something from my suggestion.


> we should be release the previously allocated block group

I find that an other wording would be preferred over “we should”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce#n151


> before jumping to the lable 'fail_unlock' in the implementation of

Please avoid another typo here.


> the function blkg_conf_prep().
>
> Suggested-by: Markus Elfring <Markus.Elfring@web.de>

I find this tag questionable because the bug fix was presented before.
https://lore.kernel.org/linux-block/4c670a6c-98c3-2b14-7438-09199506d92f@web.de/
https://lkml.org/lkml/2020/5/15/779


> ---
> V2: omit the source code quotation from
>     the change description

* I recommend to improve also the patch subject accordingly.

* Would you like to move the name from the previous tag into
  this information?


> ---
>  block/blk-cgroup.c | 1 +

I suggest to omit the triple dashes before this diffstat.

Regards,
Markus
