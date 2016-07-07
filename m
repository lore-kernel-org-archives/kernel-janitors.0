From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 07 Jul 2016 14:37:58 +0000
Subject: Re: [patch] nvmet: fix an error code
Message-Id: <577E6946.9010207@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160707081526.GA16742@mwanda>
In-Reply-To: <20160707081526.GA16742@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 07/07/2016 02:15 AM, Dan Carpenter wrote:
> We accidentally return zero here when ERR_PTR(-ENOMEM) is intended.
>
> Fixes: a07b4970f464 ('nvmet: add a generic NVMe target')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan, added.

-- 
Jens Axboe

