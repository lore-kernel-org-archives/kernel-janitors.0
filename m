From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 08 Nov 2018 13:17:46 +0000
Subject: Re: [PATCH][next] ms_block: remove unused pointer 'set'
Message-Id: <04ac11c4-9cbb-3d85-c26f-0fcd42fb4bb4@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181108110809.2145-1-colin.king@canonical.com>
In-Reply-To: <20181108110809.2145-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Maxim Levitsky <maximlevitsky@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/8/18 4:08 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer 'set' is declared but not used, remove it. Cleans up warning:
> 
> warning: unused variable ‘set’ [-Wunused-variable]

Thanks, applied.

-- 
Jens Axboe
