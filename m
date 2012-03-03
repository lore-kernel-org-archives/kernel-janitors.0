From: Jens Axboe <axboe@kernel.dk>
Date: Sat, 03 Mar 2012 06:58:11 +0000
Subject: Re: [patch] block, sx8: fix pointer math issue getting fw version
Message-Id: <4F51C103.507@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120302190042.GB3951@elgon.mountain>
In-Reply-To: <20120302190042.GB3951@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jeff Garzik <jgarzik@pobox.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2012-03-02 20:00, Dan Carpenter wrote:
> "mem" is type u8.  We need parenthesis here or it screws up the pointer
> math probably leading to an oops.

Applied, thanks Dan. I have marked it stable, too.

-- 
Jens Axboe

