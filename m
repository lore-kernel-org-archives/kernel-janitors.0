From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 08 Nov 2019 16:27:46 +0000
Subject: Re: [PATCH] block: drbd: remove a stay unlock in __drbd_send_protocol()
Message-Id: <26822f67-1cd7-eeda-2caa-2bc7d420f173@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191107074847.GA11695@mwanda>
 <3a2d491f-3d24-3673-07f3-f601d5fafc97@acm.org>
In-Reply-To: <3a2d491f-3d24-3673-07f3-f601d5fafc97@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <bvanassche@acm.org>, Dan Carpenter <dan.carpenter@oracle.com>, Philipp Reisner <philipp.reisner@linbit.com>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@tron.linbit.com, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/8/19 9:26 AM, Bart Van Assche wrote:
> On 11/6/19 11:48 PM, Dan Carpenter wrote:
>> There are two callers of this function and they both unlock the mutex so
>> this ends up being a double unlock.
> 
> Is there a typo in the patch subject (stay -> stray)?

I fixed that up while applying, fwiw.

-- 
Jens Axboe
