From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 29 May 2020 04:51:42 +0000
Subject: Re: nilfs2: Fix reference count leak in nilfs_sysfs_create_snapshot_group()
Message-Id: <b4e9eb17-7c5a-15ed-5ff7-2334ff13e9d7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <30cf7534-b62e-84b1-571a-945aaffac5b0@web.de>
 <CAMV6ehE3jm4ZasYqd12f=e0TNN_kfiX7yCMVHkmESKP0WbuqTw@mail.gmail.com>
In-Reply-To: <CAMV6ehE3jm4ZasYqd12f=e0TNN_kfiX7yCMVHkmESKP0WbuqTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qiushi Wu <wu000273@umn.edu>, linux-nilfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Kangjie Lu <kjlu@umn.edu>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Vyacheslav Dubeyko <Vyacheslav.Dubeyko@hgst.com>

> I think there is only one object that can be modified in this function,

Such a view can be reasonable.


> so I didn't mention it.

I suggest to reconsider the conclusion.


>> I guess that an imperative wording is preferred also for this change description.
>
> This sentence is referenced from the code comment, so I haven't change it.
> https://elixir.bootlin.com/linux/v5.7-rc7/source/lib/kobject.c#L459

I find that that there are further possibilities to consider for improvements
around the presented commit message (even after the mentioned copy
from the function description of this programming interface).


>> How do you think about to combine this update step together with
>> “nilfs2: Fix reference count leak in nilfs_sysfs_create_device_group”
>> into a small patch series?
>
> I'd like to improve the similar issues after I reporting this bunch of bugs.

Did you find questionable implementation details with the help of an evolving
source code analysis tool?

Regards,
Markus
