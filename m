From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 23 Apr 2020 13:07:20 +0000
Subject: Re: [f2fs-dev] [PATCH] f2fs: Avoid double lock for cp_rwsem
Message-Id: <8f311cd7-bf6d-21a4-c085-6b2feec39717@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Sayali Lokhande <sayalil@codeaurora.org>, linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Call stack :
> f2fs_write_checkpoint()
> -> block_operations(sbi)
…

Will another imperative wording become helpful besides the provided information
for this change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=c578ddb39e565139897124e74e5a43e56538cb33#n151

How do you think about to add the tag “Fixes” because of adjustments
for the data synchronisation?

Regards,
Markus
