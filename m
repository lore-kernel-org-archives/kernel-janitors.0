From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 12 Sep 2012 20:24:48 +0000
Subject: Re: [PATCH 2/9] block/blk-tag.c: Remove useless kfree
Message-Id: <5050EF90.2090802@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347462407-13499-2-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347462407-13499-2-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2012-09-12 17:06, Peter Senna Tschudin wrote:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
> 
> Remove useless kfree() and clean up code related to the removal.

Thanks, nice cleanup! Applied to for-3.7/core

-- 
Jens Axboe

