From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 29 Nov 2018 15:17:20 +0000
Subject: Re: [PATCH 2/2] blk-mq: Add a NULL check in blk_mq_free_map_and_requests()
Message-Id: <6224d24a-a04c-ccdc-6adc-23da4d10eaa7@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181129105654.5icpvxx7p2kq257c@kili.mountain>
In-Reply-To: <20181129105654.5icpvxx7p2kq257c@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Omar Sandoval <osandov@fb.com>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/29/18 3:56 AM, Dan Carpenter wrote:
> I recently found some code which called blk_mq_free_map_and_requests()
> with a NULL set->tags pointer.  I fixed the caller, but it seems like a
> good idea to add a NULL check here as well.  Now we can call:
> 
> 	blk_mq_free_tag_set(set);
> 	blk_mq_free_tag_set(set);
> 
> twice in a row and it's harmless.

Applied, thanks.

-- 
Jens Axboe
