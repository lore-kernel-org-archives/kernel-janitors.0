From: Jens Axboe <axboe@kernel.dk>
Date: Tue, 05 Jun 2018 15:20:14 +0000
Subject: Re: [PATCH][next] lightnvm: pblk: fix resource leak of invalid_bitmap
Message-Id: <5b0a3b83-5e7d-679e-f2a4-a9305da7c472@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180605151456.20359-1-colin.king@canonical.com>
In-Reply-To: <20180605151456.20359-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Matias Bjorling <mb@lightnvm.io>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 6/5/18 9:14 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the error exit path when the emeta could not be
> interpreted is via fail_free_ws and this fails to free
> invalid_bitmap.  Fix this by adding another exit label and
> exiting via this to kfree invalid_bitmap.
> 
> Detected by CoverityScan, CID#1469659 ("Resource leak")

Looks good, applied.

-- 
Jens Axboe

