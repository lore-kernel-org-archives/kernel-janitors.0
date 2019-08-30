From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 30 Aug 2019 12:00:09 +0000
Subject: Re: Checking usage of likeliness annotations
Message-Id: <50c1dad3-c19c-3f95-405c-da7c6d0b7bf4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190830063838.GA144157@architecture4>
In-Reply-To: <20190830063838.GA144157@architecture4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gao Xiang <gaoxiang25@huawei.com>, Dan Carpenter <dan.carpenter@oracle.com>, devel@driverdev.osuosl.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Sasha Levin <alexander.levin@microsoft.com>, Denis Efremov <efremov@linux.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christoph Hellwig <hch@infradead.org>, Ogawa Hirofumi <hirofumi@mail.parknet.co.jp>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, Chao Yu <yuchao0@huawei.com>

> I'm also curious about that, what is the filesystem or kernel standard about
> likely/unlikely use (since I didn't find some documented standard
> so I used in my personal way,

Such information is helpful.


> I think it is reasonable at least to cover all error handling paths),

I hope so, too.

I imagine that the likeliness annotation usage could depend also on
software build parameters.
Would you occasionally like to influence corresponding probabilities
any more by system settings?


> maybe I'm an _idiot_

I hope not.


> as some earlier unfriendly word said somewhere
> so I'm too stupid to understand the implicit meaning of some document.

Can the software development discussion be continued in more constructive ways?

Regards,
Markus
