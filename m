From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 27 Apr 2020 10:38:23 +0000
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: Avoid double lock for cp_rwsem during checkpoint
Message-Id: <07a820a2-b3b3-32ca-75ce-ceaca106d2c6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Sayali Lokhande <sayalil@codeaurora.org>, linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> … This results in deadlock as
> iput() tries to hold cp_rwsem, which is already held at the
> beginning by checkpoint->block_operations().

Will another imperative wording become helpful besides the provided information
for this change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=6a8b55ed4056ea5559ebe4f6a4b247f627870d4c#n151

Would you like to add the tag “Fixes” because of adjustments
for the data synchronisation?

Regards,
Markus
