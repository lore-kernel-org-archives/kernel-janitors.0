From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 09 May 2020 08:00:13 +0000
Subject: Re: [PATCH 1/4] fs: btrfs: fix a data race in btrfs_block_group_done()
Message-Id: <ce41cc75-ee89-61fe-ef7d-6d527ea56e5a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jia-Ju Bai <baijiaju1990@gmail.com>, linux-btrfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>

> To fix this race, the spinlock cache->lock is used to protect the
> access to cache->cached in btrfs_block_group_done().

How do you think about to replace this wording by a variant like the following?

   Thus use the spin lock “cache->lock” to protect the access to
   the data structure member “cached” in the implementation of
   the function “btrfs_block_group_done”.


Would you like to add the tag “Fixes” to the change description?

Regards,
Markus
