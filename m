From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 20 Jun 2018 17:26:16 +0000
Subject: Re: [PATCH] blk-mq-debugfs: Off by one in blk_mq_rq_state_name()
Message-Id: <5aed29c8-5125-cf15-b4b4-7f2c0057be36@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180620104503.nrwlfak3gyxjg7s2@kili.mountain>
In-Reply-To: <20180620104503.nrwlfak3gyxjg7s2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Bart Van Assche <bart.vanassche@wdc.com>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 6/20/18 4:45 AM, Dan Carpenter wrote:
> If rq_state = ARRAY_SIZE() then we read one element beyond the end of
> the blk_mq_rq_state_name_array[] array.

Applied, thanks Dan.

-- 
Jens Axboe

