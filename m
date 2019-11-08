From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 08 Nov 2019 13:54:43 +0000
Subject: Re: [PATCH] block: drbd: remove a stay unlock in __drbd_send_protocol()
Message-Id: <17fea9d1-39f8-1d91-5509-5f520009b9c9@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191107074847.GA11695@mwanda> <6906816.cRlsrm7Sor@fat-tyre>
In-Reply-To: <6906816.cRlsrm7Sor@fat-tyre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Reisner <philipp.reisner@linbit.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/8/19 3:46 AM, Philipp Reisner wrote:
> Hi Dan,
> 
> yes, your patch it obviously correct. The comment you are
> referring to is badly worded. We will remove it.
> 
> Jens,
> 
> are you taking this patch as it is?

Yep, I'll queue it up.

-- 
Jens Axboe
