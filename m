From: Jens Axboe <axboe@kernel.dk>
Date: Tue, 18 Feb 2020 18:22:27 +0000
Subject: Re: [PATCH] io_uring: remove unnecessary NULL checks
Message-Id: <93921160-d063-83d3-1064-a70247def2ac@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200217143945.ua4lawkg22ggfihr@kili.mountain>
In-Reply-To: <20200217143945.ua4lawkg22ggfihr@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2/17/20 7:39 AM, Dan Carpenter wrote:
> The "kmsg" pointer can't be NULL and we have already dereferenced it so
> a check here would be useless.

Applied, thanks Dan.

-- 
Jens Axboe
