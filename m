From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 27 May 2020 11:42:33 +0000
Subject: Re: [PATCH][next] block: blk-crypto-fallback: remove redundant initialization of variable err
Message-Id: <feb4f798-ce3b-6a08-e462-ab23bd223b18@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200526224902.63975-1-colin.king@canonical.com>
In-Reply-To: <20200526224902.63975-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 5/26/20 4:49 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.

Applied, thanks.

-- 
Jens Axboe
