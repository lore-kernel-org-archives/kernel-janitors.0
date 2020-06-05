From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 05 Jun 2020 11:10:57 +0000
Subject: Re: [PATCH v2] block: Fix use-after-free in blkdev_get()
Message-Id: <CA+icZUVFQaXGVtfGEO2=covaaRR2iKOTASsLEXv7+CsV5ibShQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88676ff2-cb7e-70ec-4421-ecf8318990b1@web.de> <5fa658bf-3028-9b5c-30cc-dbdef6bf8f7a@huawei.com>
 <20200605094353.GS30374@kadam>
In-Reply-To: <20200605094353.GS30374@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jason Yan <yanaijie@huawei.com>, Jan Kara <jack@suse.cz>, Markus Elfring <Markus.Elfring@web.de>, linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, hulkci@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>

On Fri, Jun 5, 2020 at 11:46 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> A lot of maintainers have blocked Markus and asked him to stop trying
> to help people write commit message.  Saying "bdev" instead of "block
> device" is more clear so your original message was better.
>
> The Fixes tag is a good idea though:
>
> Fixes: 89e524c04fa9 ("loop: Fix mount(2) failure due to race with LOOP_SET_FD")
>
> It broke last July.  Before that, we used to check if __blkdev_get()
> failed before dereferencing "bdev".
>
> I wonder if maybe the best fix is to re-add the "if (!res) " check back
> to blkdev_get().  The __blkdev_get() looks like it can also free "whole"
> though if it calls itself recursively and I don't really know this code
> so I can't say for sure...
>

In things of Fixes: tag...

For the first hunk I found:

commit 8266602033d6adc6d10cb8811c1fd694767909b0 ("fix bdev leak in
block_dev.c do_open()")

- Sedat -
