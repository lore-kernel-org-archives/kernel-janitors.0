From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 16 Oct 2020 15:29:09 +0000
Subject: Re: [PATCH] lightnvm: fix out-of-bounds write to array devices->info[]
Message-Id: <36ff7b17-eb2f-780d-17ca-269a8f5d4aac@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201016143351.677352-1-colin.king@canonical.com>
In-Reply-To: <20201016143351.677352-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Matias Bjorling <mb@lightnvm.io>, =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/16/20 8:33 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an off-by-one array check that can lead to a out-of-bounds
> write to devices->info[i].  Fix this by checking by using >= rather
> than > for the size check. Also replace hard-coded array size limit
> with ARRAY_SIZE on the array.

Applied, thanks.

-- 
Jens Axboe
