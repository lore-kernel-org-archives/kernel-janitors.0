From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Jun 2020 08:30:35 +0000
Subject: Re: [PATCH v2] block: Fix use-after-free in blkdev_get()
Message-Id: <88676ff2-cb7e-70ec-4421-ecf8318990b1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jason Yan <yanaijie@huawei.com>, linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: hulkci@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>

> … released the refcount of the bdev (actually the refcount of
> the bdev inode).

Wording adjustments:
… released the reference count of the block device inode.


> … access bdev after …

… access block device after …


> accually bdev is …

bdev is …


> … This may leads to use-after-free if the refcount is …

… This results in an use after free if the reference count …


> following scenerio:

following scenario:


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
