From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 01 Jun 2020 12:00:48 +0000
Subject: Re: [PATCH 1/2] ubifs: Fix potential memory leaks while iterating entries
Message-Id: <2bec05b7-78d3-fa36-134a-efbe977933e3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Richard Weinberger <richard@nod.at>, Yi Zhang <yi.zhang@huawei.com>

> Fix some potential memory leaks in error handling branches while
> iterating xattr entries.

Such information is useful.


> For example, function ubifs_tnc_remove_ino()
> forgets to free pxent if it exists. Similar problems also exist in
> ubifs_purge_xattrs(), ubifs_add_orphan() and ubifs_jnl_write_inode().

Can an other wording variant be a bit nicer?


I suggest to avoid the specification of duplicate function calls
(also for the desired exception handling).
Will it be helpful to add a few jump targets?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=77e6a8804abcc0504c904bd6e5cdf3a5cf8162#n455

Regards,
Markus
