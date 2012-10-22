From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 22 Oct 2012 19:59:22 +0000
Subject: Re: [PATCH v2] vfs: fix: don't increase bio_slab_max if krealloc() fails
Message-Id: <5085A59A.8060206@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1350935616-24797-1-git-send-email-anna.m.leuschner@gmail.com>
In-Reply-To: <1350935616-24797-1-git-send-email-anna.m.leuschner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anna Leuschner <anna.m.leuschner@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2012-10-22 21:53, Anna Leuschner wrote:
> Without the patch, bio_slab_max, representing bio_slabs capacity, is
> increased before krealloc() of bio_slabs. If krealloc() fails,
> bio_slab_max is too high. Fix that by only updating bio_slab_max if
> krealloc() is successful.

That's a lot better, thanks!

-- 
Jens Axboe

