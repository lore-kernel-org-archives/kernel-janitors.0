From: Jason Yan <yanaijie@huawei.com>
Date: Fri, 05 Jun 2020 09:05:52 +0000
Subject: Re: [PATCH v2] block: Fix use-after-free in blkdev_get()
Message-Id: <5fa658bf-3028-9b5c-30cc-dbdef6bf8f7a@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88676ff2-cb7e-70ec-4421-ecf8318990b1@web.de>
In-Reply-To: <88676ff2-cb7e-70ec-4421-ecf8318990b1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: hulkci@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>

Hi, Markus

Thanks for the review.

Sorry for the wording because I'm not an English native speaker.

在 2020/6/5 16:30, Markus Elfring 写道:

> 
> Would you like to add the tag “Fixes” to the commit message?
> 

I tried to find the commit in the git history which introduced this 
issue, but I am not sure which one is it. It seems existed there for a 
long time.

Thanks,
Jason


> Regards,
> Markus
> 
