From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 24 Jul 2020 06:04:38 +0000
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix use-after-free issue in f2fs_put_super()
Message-Id: <9236e712-cd98-1f6c-4bcd-4dcabbae6461@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Li Guifu <bluce.liguifu@huawei.com>, Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> During umount, …

Do you refer to the action “unmount” here?


> f2fs_destroy_segment_manager(), it may cause …

Wording adjustments:
f2fs_destroy_segment_manager(). It might cause …


> … with procfs accessing, …

Avoid another typo?:
… with procfs accesses, …


> …, fix it by …

Please replace this wording by the tag “Fixes”.

Regards,
Markus
