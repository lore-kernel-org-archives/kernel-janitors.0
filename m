From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 28 May 2020 19:48:57 +0000
Subject: Re: [PATCH] nilfs2: Fix reference count leak in nilfs_sysfs_create_snapshot_group()
Message-Id: <30cf7534-b62e-84b1-571a-945aaffac5b0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qiushi Wu <wu000273@umn.edu>, linux-nilfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Kangjie Lu <kjlu@umn.edu>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Vyacheslav Dubeyko <Vyacheslav.Dubeyko@hgst.com>

> kobject_init_and_add() takes reference even when it fails.

It will be helpful to mention which object is referenced here, won't it?


> If this function returns an error, kobject_put() must be called to
> properly clean up the memory associated with the object.

I guess that an imperative wording is preferred also for this change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=b0c3ba31be3e45a130e13b278cf3b90f69bda6f6#n151

How do you think about to combine this update step together with
“nilfs2: Fix reference count leak in nilfs_sysfs_create_device_group”
into a small patch series?
https://lore.kernel.org/patchwork/patch/1248696/
https://lore.kernel.org/lkml/20200527200933.31135-1-wu000273@umn.edu/

Regards,
Markus
