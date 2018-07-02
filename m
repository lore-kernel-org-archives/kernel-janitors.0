From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 02 Jul 2018 14:28:50 +0000
Subject: Re: [PATCH] paride: remove redundant variable n
Message-Id: <213e1e8a-d962-c4bf-cfbe-69ebb5628747@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180702081419.12207-1-colin.king@canonical.com>
In-Reply-To: <20180702081419.12207-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Tim Waugh <tim@cyberelk.net>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 7/2/18 2:14 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable n is being assigned but is never used hence it is redundant
> and can be removed. Also put spacing between variables in declaration
> to clean up checkpatch warnings.
> 
> Cleans up clang warning:
> warning: variable 'n' set but not used [-Wunused-but-set-variable]

Applied for 4.19, thanks.

-- 
Jens Axboe

