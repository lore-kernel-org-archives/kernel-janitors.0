From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 22 Jun 2020 07:52:22 +0000
Subject: Re: [PATCH v2] nbd: Fix memory leak in nbd_add_socket
Message-Id: <1a58ab81-3810-0763-7394-10b51add23ee@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b55f8af2-b20c-214f-90f0-9b6efcb7273c@web.de>
 <db17d022-a53a-3781-63d4-c38d5cf5b1e4@huawei.com>
In-Reply-To: <db17d022-a53a-3781-63d4-c38d5cf5b1e4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zheng Bin <zhengbin13@huawei.com>, linux-block@vger.kernel.org
Cc: nbd@other.debian.org, Aditya Pakki <pakki001@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <mccamant@cs.umn.edu>, Qiushi Wu <wu000273@umn.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Yi Zhang <yi.zhang@huawei.com>

>> Can an other wording variant be nicer?
>
> em, how about this?
>
>
> When adding first socket to nbd,

How do you think about to replace abbreviations by terms?


> if nsock's allocation fails,

… failed,


> config->socks is malloced

The data structure member “config->socks” was reallocated.


> but num_connections does not update,

But the data structure member “config->num_connections” was not updated.


> memory leak will occur(Function
> nbd_config_put will only free config->socks when num_connections is not 0).

A memory leak will occur then because the function “nbd_config_put”
will free “config->socks” only when “num_connections” is not zero.

Would you like to add an imperative wording to the commit message?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=625d3449788f85569096780592549d0340e9c0c7#n151

Regards,
Markus
