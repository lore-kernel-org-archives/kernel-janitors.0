From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 14 Nov 2018 22:20:07 +0000
Subject: Re: [PATCH][next] block: clean up dead code that is now redundant
Message-Id: <4ec214ef-d434-df9a-2bb3-9bda2ef55fbe@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181114221705.17207-1-colin.king@canonical.com>
In-Reply-To: <20181114221705.17207-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/14/18 3:17 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The boolean next_sorted is set to false and is never changed, hence
> the code that checks if it is true is dead code and can now be
> removed.  This dead code occurred from a previous commit that cleaned
> up the elevator and removed the setting of next_sorted to true.

Ah nice, it's also the last "user" of q->nr_sorted, so that one can
go away as well.

-- 
Jens Axboe
