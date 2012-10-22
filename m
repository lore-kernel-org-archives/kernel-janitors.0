From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 22 Oct 2012 18:40:45 +0000
Subject: Re: [PATCH] vfs: fix: don't increase bio_slab_max if krealloc() fails
Message-Id: <5085932D.4000108@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1350851609-10541-1-git-send-email-anna.m.leuschner@gmail.com>
In-Reply-To: <1350851609-10541-1-git-send-email-anna.m.leuschner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anna Leuschner <anna.m.leuschner@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2012-10-21 22:33, Anna Leuschner wrote:
> bio.c: fix: don't increase bio_slab_max if krealloc() of bio_slabs fails

You failed the "how to write a commit message" part of the patch :-)
The commit message should talk about WHY a change is necessary, not
HOW it is done. The latter should be obvious from looking at the code
change.

So, in other words, please describe why the change is useful or needed.
Then resend.

-- 
Jens Axboe

