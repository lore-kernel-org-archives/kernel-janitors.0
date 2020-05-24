From: Jens Axboe <axboe@kernel.dk>
Date: Sun, 24 May 2020 16:44:17 +0000
Subject: Re: [PATCH][next] loop: remove redundant assignment to variable error
Message-Id: <9042a7ea-2d2b-9cb9-226b-266c35036701@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200524161043.20292-1-colin.king@canonical.com>
In-Reply-To: <20200524161043.20292-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 5/24/20 10:10 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable error is being assigned a value that is never
> read so the assignment is redundant and can be removed.

Plus, by definition, we already know that error is zero at the
time of assignment.

-- 
Jens Axboe
