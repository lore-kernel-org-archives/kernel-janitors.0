From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 11 Jun 2020 15:16:28 +0000
Subject: Re: [PATCH] umem: remove redundant initialization of variable ret
Message-Id: <cec98bd3-9d88-60e9-21b3-b85d16348685@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200611143527.925712-1-colin.king@canonical.com>
In-Reply-To: <20200611143527.925712-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 6/11/20 8:35 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.

Applied, thanks.

-- 
Jens Axboe
