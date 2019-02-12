From: Jens Axboe <axboe@kernel.dk>
Date: Tue, 12 Feb 2019 16:13:29 +0000
Subject: Re: [PATCH v2] floppy: check_events callback should not return a negative number
Message-Id: <8bf64920-f0fe-b9da-8759-0d05a0fa39e0@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190129083404.47318-1-yuyufen@huawei.com>
In-Reply-To: <20190129083404.47318-1-yuyufen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yufen Yu <yuyufen@huawei.com>, dan.carpenter@oracle.com
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 1/29/19 1:34 AM, Yufen Yu wrote:
> floppy_check_events() is supposed to return bit flags to say which
> events occured. We should return zero to say that no event flags are
> set.  Only BIT(0) and BIT(1) are used in the caller. And .check_events
> interface also expect to return an unsigned int value.
> 
> However, after commit a0c80efe5956, it may return -EINTR (-4u).
> Here, both BIT(0) and BIT(1) are cleared. So this patch shouldn't
> affect runtime, but it obviously is still worth fixing.

Applied, thanks.

-- 
Jens Axboe
