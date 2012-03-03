From: Jens Axboe <axboe@kernel.dk>
Date: Sat, 03 Mar 2012 18:44:17 +0000
Subject: Re: [patch] block, sx8: fix pointer math issue getting fw version
Message-Id: <4F526681.9040503@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120302190042.GB3951@elgon.mountain> <4F51C103.507@kernel.dk> <4F525086.60103@pobox.com>
In-Reply-To: <4F525086.60103@pobox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jgarzik@pobox.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2012-03-03 18:10, Jeff Garzik wrote:
> On 03/03/2012 01:58 AM, Jens Axboe wrote:
>> On 2012-03-02 20:00, Dan Carpenter wrote:
>>> "mem" is type u8.  We need parenthesis here or it screws up the pointer
>>> math probably leading to an oops.
>>
>> Applied, thanks Dan. I have marked it stable, too.
> 
> Please add Acked-by: Jeff Garzik <jgarzik@redhat.com>
> 
> It is rather obscure hardware, but I do still maintain the driver :)

Sure, added. I still have one in my drawer, btw, but it hasn't been
hooked up in ages :-)

-- 
Jens Axboe

