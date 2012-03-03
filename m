From: Jeff Garzik <jgarzik@pobox.com>
Date: Sat, 03 Mar 2012 17:10:30 +0000
Subject: Re: [patch] block, sx8: fix pointer math issue getting fw version
Message-Id: <4F525086.60103@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120302190042.GB3951@elgon.mountain> <4F51C103.507@kernel.dk>
In-Reply-To: <4F51C103.507@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 03/03/2012 01:58 AM, Jens Axboe wrote:
> On 2012-03-02 20:00, Dan Carpenter wrote:
>> "mem" is type u8.  We need parenthesis here or it screws up the pointer
>> math probably leading to an oops.
>
> Applied, thanks Dan. I have marked it stable, too.

Please add Acked-by: Jeff Garzik <jgarzik@redhat.com>

It is rather obscure hardware, but I do still maintain the driver :)



